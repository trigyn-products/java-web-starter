package com.trigyn.jws.dbutils.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.trigyn.jws.dbutils.entities.ModuleListing;
import com.trigyn.jws.dbutils.entities.ModuleListingI18n;
import com.trigyn.jws.dbutils.entities.ModuleListingI18nPK;
import com.trigyn.jws.dbutils.repository.IModuleListingI18nRepository;
import com.trigyn.jws.dbutils.repository.IModuleListingRepository;
import com.trigyn.jws.dbutils.repository.IModuleTargetLookupRepository;
import com.trigyn.jws.dbutils.repository.ModuleDAO;
import com.trigyn.jws.dbutils.repository.UserRoleRepository;
import com.trigyn.jws.dbutils.utils.Constant;
import com.trigyn.jws.dbutils.vo.ModuleDetailsVO;
import com.trigyn.jws.dbutils.vo.ModuleTargetLookupVO;
import com.trigyn.jws.dbutils.vo.UserRoleVO;

@Service
@Transactional(readOnly = false)
public class ModuleService {

	@Autowired
	private IModuleListingRepository iModuleListingRepository 			= null;
	
	@Autowired
	private IModuleListingI18nRepository iModuleListingI18nRepository 	= null;
	
	@Autowired
	private IModuleTargetLookupRepository iModuleTargetLookupRepository = null;
	
	@Autowired
	private ModuleDAO moduleDAO											= null;
	
    @Autowired
    private UserRoleRepository userRoleRepository						= null; 
    
	
	public ModuleDetailsVO getModuleDetails(String moduleId) throws Exception{
		if(moduleId != null && !moduleId.isBlank() && !moduleId.isEmpty()) {
			return iModuleListingRepository.getModuleDetails(moduleId, Constant.DEFAULT_LANGUAGE_ID ,Constant.DEFAULT_LANGUAGE_ID);
		}		
		return null;
	}
	
	
	public List<ModuleDetailsVO> getAllMenuModules() throws Exception{
		return iModuleListingRepository.getAllModulesDetails(Constant.DEFAULT_LANGUAGE_ID ,Constant.DEFAULT_LANGUAGE_ID);
	}
	
	
	public List<ModuleDetailsVO> getAllModules(String moduleId) throws Exception{
		List<ModuleDetailsVO> moduleDetailsVOList  = new ArrayList<>();
		List<ModuleDetailsVO> moduleDetailsVOs  = new ArrayList<>();
		moduleDetailsVOList = iModuleListingRepository.getAllModules(Constant.DEFAULT_LANGUAGE_ID ,Constant.DEFAULT_LANGUAGE_ID);
		if(moduleId != null && !moduleId.isBlank() && !moduleId.isEmpty()) {
			for (ModuleDetailsVO moduleDetailsVO : moduleDetailsVOList) {
				if(!moduleDetailsVO.getModuleId().equals(moduleId)) {
					moduleDetailsVOs.add(moduleDetailsVO);
				}
			}
			return moduleDetailsVOs;
		}
		return moduleDetailsVOList;
	}
	
	
	public List<ModuleTargetLookupVO> getAllModuleLookUp() throws Exception{
		return iModuleTargetLookupRepository.getAllModuleTargetLookup();
	}
	
	
	
	public List<UserRoleVO> getAllUserRoles() throws Exception{
		return userRoleRepository.getAllActiveRoles(Constant.RecordStatus.INSERTED.getStatus());
	}
	
	
	public String saveModuleDetails(ModuleDetailsVO moduleDetailsVO) throws Exception {
		ModuleListing moduleListing = convertModuleVOToEntitity(moduleDetailsVO);
		ModuleListingI18n moduleListingI18n = convertModuleVOToI18nEntitity(moduleDetailsVO);
		iModuleListingRepository.saveAndFlush(moduleListing);
		ModuleListingI18nPK moduleListingI18nPK = moduleListingI18n.getId();
		moduleListingI18nPK.setModuleId(moduleListing.getModuleId());
		iModuleListingI18nRepository.save(moduleListingI18n);
		return moduleListing.getModuleId();
	}
	
	public Map<String, Object> getExistingModuleData(String moduleName, String parentModuleId, Integer sequence, String moduleURL) throws Exception {
		Map<String, Object> moduleDetailsMap = new HashMap<>();
		String moduleId = getModuleIdByName(moduleName, Constant.DEFAULT_LANGUAGE_ID, Constant.DEFAULT_LANGUAGE_ID);
		if(!StringUtils.isBlank(moduleId)) {
			moduleDetailsMap.put("moduleIdName", moduleId);
		}
		moduleId = getModuleIdBySequence(parentModuleId, sequence);
		if(!StringUtils.isBlank(moduleId)) {
			moduleDetailsMap.put("moduleIdSequence", moduleId);
		}
		
		if(!StringUtils.isBlank(moduleURL) && !moduleURL.equals(Constant.GROUP_MODULE_URL)) {
			moduleId = getModuleIdByURL(moduleURL);
			if(!StringUtils.isBlank(moduleId)) {
				moduleDetailsMap.put("moduleIdURL", moduleId);
			}
		}
		return moduleDetailsMap;
	}
	
	public String getModuleIdByName(String moduleName, Integer languageId, Integer defaultLanguageId) throws Exception {
		return iModuleListingRepository.getModuleIdByName(moduleName, languageId, defaultLanguageId);
	}
	
	public String getModuleIdBySequence(String parentModuleId, Integer sequence) throws Exception {
		if(!StringUtils.isBlank(parentModuleId)) {
			return iModuleListingRepository.getParentModuleIdBySequence(parentModuleId, sequence);
		}else {
			return iModuleListingRepository.getModuleIdBySequence(sequence);
		}
		
	}
	
	
	public String getModuleIdByURL(String moduleURL) throws Exception {
		return iModuleListingRepository.getModuleIdByURL(moduleURL);
	}
	
	
	
	private ModuleListing convertModuleVOToEntitity(ModuleDetailsVO moduleDetailsVO) {
		ModuleListing moduleListing = new ModuleListing();
		
		if(!StringUtils.isBlank(moduleDetailsVO.getModuleId())) {
			moduleListing.setModuleId(moduleDetailsVO.getModuleId());
		}
		if(!StringUtils.isBlank(moduleDetailsVO.getParentModuleId())) {
			moduleListing.setParentId(moduleDetailsVO.getParentModuleId());
		}
		moduleListing.setModuleUrl(moduleDetailsVO.getModuleURL());
		moduleListing.setSequence(moduleDetailsVO.getSequence());
		moduleListing.setTargetLookupId(moduleDetailsVO.getTargetLookupId());
		if(!StringUtils.isBlank(moduleDetailsVO.getTargetTypeId())) {
			moduleListing.setTargetTypeId(moduleDetailsVO.getTargetTypeId());
		}
		return moduleListing;
    }
	
	
	private ModuleListingI18n convertModuleVOToI18nEntitity(ModuleDetailsVO moduleDetailsVO) {
		ModuleListingI18n moduleListingI18n = new ModuleListingI18n();
		ModuleListingI18nPK moduleListingI18nPK = new ModuleListingI18nPK();
		if(moduleDetailsVO.getModuleId() != null && !moduleDetailsVO.getModuleId().isBlank() && !moduleDetailsVO.getModuleId().isEmpty()) {
			moduleListingI18nPK.setModuleId(moduleDetailsVO.getModuleId());
		}
		moduleListingI18nPK.setLanguageId(Constant.DEFAULT_LANGUAGE_ID);
		moduleListingI18n.setId(moduleListingI18nPK);
		moduleListingI18n.setModuleName(moduleDetailsVO.getModuleName());
		return moduleListingI18n;
    }


	
	public List<Map<String, Object>> getTargetTypes(Integer targetLookupId, String targetTypeId) throws Exception {
		List<Map<String, Object>> targetTypeMapList = new ArrayList<>();
		if(targetLookupId != null) {
			targetTypeMapList = moduleDAO.findTargetTypeDetails(targetLookupId, targetTypeId);
		}
		return targetTypeMapList;
	}
	
	public Map<String, Object> getModuleTargetTypeName(String moduleURL) throws Exception {
		Map<String, Object> moduleDetailsMap = new HashMap<>();
		ModuleDetailsVO moduleDetailsVO = iModuleListingRepository.getTargetTypeDetails(moduleURL);
		List<Map<String, Object>> targetTypeList = moduleDAO.findTargetTypeDetails(moduleDetailsVO.getTargetLookupId(), moduleDetailsVO.getTargetTypeId());
		moduleDetailsMap.put("targetLookupId", moduleDetailsVO.getTargetLookupId());
		if(!CollectionUtils.isEmpty(targetTypeList)) {
			moduleDetailsMap.put("targetTypeId", targetTypeList.get(0).get("targetTypeId"));
        	moduleDetailsMap.put("targetTypeName", targetTypeList.get(0).get("targetTypeName"));
		}
		return moduleDetailsMap;
	}
    
}