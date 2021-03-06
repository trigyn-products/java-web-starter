package com.trigyn.jws.webstarter.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Component;

import com.trigyn.jws.dbutils.vo.xml.FileUploadConfigExportVO;
import com.trigyn.jws.dbutils.vo.xml.FileUploadExportVO;
import com.trigyn.jws.dbutils.vo.xml.HelpManualTypeExportVO;
import com.trigyn.jws.dbutils.vo.xml.ManualEntryDetailsExportVO;
import com.trigyn.jws.dynamicform.dao.FileUploadRepository;
import com.trigyn.jws.dynamicform.dao.IFileUploadConfigRepository;
import com.trigyn.jws.dynamicform.dao.IManualEntryDetailsRepository;
import com.trigyn.jws.dynamicform.entities.FileUpload;
import com.trigyn.jws.dynamicform.entities.FileUploadConfig;
import com.trigyn.jws.dynamicform.entities.ManualEntryDetails;
import com.trigyn.jws.dynamicform.entities.ManualType;
import com.trigyn.jws.dynamicform.service.FilesStorageServiceImpl;
import com.trigyn.jws.webstarter.vo.HelpManual;

@Component
public class HelpManualImportExportModule {

	private Map<String, Map<String, Object>>	moduleDetailsMap				= new HashMap<>();

	@Autowired
	private IManualEntryDetailsRepository		iManualEntryDetailsRepository	= null;

	@Autowired
	private FileUploadRepository				fileUploadRepository			= null;

	@Autowired
	private IFileUploadConfigRepository			iFileUploadConfigRepository		= null;

	public void exportData(Object object, String folderLocation) throws Exception {
		ManualType					a_manualType		= (ManualType) object;

		List<ManualEntryDetails>	manualEntries		= iManualEntryDetailsRepository.findAllByManualType(a_manualType.getManualId());

		String						fileUploadConfigId	= null;

		if (!new File(folderLocation + File.separator + Constant.HELP_MANUAL_DIRECTORY_NAME).exists()) {
			File fileDirectory = new File(folderLocation + File.separator + Constant.HELP_MANUAL_DIRECTORY_NAME);
			fileDirectory.mkdirs();
		}

		List<ManualEntryDetailsExportVO> manualEntryDetailsVOList = new ArrayList<>();

		if (manualEntries != null) {
			for (ManualEntryDetails med : manualEntries) {
				List<FileUpload>			fileUploads				= fileUploadRepository
						.findAllByFileAssociationId(med.getManualEntryId());
				List<FileUploadExportVO>	fileUploadExportVOList	= new ArrayList<>();
				for (FileUpload fu : fileUploads) {
					fileUploadExportVOList.add(new FileUploadExportVO(fu.getFileUploadId(), fu.getPhysicalFileName(),
							fu.getOriginalFileName(), fu.getFilePath(), fu.getUpdatedBy(), fu.getLastUpdatedTs(), fu.getFileBinId(),
							fu.getFileAssociationId()));

					if (!new File(
							folderLocation + File.separator + Constant.HELP_MANUAL_DIRECTORY_NAME + File.separator + a_manualType.getName())
									.exists()) {
						File fileDirectory = new File(folderLocation + File.separator + Constant.HELP_MANUAL_DIRECTORY_NAME + File.separator
								+ a_manualType.getName());
						fileDirectory.mkdirs();
					}

					Path		downloadPath	= Paths.get(folderLocation + File.separator + Constant.HELP_MANUAL_DIRECTORY_NAME
							+ File.separator + a_manualType.getName());

					Path		fileRoot		= Paths.get(fu.getFilePath());
					Path		filePath		= fileRoot.resolve(fu.getPhysicalFileName());
					Resource	resource		= new UrlResource(filePath.toUri());
					InputStream	in;
					if (resource.exists() || resource.isReadable()) {
						File newFile = resource.getFile();
						in = new FileInputStream(newFile);
					} else {
						String filePathStr = fu.getFilePath() + "/" + fu.getPhysicalFileName();
						in = FilesStorageServiceImpl.class.getResourceAsStream(filePathStr);
						if (in == null) {
							throw new RuntimeException("Could not read the file!");
						}
					}
					Files.deleteIfExists(downloadPath.resolve(fu.getPhysicalFileName()));
					Files.copy(in, downloadPath.resolve(fu.getPhysicalFileName()));
				}

				manualEntryDetailsVOList.add(new ManualEntryDetailsExportVO(med.getManualEntryId(), med.getManualType(), med.getEntryName(),
						StringEscapeUtils.unescapeXml("<![CDATA[" + med.getEntryContent().trim() + "]]>"), med.getSortIndex(),
						med.getLastUpdatedBy(), med.getLastModifiedOn(), fileUploadExportVOList));

				fileUploadConfigId = fileUploads.get(0).getFileBinId();
			}
		}
		FileUploadConfigExportVO fileUploadConfigExportVO = null;
		if (fileUploadConfigId != null) {
			FileUploadConfig fileUploadConfig = iFileUploadConfigRepository.findById(fileUploadConfigId)
					.orElseThrow(() -> new Exception("file not found with id : "));
			fileUploadConfigExportVO = new FileUploadConfigExportVO(fileUploadConfig.getFileBinId(), fileUploadConfig.getFileTypSupported(),
					fileUploadConfig.getMaxFileSize(), fileUploadConfig.getNoOfFiles(),
					StringEscapeUtils.unescapeXml("<![CDATA[" + fileUploadConfig.getSelectQueryContent().trim() + "]]>"),
					StringEscapeUtils.unescapeXml("<![CDATA[" + fileUploadConfig.getUploadQueryContent().trim() + "]]>"),
					StringEscapeUtils.unescapeXml("<![CDATA[" + fileUploadConfig.getViewQueryContent().trim() + "]]>"),
					StringEscapeUtils.unescapeXml("<![CDATA[" + fileUploadConfig.getDeleteQueryContent().trim() + "]]>"),
					fileUploadConfig.getIsDeleted(), fileUploadConfig.getLastUpdatedBy(), fileUploadConfig.getLastUpdatedTs());
		}

		HelpManualTypeExportVO	helpManualTypeVO	= new HelpManualTypeExportVO(a_manualType.getManualId(), a_manualType.getName(),
				a_manualType.getIsSystemManual(), manualEntryDetailsVOList, fileUploadConfigExportVO);

		Map<String, Object>		map					= new HashMap<>();
		map.put("moduleName", a_manualType.getName());
		map.put("moduleObject", helpManualTypeVO);
		moduleDetailsMap.put(a_manualType.getManualId(), map);

	}

	public HelpManual importData(String folderLocation, String uploadFileName, String uploadID, Object importObject) {
		HelpManual							helpManual				= null;

		HelpManualTypeExportVO				helpManualTypeExportVO	= (HelpManualTypeExportVO) importObject;
		String								manualId				= helpManualTypeExportVO.getManualId();
		String								name					= helpManualTypeExportVO.getName();
		Integer								isSystemManual			= helpManualTypeExportVO.getIsSystemManual();
		List<ManualEntryDetailsExportVO>	manualEntriesVO			= helpManualTypeExportVO.getManualEntries();
		FileUploadConfigExportVO			fileUploadConfigVO		= helpManualTypeExportVO.getFileUploadConfig();

		ManualType							manualType				= new ManualType(manualId, name, isSystemManual);

		FileUploadConfig					fileUploadConfig		= null;
		if (fileUploadConfigVO != null) {
			fileUploadConfig = new FileUploadConfig(fileUploadConfigVO.getFileBinId(), fileUploadConfigVO.getFileTypSupported(),
					fileUploadConfigVO.getMaxFileSize(), fileUploadConfigVO.getNoOfFiles(), fileUploadConfigVO.getSelectQueryContent(),
					fileUploadConfigVO.getUploadQueryContent(), fileUploadConfigVO.getViewQueryContent(),
					fileUploadConfigVO.getDeleteQueryContent(), fileUploadConfigVO.getDataSourceId(), fileUploadConfigVO.getIsDeleted(),
					fileUploadConfigVO.getCreatedBy(), fileUploadConfigVO.getCreatedDate(), fileUploadConfigVO.getUpdatedBy(),
					fileUploadConfigVO.getUpdatedDate());
		}

		List<ManualEntryDetails>	manualEntryDetails	= new ArrayList<>();
		List<FileUpload>			fileUploads			= new ArrayList<>();

		if (manualEntriesVO != null) {
			for (ManualEntryDetailsExportVO medVO : manualEntriesVO) {
				ManualEntryDetails med = new ManualEntryDetails(medVO.getManualEntryId(), medVO.getManualType(), medVO.getEntryName(),
						medVO.getEntryContent(), medVO.getSortIndex(), medVO.getLastUpdatedBy(), medVO.getLastModifiedOn());
				manualEntryDetails.add(med);

				for (FileUploadExportVO fueVO : medVO.getFileUploadList()) {
					FileUpload fu = new FileUpload(fueVO.getFileUploadId(), fueVO.getPhysicalFileName(), fueVO.getOriginalFileName(),
							fueVO.getFilePath(), fueVO.getUpdatedBy(), fueVO.getFileBinId(), fueVO.getFileAssociationId());
					fileUploads.add(fu);
				}
			}
		}
		helpManual = new HelpManual(manualType, manualEntryDetails, fileUploads, fileUploadConfig);

		return helpManual;
	}

	public Map<String, Map<String, Object>> getModuleDetailsMap() {
		return moduleDetailsMap;
	}

	public void setModuleDetailsMap(Map<String, Map<String, Object>> moduleDetailsMap) {
		this.moduleDetailsMap = moduleDetailsMap;
	}

}
