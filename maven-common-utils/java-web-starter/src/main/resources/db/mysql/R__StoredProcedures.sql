REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts)
VALUES ("autocompleteListingGrid", 'Autocomplete Details Listing', 'Autocomplete Details Listing', 'autocompleteListing',
'autocompleteId,autocompleteDescription,lastUpdatedBy,autocompleteTypeId', 2, 'aar.dev@trigyn.com', NOW(), NOW());


REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("dashboardMasterListingGrid", 'Dashboard Master Listing', 'Dashboard Master', 'dashboardMasterListing'
,'dashboardName,dashboardType,contextDescription,createdDate,createdBy,lastUpdatedTs', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("dashletMasterListingGrid", 'Dashlet Master Listing', 'Dashlet Master', 'dashletMasterListing'
,'dashletName,dashletTitle,dashletTypeId,createdDate,createdBy,lastUpdatedTs,updatedBy,status', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details (grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts)
VALUES ("dynamicFormListingGrid", 'Dynamic Form Master', 'Dynamic Form Master Listing', 'dynamicFormListing'
,'formId,formName,formDescription,formTypeId,createdDate,createdBy', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("templateListingGrid", 'Template Listing', 'Template Listing', 'templateListing'
,'templateName,templateTypeId,createdBy,updatedBy', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("resourceBundleListingGrid", 'DB Resource Bundle Listing', 'DB Resource Bundle Listing', 'dbResourceListing'
,'resourceKey,languageName,resourceBundleText', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts)
VALUES ("gridDetailsListing", 'Grid Details Listing', 'Grid Details Listing', 'gridDetails'
,'gridId,gridName,gridDesc,gridTableName,gridColumnName,gridTypeId', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts)
VALUES ("notificationDetailsListing", 'Notification Details Listing', 'Notification Details Listing', 'notificationlisting'
,'targetPlatform,messageType,validFrom,messageText,validTill,messageFormat,selectionCriteria,updatedBy,updatedDate', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts)
VALUES ("moduleListingGrid", 'Menu Module Listing', 'Menu Module Listing', 'moduleListing'
,'moduleId,moduleName,moduleURL,parentModuleName,sequence,isInsideMenu,moduleTypeId', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, query_type, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("dynarestGrid", 'Dynamic Rest API listing', 'Dynamic Rest API listing', 'jq_dynamic_rest_details'
,'jws_dynamic_rest_id,jws_dynamic_rest_url,jws_method_name,jws_method_description,jws_request_type_id,jws_platform_id,jws_dynamic_rest_type_id', 1, 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, query_type, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("propertyMasterListing", 'Property master listing', 'Property master listing', 'jq_property_master','*', 1, 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("fileUploadConfigGrid", 'File Upload Config', 'File Upload Config', 'fileUploadConfigListing'
,'fileBinId,fileTypeSupported,maxFileSize,noOfFiles,lastUpdatedBy', 2, 'aar.dev@trigyn.com', NOW(), NOW());

REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("propertyMasterListingGrid", 'Property Master Listing', 'Property Master Listing', 'propertyMasterListing'
,'ownerType,ownerId,propertyName,propertyValue,modifiedBy,appVersion,comments', 2, 'aar.dev@trigyn.com', NOW(), NOW());
 
REPLACE INTO jq_grid_details(grid_id, grid_name, grid_description, grid_table_name, grid_column_names, grid_type_id, created_by, created_date, last_updated_ts) 
VALUES ("dynarestListingGrid", 'Dynamic REST API Listing', 'Dynamic REST API Listing', 'dynarestListing'
,'dynarestUrl,rbacId,methodName,methodDescription,requestTypeId,producerTypeId,serviceLogic,platformId,allowFiles,dynarestTypeId', 2, 'aar.dev@trigyn.com', NOW(), NOW()); 

DROP PROCEDURE IF EXISTS autocompleteListing;
CREATE PROCEDURE autocompleteListing(autocompleteId VARCHAR(100), autocompleteDescription varchar(500), lastUpdatedBy VARCHAR(500), autocompleteTypeId INT(11) ,forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = ' SELECT au.ac_id AS autocompleteId, au.ac_description AS autocompleteDescription, au.ac_select_query AS acQuery, au.last_updated_by AS lastUpdatedBy ';
  SET @resultQuery = CONCAT(@resultQuery, ', au.last_updated_ts AS lastUpdatedTs, au.ac_type_id AS autocompleteTypeId, COUNT(jmv.version_id) AS revisionCount ');
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @fromString  = ' FROM jq_autocomplete_details au ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = au.ac_id AND jmv.entity_name = 'jq_autocomplete_details' ");
  SET @whereString = ' ';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT autocompleteId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND au.ac_id LIKE ''%',autocompleteId,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE au.ac_id LIKE ''%',autocompleteId,'%''');
    END IF;  
  END IF;
  
  IF NOT lastUpdatedBy IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND au.last_updated_ts LIKE ''%',lastUpdatedBy,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE au.last_updated_ts LIKE ''%',lastUpdatedBy,'%''');
    END IF;  
  END IF;
  
  IF NOT autocompleteDescription IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND au.ac_description LIKE ''%',autocompleteDescription,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE au.ac_description LIKE ''%',autocompleteDescription,'%''');
    END IF;  
  END IF;
  
  IF NOT autocompleteTypeId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND au.ac_type_id = ',autocompleteTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE au.ac_type_id = ',autocompleteTypeId);
    END IF;  
  END IF;
  
  SET @groupByString = ' GROUP BY au.ac_id ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('select count(*) from ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
END;


DROP PROCEDURE IF EXISTS dbResourceListing;
CREATE PROCEDURE dbResourceListing(resourceKey VARCHAR(100), languageName VARCHAR(100), resourceBundleText TEXT, forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @selectQuery = ' SELECT rb.resource_key AS resourceKey, lang.language_name AS languageName, rb.`text` AS resourceBundleText, COUNT(jmv.version_id) AS revisionCount ';
  SET @selectQuery = CONCAT(@selectQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @fromString  = ' FROM jq_resource_bundle AS rb INNER JOIN jq_language AS lang ON lang.language_id = rb.language_id ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = rb.resource_key AND jmv.entity_name = 'jq_resource_bundle' ");
  
  IF languageName IS NULL THEN  
    SET @whereString = ' WHERE lang.language_id = 1 ';
  ELSEIF NOT languageName IS NULL THEN  
    SET @languageName= REPLACE(languageName,"'","''");
    SET @whereString = CONCAT(' WHERE lang.language_name LIKE ''%',@languageName,'%''');
  END IF;
  
  IF NOT resourceKey IS NULL THEN
    SET @resourceKey= REPLACE(resourceKey,"'","''");
    SET @whereString = CONCAT(@whereString,' AND rb.resource_key LIKE ''%',@resourceKey,'%''');
  END IF;
  
  IF NOT resourceBundleText IS NULL THEN
    SET @resourceBundleText= REPLACE(resourceBundleText,"'","''");
    SET @whereString = CONCAT(@whereString,' AND rb.text LIKE ''%',@resourceBundleText,'%''');
  END IF;
  
  SET @groupByString = ' GROUP BY rb.resource_key ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY resourceKey ASC');
  END IF;
  
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@selectQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@selectQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
END;


DROP PROCEDURE IF EXISTS dashboardMasterListing;
CREATE PROCEDURE dashboardMasterListing(dashboardName varchar(50), dashboardType varchar(100), contextDescription varchar(1000)
,createdDate varchar(100), createdBy varchar(100),lastUpdatedTs varchar(100), forCount INT, limitFrom INT, limitTo INT
,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN
DECLARE db_format VARCHAR(20);


  SET @resultQuery = CONCAT(" SELECT db.dashboard_id AS dashboardId, db.dashboard_name AS dashboardName, db.dashboard_type AS dashboardType "
  ," , db.created_by AS createdBy "
  ," ,cm.context_description AS contextDescription, COUNT(jmv.version_id) AS revisionCount ") ;
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @resultQuery = CONCAT(@resultQuery, ', db.created_date AS createdDate ');
  SET @resultQuery = CONCAT(@resultQuery, ', db.last_updated_ts AS lastUpdatedTs ');
  SET @fromString  = ' FROM jq_dashboard AS db INNER JOIN jq_context_master cm ON db.context_id = cm.context_id ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version jmv ON jmv.entity_id = db.dashboard_id AND jmv.entity_name = 'jq_dashboard' ");
  SET @whereString = ' WHERE db.is_deleted = 0';
  
  IF NOT dashboardName IS NULL THEN
    SET @dashboardName= REPLACE(dashboardName,"'","''");
    SET @whereString = CONCAT(@whereString,' AND db.dashboard_name like ''%',@dashboardName,'%''');
  END IF;
  
  IF NOT dashboardType IS NULL THEN
    SET @dashboardType= REPLACE(dashboardType,"'","''");
    SET @whereString = CONCAT(@whereString,' AND db.dashboard_type like ''%',@dashboardType,'%''');
  END IF;
  
  IF NOT createdDate IS NULL THEN
    SET @createdDate= REPLACE(createdDate,"'","''");
    SET @whereString = CONCAT(@whereString,' AND db.created_date like ''%',@createdDate,'%''');
  END IF;
  
  IF NOT lastUpdatedTs IS NULL THEN
    SET @lastUpdatedTs= REPLACE(lastUpdatedTs,"'","''");
    SET @whereString = CONCAT(@whereString,' AND db.last_updated_ts like ''%',@lastUpdatedTs,'%''');
  END IF;

  IF NOT contextDescription IS NULL THEN
    SET @contextDescription= REPLACE(contextDescription,"'","''");
    SET @whereString = CONCAT(@whereString,' AND cm.context_description like ''%',@contextDescription,'%''');
  END IF;
  
  IF NOT dashboardType IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND db.dashboard_type = ',dashboardType);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE db.dashboard_type = ',dashboardType);
    END IF;  
  END IF;
  
  
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  SET @groupByString = ' GROUP BY db.dashboard_id ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
 
END;

DROP PROCEDURE IF EXISTS dashletMasterListing;
CREATE PROCEDURE dashletMasterListing(dashletName varchar(50), dashletTitle varchar(100),dashletTypeId INT(11),createdDate varchar(100),createdBy varchar(100),lastUpdatedTs varchar(100),updatedBy varchar(100),status INT, forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN
DECLARE db_format VARCHAR(20);


  SET @resultQuery = CONCAT("SELECT dl.dashlet_id AS dashletId, dl.dashlet_title AS dashletTitle,dl.dashlet_name AS dashletName, "
  ," dl.updated_by AS updatedBy, dl.created_by AS createdBy,dl.is_active AS status, COUNT(jmv.version_id) AS revisionCount ") ;
  SET @resultQuery = CONCAT(@resultQuery, ', dl.dashlet_type_id AS dashletTypeId ');
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @resultQuery = CONCAT(@resultQuery, ', dl.created_date AS createdDate');
  SET @resultQuery = CONCAT(@resultQuery, ', dl.last_updated_ts AS lastUpdatedTs ');
  SET @fromString  = ' FROM jq_dashlet AS dl';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version jmv ON jmv.entity_id = dl.dashlet_id AND jmv.entity_name = 'jq_dashlet' ");
  SET @whereString = '';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  
  IF NOT dashletName IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND dl.dashlet_name LIKE ''%',dashletName,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE dl.dashlet_name LIKE ''%',dashletName,'%''');
    END IF;  
  END IF;
  
  IF NOT dashletTitle IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND dl.dashlet_title LIKE ''%',dashletTitle,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE dl.dashlet_title LIKE ''%',dashletTitle,'%''');
    END IF;  
  END IF;
  
  IF NOT createdDate IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND date_format(dl.created_date,''',@dateFormat,''') LIKE ''%',createdDate,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE date_format(dl.created_date,''',@dateFormat,''') LIKE ''%',createdDate,'%''');
    END IF;  
  END IF;
  
  IF NOT createdBy IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND dl.created_by LIKE ''%',createdBy,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE dl.created_by LIKE ''%',createdBy,'%''');
    END IF;  
  END IF;
  
    IF NOT lastUpdatedTs IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND date_format(dl.last_updated_ts,''',@dateFormat,''') LIKE ''%',lastUpdatedTs,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE date_format(dl.last_updated_ts,''',@dateFormat,''') LIKE ''%',lastUpdatedTs,'%''');
    END IF;  
  END IF;
  
  IF NOT updatedBy IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND dl.updated_by LIKE ''%',updatedBy,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE dl.updated_by LIKE ''%',updatedBy,'%''');
    END IF;  
  END IF;
  
  
  IF NOT status IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND dl.is_active LIKE ''%',status,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE dl.is_active LIKE ''%',status,'%''');
    END IF;  
  END IF; 
  
  IF NOT dashletTypeId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND dl.dashlet_type_id = ',dashletTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE dl.dashlet_type_id = ',dashletTypeId);
    END IF;  
  END IF;
  
  SET @groupByString = ' GROUP BY dl.dashlet_id ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt; 

END;

DROP PROCEDURE IF EXISTS dynamicFormListing;
CREATE PROCEDURE dynamicFormListing(formId VARCHAR(50), formName varchar(50), formDescription varchar(100),formTypeId INT(11),createdDate varchar(100),createdBy varchar(100), forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = CONCAT("SELECT df.form_id AS formId, df.form_description AS formDescription,df.form_name AS formName, "
  ," df.created_by AS createdBy ") ;
  SET @resultQuery = CONCAT(@resultQuery, ', df.form_type_id AS formTypeId, COUNT(jmv.version_id) AS revisionCount  '); 
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @resultQuery = CONCAT(@resultQuery, ', df.created_date AS createdDate, df.last_updated_ts AS lastUpdatedTs  ');
  SET @fromString  = ' FROM jq_dynamic_form AS df ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version  jmv ON jmv.entity_id = df.form_id AND jmv.entity_name = 'jq_dynamic_form' ");
  SET @whereString = '';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  
  IF NOT formId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND df.form_id LIKE ''%',formId,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE df.form_id LIKE ''%',formId,'%''');
    END IF;  
  END IF;
  
  IF NOT formName IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND df.form_name LIKE ''%',formName,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE df.form_name LIKE ''%',formName,'%''');
    END IF;  
  END IF;
  
  IF NOT formDescription IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND df.form_description LIKE ''%',formDescription,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE df.form_description LIKE ''%',formDescription,'%''');
    END IF;  
  END IF;
  
  IF NOT createdDate IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND date_format(df.created_date,''',@dateFormat,''') LIKE ''%',createdDate,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE date_format(df.created_date,''',@dateFormat,''') LIKE ''%',createdDate,'%''');
    END IF;  
  END IF;
  
  IF NOT createdBy IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND df.created_by LIKE ''%',createdBy,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE df.created_by LIKE ''%',createdBy,'%''');
    END IF;  
  END IF;
  
  IF NOT formTypeId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND df.form_type_id = ',formTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE df.form_type_id = ',formTypeId);
    END IF;  
  END IF;
  
  SET @groupByString = ' GROUP BY df.form_id ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;

END;

DROP PROCEDURE IF EXISTS dynarestListing;
CREATE PROCEDURE dynarestListing(dynarestUrl varchar(256), rbacId INT(11), methodName VARCHAR(512)
, methodDescription TEXT , requestTypeId INT(11), producerTypeId INT(11), serviceLogic MEDIUMTEXT,
 platformId INT(11), allowFiles TINYINT(11), dynarestTypeId INT(11),forCount INT, limitFrom INT,
 limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = ' SELECT jdrd.jws_dynamic_rest_id AS dynarestId, jdrd.jws_dynamic_rest_url AS dynarestUrl ';
  SET @resultQuery = CONCAT(@resultQuery, ', jdrd.jws_rbac_id AS rbacId, jdrd.jws_method_name AS methodName ');
  SET @resultQuery = CONCAT(@resultQuery, ', jdrd.jws_method_description AS methodDescription, jdrd.jws_request_type_id AS requestTypeId '); 
  SET @resultQuery = CONCAT(@resultQuery, ', jdrd.jws_response_producer_type_id AS producerTypeId, jdrd.jws_service_logic AS serviceLogic ');
  SET @resultQuery = CONCAT(@resultQuery, ', jdrd.jws_platform_id AS platformId, jdrd.jws_allow_files AS allowFiles, jdrd.jws_dynamic_rest_type_id AS dynarestTypeId ');
  SET @resultQuery = CONCAT(@resultQuery, ', jdrd.last_updated_ts AS lastUpdatedTs, COUNT(jmv.version_id) AS revisionCount ');
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @fromString  = ' FROM jq_dynamic_rest_details AS jdrd ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = jdrd.jws_dynamic_rest_id ");
  SET @whereString = ' ';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT dynarestUrl IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jdrd.jws_dynamic_rest_url LIKE ''%',dynarestUrl,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jdrd.jws_dynamic_rest_url LIKE ''%',dynarestUrl,'%''');
    END IF;  
  END IF;
  
  IF NOT methodName IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jdrd.jws_method_name LIKE ''%',methodName,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jdrd.jws_method_name LIKE ''%',methodName,'%''');
    END IF;  
  END IF;
    
  IF NOT methodDescription IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jdrd.jws_method_description LIKE ''%',methodDescription,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jdrd.jws_method_description LIKE ''%',methodDescription,'%''');
    END IF;  
  END IF;
    
  IF NOT requestTypeId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jdrd.jws_request_type_id = ',requestTypeId);
    ELSE
      SET @whereString = CONCAT('WHERE jdrd.jws_request_type_id = ',requestTypeId);
    END IF;  
  END IF;
  
  
  IF NOT platformId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jdrd.jws_platform_id = ',platformId);
    ELSE
      SET @whereString = CONCAT('WHERE jdrd.jws_platform_id = ',platformId);
    END IF;  
  END IF;

  IF NOT dynarestTypeId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jdrd.jws_dynamic_rest_type_id = ',dynarestTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE jdrd.jws_dynamic_rest_type_id = ',dynarestTypeId);
    END IF;  
  END IF;
  
  SET @groupByString = ' GROUP BY dynarestId ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs ASC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
END;

DROP PROCEDURE IF EXISTS gridDetails;
CREATE PROCEDURE gridDetails(gridId varchar(100), gridName varchar(500), gridDesc varchar(500), gridTableName varchar(100)
, gridColumnName varchar(500),gridTypeId INT(11), forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN

  
  SET @resultQuery = ' SELECT gd.grid_id AS gridId, gd.grid_name AS gridName, gd.grid_description AS gridDesc, gd.grid_table_name AS gridTableName, gd.grid_column_names AS gridColumnName ';
  SET @resultQuery = CONCAT(@resultQuery, ', gd.grid_type_id AS gridTypeId, gd.last_updated_ts AS lastUpdatedTs ');
  SET @resultQuery = CONCAT(@resultQuery, ', COUNT(jmv.version_id) AS revisionCount, MAX(jmv.version_id) AS max_version_id ');
  SET @fromString  = ' FROM jq_grid_details AS gd ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = gd.grid_id AND jmv.entity_name = 'jq_grid_details' ");

  SET @whereString = ' ';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT gridId IS NULL THEN
    SET @gridId= REPLACE(gridId,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND grid_id LIKE ''%',@gridId,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE grid_id LIKE ''%',@gridId,'%''');
    END IF; 
   END IF; 
    
  IF NOT gridName IS NULL THEN
    SET @gridName= REPLACE(gridName,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND grid_name LIKE ''%',@gridName,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE grid_name LIKE ''%',@gridName,'%''');
    END IF;      
  END IF; 
  
  
  IF NOT gridDesc IS NULL THEN
    SET @gridDesc= REPLACE(gridDesc,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND grid_description LIKE ''%',@gridDesc,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE grid_description LIKE ''%',@gridDesc,'%''');
    END IF;      
  END IF; 
  
  IF NOT gridTableName IS NULL THEN
    SET @gridTableName= REPLACE(gridTableName,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND grid_table_name LIKE ''%',@gridTableName,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE grid_table_name LIKE ''%',@gridTableName,'%''');
    END IF;      
  END IF; 
  
  
  IF NOT gridColumnName IS NULL THEN
    SET @gridColumnName= REPLACE(gridColumnName,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND grid_column_names LIKE ''%',@gridColumnName,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE grid_column_names LIKE ''%',@gridColumnName,'%''');
    END IF;      
  END IF; 
  IF NOT gridTypeId IS NULL THEN
    SET @gridTypeId= gridTypeId;
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND grid_type_id = ',@gridTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE grid_type_id = ',@gridTypeId);
    END IF;  
    
  END IF;
  
  SET @groupByString = ' GROUP BY gd.grid_id ';
    
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY grid_id ASC');
  END IF;
  
  IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
END;

DROP PROCEDURE IF EXISTS notificationlisting;
CREATE PROCEDURE notificationlisting(targetPlatform varchar(100), messageType varchar(500), validFrom varchar(500), messageText varchar(500), validTill varchar(100), messageFormat varchar(100), selectionCriteria varchar(500), updatedBy varchar(100), updatedDate varchar(100), forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN
DECLARE db_format VARCHAR(20);

DECLARE curP CURSOR FOR 
SELECT JSON_VALUE(jpm.property_value, '$.db') AS db_format FROM jq_property_master AS jpm WHERE jpm.property_name = 'jws-date-format';

OPEN curP;
FETCH curP INTO db_format;

  SET @resultQuery = ' SELECT gun.notification_id AS notificationId, gun.target_platform AS targetPlatform, message_text AS messageText,  ';
  SET @resultQuery = CONCAT(@resultQuery, ' gun.message_type AS messageType, gun.message_format AS messageFormat, gun.selection_criteria AS selectionCriteria, gun.updated_by AS updatedBy, COUNT(jmv.version_id) AS revisionCount ');
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @resultQuery = CONCAT(@resultQuery, ', date_format(gun.message_valid_from,''', db_format,''') as validFrom ');
  SET @resultQuery = CONCAT(@resultQuery, ', date_format(gun.message_valid_till,''', db_format,''') as validTill ');
  SET @resultQuery = CONCAT(@resultQuery, ', date_format(gun.updated_date,''', db_format,''') as updatedDate ');
  SET @fromString  = ' FROM jq_generic_user_notification AS gun';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = gun.notification_id AND jmv.entity_name = 'jq_generic_user_notification' ");
  SET @whereString = '';
  SET @dateFormat = CONCAT(''', db_format,''');
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT targetPlatform IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND gun.target_platform LIKE ''%',targetPlatform,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE gun.target_platform LIKE ''%',targetPlatform,'%''');
    END IF;  
  END IF;
  
  IF NOT messageType IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND gun.message_type LIKE ''%',messageType,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE gun.message_type LIKE ''%',messageType,'%''');
    END IF;  
  END IF;
  
  IF NOT validFrom IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND date_format(gun.message_valid_from,''',@dateFormat,''') LIKE ''%',validFrom,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE date_format(gun.message_valid_from,''',@dateFormat,''') LIKE ''%',validFrom,'%''');
    END IF;  
  END IF;
  
  IF NOT messageText IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND gun.message_text LIKE ''%',messageText,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE gun.message_text LIKE ''%',messageText,'%''');
    END IF;  
  END IF;
  
  IF NOT validTill IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND date_format(gun.message_valid_till,''',@dateFormat,''') LIKE ''%',validTill,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE date_format(gun.message_valid_till,''',@dateFormat,''') LIKE ''%',validTill,'%''');
    END IF;  
  END IF;
  
  IF NOT messageFormat IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND gun.message_format LIKE ''%',messageFormat,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE gun.message_format LIKE ''%',messageFormat,'%''');
    END IF;  
  END IF;
  
  IF NOT selectionCriteria IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND gun.selection_criteria LIKE ''%',selectionCriteria,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE gun.selection_criteria LIKE ''%',selectionCriteria,'%''');
    END IF;  
  END IF;
  
  IF NOT updatedBy IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND gun.updated_by LIKE ''%',updatedBy,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE gun.updated_by LIKE ''%',updatedBy,'%''');
    END IF;  
  END IF;
  
  IF NOT updatedDate IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND date_format(gun.updated_date,''',@dateFormat,''') LIKE ''%',updatedDate,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE date_format(gun.updated_date,''',@dateFormat,''') LIKE ''%',updatedDate,'%''');
    END IF;  
  END IF;
  
  SET @groupByString = ' GROUP BY gun.notification_id ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY gun.updated_date DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;
  
  

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
CLOSE curP;
 
END;

DROP PROCEDURE IF EXISTS propertyMasterListing;
CREATE PROCEDURE propertyMasterListing(ownerType VARCHAR(100), ownerId VARCHAR(150)
, propertyName VARCHAR(150), propertyValue VARCHAR(250), modifiedBy VARCHAR(50), appVersion DECIMAL(7,4), comments TEXT
,forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN
  SET @resultQuery = ' SELECT jpm.owner_type AS ownerType, jpm.owner_id AS ownerId, jpm.property_name AS propertyName '; 
  SET @resultQuery = CONCAT(@resultQuery, ', jpm.property_value AS propertyValue, jpm.last_modified_date AS lastModifiedDate ');
  SET @resultQuery = CONCAT(@resultQuery, ', jpm.modified_by AS modifiedBy, jpm.app_version AS appVersion, jpm.comments AS comments, jpm.property_master_id AS propertyMasterId, COUNT(jmv.version_id) AS revisionCount ');
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  
  SET @fromString  = ' FROM jq_property_master AS jpm ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = jpm.property_master_id AND jmv.entity_name = 'jq_property_master' ");
  SET @whereString = ' WHERE jpm.is_deleted = 0 ';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT ownerId IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jpm.owner_id LIKE ''%',ownerId,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jpm.owner_id LIKE ''%',ownerId,'%''');
    END IF;  
  END IF;
  
  IF NOT ownerType IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jpm.owner_type LIKE ''%',ownerType,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jpm.owner_type LIKE ''%',ownerType,'%''');
    END IF;  
  END IF;
  
  IF NOT propertyName IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jpm.property_name LIKE ''%',propertyName,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jpm.property_name LIKE ''%',propertyName,'%''');
    END IF;  
  END IF;
  
  IF NOT propertyValue IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jpm.property_value LIKE ''%',propertyValue,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jpm.property_value LIKE ''%',propertyValue,'%''');
    END IF;  
  END IF;
  
  IF NOT modifiedBy IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jpm.modified_by LIKE ''%',modifiedBy,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jpm.modified_by LIKE ''%',modifiedBy,'%''');
    END IF;  
  END IF;
  
  IF NOT comments IS NULL THEN
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND jpm.comments LIKE ''%',comments,'%''');
    ELSE
      SET @whereString = CONCAT('WHERE jpm.comments LIKE ''%',comments,'%''');
    END IF;  
  END IF;
  
  SET @groupByString = ' GROUP BY propertyMasterId ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastModifiedDate DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
END;

DROP PROCEDURE IF EXISTS templateListing;
CREATE PROCEDURE templateListing(templateName varchar(100), templateTypeId INT(11), createdBy VARCHAR(100),updatedBy varchar(100)
, forCount INT, limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = ' SELECT tm.template_id as templateId, tm.template_name as templateName, tm.template as template, tm.updated_by as updatedBy, tm.created_by as createdBy ';
  SET @resultQuery = CONCAT(@resultQuery, ', tm.template_type_id AS templateTypeId , COUNT(jmv.version_id) AS revisionCount ');
  SET @resultQuery = CONCAT(@resultQuery, ', MAX(jmv.version_id) AS max_version_id ');
  SET @resultQuery = CONCAT(@resultQuery, ', tm.updated_date as updatedDate ');
  SET @fromString  = ' FROM jq_template_master AS tm ';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_module_version AS jmv ON jmv.entity_id = tm.template_id AND jmv.entity_name = 'jq_template_master' ");
  SET @whereString = '';
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT templateName IS NULL THEN
    SET @templateName= REPLACE(templateName,"'","''");
    SET @whereString = CONCAT(@whereString,' WHERE tm.template_name LIKE ''%',@templateName,'%''');
  END IF;
  
  IF NOT templateTypeId IS NULL THEN
    SET @templateTypeId= templateTypeId;
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND tm.template_type_id = ',@templateTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE tm.template_type_id = ',@templateTypeId);
    END IF;  
    
  END IF;
  
  IF NOT createdBy IS NULL THEN
    SET @createdBy= REPLACE(createdBy,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND tm.created_by LIKE ''%',@createdBy,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE tm.created_by LIKE ''%',@createdBy,'%''');
    END IF;  
    
  END IF;
  
  IF NOT updatedBy IS NULL THEN
    SET @updatedBy= REPLACE(updatedBy,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND tm.updated_by LIKE ''%',@updatedBy,'%''');
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE tm.updated_by LIKE ''%',@updatedBy,'%''');
    END IF;  
    
  END IF;

  
  SET @groupByString = ' GROUP BY tm.template_id ';
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY tm.updated_date DESC');
  END IF;
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @groupByString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @groupByString, @orderBy, @limitString);
  END IF;


 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;

END;


DROP PROCEDURE IF EXISTS fileUploadConfigListing;
CREATE PROCEDURE `fileUploadConfigListing`(fileBinId varchar(100), fileTypeSupported varchar(100), maxFileSize varchar(1000)
,noOfFiles INT(11), lastUpdatedBy varchar(100), forCount INT, limitFrom INT, limitTo INT
,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = CONCAT(" SELECT fuc.file_bin_id AS fileBinId, fuc.file_type_supported AS fileTypeSupported "
  ," , fuc.max_file_size AS maxFileSize, fuc.no_of_files AS noOfFiles, fuc.last_updated_by AS lastUpdatedBy " 
  ," , fuc.last_updated_ts AS lastUpdatedTs, fuc.is_deleted AS isDeleted ") ;
  SET @fromString  = ' FROM jq_file_upload_config AS fuc ';
  SET @whereString = ' WHERE fuc.is_deleted = 0';
  
  IF NOT fileBinId IS NULL THEN
    SET @fileBinId= REPLACE(fileBinId,"'","''");
    SET @whereString = CONCAT(@whereString,' AND fuc.file_bin_id like ''%',@fileBinId,'%''');
  END IF;
  
  IF NOT fileTypeSupported IS NULL THEN
    SET @fileTypeSupported= REPLACE(fileTypeSupported,"'","''");
    SET @whereString = CONCAT(@whereString,' AND fuc.file_type_supported like ''%',@fileTypeSupported,'%''');
  END IF;
  
  IF NOT maxFileSize IS NULL THEN
    SET @maxFileSize= REPLACE(maxFileSize,"'","''");
    SET @whereString = CONCAT(@whereString,' AND fuc.max_file_size like ''%',@maxFileSize,'%''');
  END IF;
  
  IF NOT noOfFiles IS NULL THEN
    SET @noOfFiles= REPLACE(noOfFiles,"'","''");
    SET @whereString = CONCAT(@whereString,' AND fuc.no_of_files like ''%',@noOfFiles,'%''');
  END IF;

  IF NOT lastUpdatedBy IS NULL THEN
    SET @lastUpdatedBy= REPLACE(lastUpdatedBy,"'","''");
    SET @whereString = CONCAT(@whereString,' AND fuc.last_updated_by like ''%',@lastUpdatedBy,'%''');
  END IF;


  
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs DESC');
  END IF;
  
  IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
 
END;


DROP PROCEDURE IF EXISTS moduleListing;
CREATE PROCEDURE moduleListing(moduleId varchar(100), moduleTypeId INT(11), moduleName varchar(500),
moduleURL varchar(500), parentModuleName varchar(500), sequence varchar(100), isInsideMenu INT(1), forCount INT, 
limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = ' SELECT ml.module_id AS moduleId,COALESCE(mli18n.module_name,mli18n2.module_name) AS moduleName, ml.module_url AS moduleURL, COALESCE(mli18nParent.module_name, mli18nParent2.module_name) AS parentModuleName'
    ', ml.sequence AS sequence, ml.is_inside_menu AS isInsideMenu, ml.is_home_page AS isHomePage, ml.module_type_id AS moduleTypeId ';
  SET @fromString  = ' FROM jq_module_listing AS ml ';
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing AS mlParent ON ml.parent_id = mlParent.module_id ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing_i18n AS mli18n ON ml.module_id = mli18n.module_id AND mli18n.language_id = 1 ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing_i18n AS mli18n2 ON ml.module_id = mli18n2.module_id AND mli18n2.language_id = 1 ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing_i18n AS mli18nParent ON mlParent.module_id = mli18nParent.module_id AND mli18nParent.language_id = 1 ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing_i18n AS mli18nParent2 ON mlParent.module_id = mli18nParent2.module_id AND mli18nParent2.language_id = 1 ');
  SET @whereString = ' WHERE (ml.is_home_page IN (0,1) OR  ml.is_home_page IS NULL) ';
  
  
  IF NOT moduleName IS NULL THEN
    SET @moduleName= REPLACE(moduleName,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString, 'AND COALESCE(mli18n.module_name,mli18n2.module_name) LIKE ''%',@moduleName,'%'''); 
    ELSE
      SET @whereString = CONCAT(@whereString, 'WHERE COALESCE(mli18n.module_name,mli18n2.module_name) LIKE ''%',@moduleName,'%'''); 
    END IF;  
  END IF;
  
  IF NOT moduleTypeId IS NULL THEN
    SET @moduleTypeId= moduleTypeId;
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString,' AND ml.module_type_id = ',@moduleTypeId);
    ELSE
      SET @whereString = CONCAT(@whereString,' WHERE ml.module_type_id = ',@moduleTypeId);
    END IF;  
    
  END IF;
  
  IF NOT moduleURL IS NULL THEN
    SET @moduleURL= REPLACE(moduleURL,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString, 'AND ml.module_url LIKE ''%',@moduleURL,'%'''); 
    ELSE
      SET @whereString = CONCAT(@whereString, 'WHERE ml.module_url LIKE ''%',@moduleURL,'%'''); 
    END IF; 
  END IF;
  
  IF NOT parentModuleName IS NULL THEN
    SET @parentModuleName= REPLACE(parentModuleName,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString, 'AND COALESCE(mli18nParent.module_name, mli18nParent2.module_name) LIKE ''%',@parentModuleName,'%''');  
    ELSE
      SET @whereString = CONCAT(@whereString, 'WHERE COALESCE(mli18nParent.module_name, mli18nParent2.module_name) LIKE ''%',@parentModuleName,'%'''); 
    END IF; 
 END IF;
  
  IF NOT sequence IS NULL THEN
    SET @sequence= REPLACE(sequence,"'","''");
    IF  @whereString != '' THEN
      SET @whereString = CONCAT(@whereString, 'AND  ml.sequence = ''',@sequence,''''); 
    ELSE
      SET @whereString = CONCAT(@whereString, 'WHERE ml.sequence = ''',@sequence,''''); 
    END IF; 
  END IF;
  

  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY ml.last_modified_date DESC');
  END IF;
    
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @orderBy, @limitString);
  END IF;
  
  
 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
END;


DROP PROCEDURE IF EXISTS homePageListing;
CREATE PROCEDURE homePageListing(moduleId varchar(100), moduleName varchar(500),
moduleURL varchar(500), roleName varchar(100), rolePriority INT(11), forCount INT, 
limitFrom INT, limitTo INT,sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN


  SET @resultQuery = ' SELECT jr.role_id AS roleId, ml.module_id AS moduleId,COALESCE(mli18n.module_name,mli18n2.module_name) AS moduleName, ml.module_url AS moduleURL, jr.role_name AS roleName, jr.role_priority AS rolePriority ';
  SET @fromString  = ' FROM  jq_role AS jr';
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_role_association AS mra ON jr.role_id = mra.role_id AND mra.is_deleted = 0  ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing AS ml ON mra.module_id = ml.module_id ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing_i18n AS mli18n ON mli18n.module_id = ml.module_id AND mli18n.language_id = 1 ');
  SET @fromString = CONCAT(@fromString, ' LEFT OUTER JOIN jq_module_listing_i18n AS mli18n2 ON ml.module_id = mli18n2.module_id AND mli18n2.language_id = 1 ');
  SET @whereString = ' WHERE jr.is_active = 1 AND jr.role_id != "ae6465b3-097f-11eb-9a16-f48e38ab9348" ';
  
  
  IF NOT moduleName IS NULL THEN
    SET @moduleName= REPLACE(moduleName,"'","''");
    SET @whereString = CONCAT(@whereString, 'AND COALESCE(mli18n.module_name,mli18n2.module_name) LIKE ''%',@moduleName,'%'''); 
  END IF;
  
  IF NOT moduleURL IS NULL THEN
    SET @moduleURL= REPLACE(moduleURL,"'","''");
    SET @whereString = CONCAT(@whereString, 'AND ml.module_url LIKE ''%',@moduleURL,'%'''); 
  END IF;
  
  IF NOT roleName IS NULL THEN
    SET @roleName= REPLACE(roleName,"'","''");
    SET @whereString = CONCAT(@whereString, 'AND jr.role_name LIKE ''%',@roleName,'%''');  
 END IF;
 
   IF NOT rolePriority IS NULL THEN
    SET @rolePriority= REPLACE(rolePriority,"'","''");
    SET @whereString = CONCAT(@whereString, 'AND jr.role_priority LIKE ''%',@rolePriority,'%''');  
 END IF;

  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY jr.role_priority DESC');
  END IF;
    
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
	IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @orderBy, @limitString);
  END IF;
  
  
 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
 
END;

CREATE  OR REPLACE VIEW `jq_customResourceBundleListingView` AS
SELECT * FROM ( SELECT
  `rb`.`resource_key`    AS `resourceKey`,
  `lang`.`language_name` AS `languageName`,
  `rb`.`text`            AS `resourceBundleText`,
  COUNT(`jmv`.`version_id`) AS `revisionCount`,
  MAX(`jmv`.`version_id`) AS `max_version_id`
FROM ((`jq_resource_bundle` `rb`
    JOIN `jq_language` `lang`
      ON (`lang`.`language_id` = `rb`.`language_id`))
   LEFT JOIN `jq_module_version` `jmv`
     ON (`jmv`.`entity_id` = `rb`.`resource_key`
         AND `jmv`.`entity_name` = 'jq_resource_bundle'))
WHERE `rb`.`resource_key` NOT LIKE 'jws.%') t WHERE t.revisionCount > 0;



DROP PROCEDURE IF EXISTS datasourceListing;
CREATE PROCEDURE datasourceListing(datasourceName VARCHAR(200), databaseProductName VARCHAR(200), productDisplayName VARCHAR(200),createdBy VARCHAR(500), lastUpdatedBy VARCHAR(500)
, forCount INT, limitFrom INT, limitTo INT, sortIndex VARCHAR(100),sortOrder VARCHAR(20))
BEGIN

/* SET @dateFormat = NULL;
   SELECT JSON_VALUE(jpm.property_value, '$.db') INTO @dateFormat FROM jq_property_master AS jpm WHERE jpm.property_name = 'jws-date-format'; */


  SET @resultQuery = CONCAT(" SELECT ad.datasource_name AS datasourceName,jdl.database_product_name AS databaseProductName, ad.additional_datasource_id AS additionalDatasourceId, ad.datasource_lookup_id AS datasourceLookupId "
  ," , jdl.db_product_display_name AS productDisplayName, ad.created_by AS createdBy, ad.created_date AS createdDate, ad.last_updated_by AS lastUpdatedBy, ad.last_updated_ts AS lastUpdatedTs  ") ;
  SET @fromString  = ' FROM jq_additional_datasource AS ad';
  SET @fromString = CONCAT(@fromString, " LEFT OUTER JOIN jq_datasource_lookup AS jdl ON jdl.datasource_lookup_id = ad.datasource_lookup_id ");
  SET @whereString = ' WHERE ad.is_deleted = 0';
  
 
  IF NOT datasourceName IS NULL THEN
    SET @datasourceName= REPLACE(datasourceName,"'","''");
    SET @whereString = CONCAT(@whereString,' AND ad.datasource_name like ''%',@datasourceName,'%''');
  END IF;
  
  IF NOT productDisplayName IS NULL THEN
    SET @productDisplayName= REPLACE(productDisplayName,"'","''");
    SET @whereString = CONCAT(@whereString,' AND jdl.db_product_display_name like ''%',@productDisplayName,'%''');
  END IF;
  
  IF NOT databaseProductName IS NULL THEN
    SET @databaseProductName= REPLACE(databaseProductName,"'","''");
    SET @whereString = CONCAT(@whereString,' AND jdl.database_product_name like ''%',@databaseProductName,'%''');
  END IF;
  
  IF NOT createdBy IS NULL THEN
    SET @createdBy= REPLACE(createdBy,"'","''");
    SET @whereString = CONCAT(@whereString,' AND ad.created_by like ''%',@createdBy,'%''');
  END IF;
  
  IF NOT lastUpdatedBy IS NULL THEN
    SET @lastUpdatedBy= REPLACE(lastUpdatedBy,"'","''");
    SET @whereString = CONCAT(@whereString,' AND ad.last_updated_by like ''%',@lastUpdatedBy,'%''');
  END IF;
    
  SET @limitString = CONCAT(' LIMIT ','',CONCAT(limitFrom,',',limitTo));
  
  IF NOT sortIndex IS NULL THEN
      SET @orderBy = CONCAT(' ORDER BY ' ,sortIndex,' ',sortOrder);
    ELSE
      SET @orderBy = CONCAT(' ORDER BY lastUpdatedTs DESC');
  END IF;
  
  IF forCount=1 THEN
  	SET @queryString=CONCAT('SELECT COUNT(*) FROM ( ',@resultQuery, @fromString, @whereString, @orderBy,' ) AS cnt');
  ELSE
  	SET @queryString=CONCAT(@resultQuery, @fromString, @whereString, @orderBy, @limitString);
  END IF;

 PREPARE stmt FROM @queryString;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;

END;


CREATE  OR REPLACE VIEW `jq_api_client_details_view` AS
SELECT
  `cd`.`client_id`            AS `client_id`,
  `cd`.`client_name`          AS `client_name`,
  `cd`.`client_key`           AS `client_key`,
  `cd`.`client_secret`        AS `client_secret`,
  `cd`.`encryption_algo_id`   AS `encryption_algo_id`,
  `cd`.`updated_by`           AS `updated_by`,
  `cd`.`created_by`           AS `created_by`,
  `cd`.`updated_date`         AS `updated_date`,
  `ed`.`encryption_algo_name` AS `encryption_algo_name`
FROM (`jq_api_client_details` `cd`
   JOIN `jq_encryption_algorithms_lookup` `ed`)
WHERE `ed`.`encryption_algo_id` = `cd`.`encryption_algo_id`;