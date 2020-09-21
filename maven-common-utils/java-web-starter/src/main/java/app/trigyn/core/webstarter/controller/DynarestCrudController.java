package app.trigyn.core.webstarter.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import app.trigyn.common.dbutils.repository.PropertyMasterDAO;
import app.trigyn.core.templating.service.DBTemplatingService;
import app.trigyn.core.templating.utils.TemplatingUtils;
import app.trigyn.core.templating.vo.TemplateVO;
import app.trigyn.core.webstarter.service.DynarestCrudService;

@RestController
@RequestMapping("/cf")
public class DynarestCrudController {
	
	private final static Logger logger = LogManager.getLogger(DynarestCrudController.class);

	@Autowired
    private DBTemplatingService templateService = null;

    @Autowired
    private TemplatingUtils templateEngine = null;
    
	@Autowired
	private PropertyMasterDAO propertyMasterDAO = null;
	
	@Autowired
	private DynarestCrudService dynarestCrudService = null;
    
    @GetMapping(value = "/dynl", produces = MediaType.TEXT_HTML_VALUE)
    public String loadDynarestListing() throws Exception {
        TemplateVO templateVO = templateService.getTemplateByName("dynarest-details-listing");
        Map<String,Object>  modelMap = new HashMap<>();
		String environment = propertyMasterDAO.findPropertyMasterValue("system", "system", "profile");
		modelMap.put("environment", environment);
        return templateEngine.processTemplateContents(templateVO.getTemplate(), templateVO.getTemplateName(), modelMap);
    }
    
	@PostMapping(value = "/ddr")
	public void downloadAllDynamicRestCodeToLocalDirectory(HttpSession session, HttpServletRequest request) throws Exception {
		 dynarestCrudService.downloadDynamicRestCode();
	}

	@PostMapping(value = "/udr")
	public void uploadAllDynamicRestCodesToDB(HttpSession session, HttpServletRequest request) throws Exception {
		 dynarestCrudService.uploadDynamicRestCode();
	}
    
}
