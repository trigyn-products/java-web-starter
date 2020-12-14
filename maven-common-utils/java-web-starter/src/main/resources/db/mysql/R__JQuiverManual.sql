SET FOREIGN_KEY_CHECKS=0;

replace into manual_type (manual_id, name, is_system_manual) VALUES ('07cf45ae-2987-11eb-a9be-e454e805e22f', 'JQuiver Manual', 0);


replace into manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES
('e03447c8-eaa0-4119-b97e-b802bd8f4ff1', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'User Management', '# User Management ', 3, NOW(), 'admin');



REPLACE INTO manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES
('3f0f6b4e-9a00-4b89-9a64-415a1f8256d2', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Dashboard', '# Dashboard

In order to import the dashboard jar, add following dependency in your pom.xml.

```
<dependency>
			<groupId>com.trigyn</groupId>
			<artifactId>dashboard</artifactId>
			<version>version</version>
</dependency>
```

This will import dashboard jar implicitly and will create dashboard table.The jar will provide an URL server name:port/cf/dls which will render selected dashboard. Creating a dashboard is an easy task. Just provide dashboard name, select context name and based on context name select dashlets to be displayed on dashboard.

# Dashlet
Dashlet component is included in dashboard jar itself. User need to provide following basic properties for a dashlet:
* Dashlet name
* Dashlet title
* Dashlet coordinates
* Dashlet dimesions
* Context type 
* Dashlet status.



User can also add provide additional configurable properties to a dashlet like no of records to be visible at a time or you can allow end user to enter a date which will be taken into consideration while fetching records. User also need to provide HTML content and SQL query.

**Step 1: **Navigate to Dashboard Master.
![](/cf/files/402816947628e22d017628e709eb0000)

**Step 2: **Click Manage Dashlets
 ![](/cf/files/40289d3d7650c0a1017650c8fccf0001)
 
**Step 3: **Click on Create New Dashlet
  ![](/cf/files/40289d3d7650c0a1017650c90cce0002)
	
**Step 4: **Create New Dashlet by providing all neccessary information
![](/cf/files/402816947628e22d017628e71f020001)
![](/cf/files/402816947628e22d017628ea39e00002)

**Step 5: **Navigate back to Dashboard listing page and click on Create New Dashboard
 ![](/cf/files/40289d3d7650c0a1017650c8ef410000)

**Step 6: **Create new dashboard by providing all neccessary information
![](/cf/files/40289d3d7629c275017629c35c830000)



', 8, NOW(), 'admin');

REPLACE INTO manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES
('5e46df00-e07a-4b73-889f-2894adfd3df8', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'AutoComplete', '# AutoComplete

 In order to import the autocomplete jar, add following dependency in your pom.xml.

```
<dependency>
<groupId>com.trigyn</groupId>
<artifactId>typeahead</artifactId>
<version>version</version>
</dependency>
```

This will import autocomplete jar implicitly and will create autocomplete_details table. The jar will provide an URL server name:port/cf/autocomplete-data which will be the data-provider for the autocomplete. The user needs to write a query which will return the data for autocomplete, the details needs to be inserted into autocomplete_details as follows: -

ac_id : The unique identifier for your autocomplete, this will be used to be called from UI.
ac_description : The description stating the purpose of this autocomplete.
ac_select_query: The query to fetch data for autocomplete.

You can enhance your autocomplete or multiselect with following options:
**Prefetch:** You can speed up the operations just by adding one flag (prefetch : true) to you component. 
**Local Storage: **You can avoid server call to fetch and render data in autocomplete/multiselect using local storage. To enable local storage you have to set list of available items in autocomplete using items property.
**Enable Clear Text: ** You can add **clear text** button to your autocomplete by setting true value enableClearText.

Make sure to add following div for each of your multiselect component:

```
<div id="rbMultiselect_removeAll" class="pull-right"> 
<span title="Clear All" class="clearall-cls" onclick="multiselect.removeAllElements(''rbMultiselect'')" style="pointer-events: auto;">Clear All</span> </div> 
<div id="rbMultiselect_count" class="multiselectcount pull-right">
<span title="hide show" onclick="multiselect.showHideDataDiv(''rbMultiselect_selectedOptions'')" style="pointer-events: auto;">1</span> </div>
```
 
 
 
# Example to include basic autocomplete component:
HTML Structure: 

```
	<div class="col-6">
		<div class="col-inner-form full-form-fields">
			<label for="flammableState" style="white-space:nowrap">Autocomplete</label>
			<input class="form-control" id="rbAutocomplete" type="text">
 		</div>
	</div>
```

JS changes: 
```
<script>
let autocomplete;

$(function () {
    autocomplete = $(''#rbAutocomplete'').autocomplete({
        autocompleteId: "resourcesAutocomplete",
		prefetch : false,
        render: function(item) {
        	var renderStr ='''';
        	if(item.emptyMsg == undefined || item.emptyMsg === '''')
    		{
        		renderStr = ''<p>''+item.text+''</p>'';
    		}
        	else
    		{
        		renderStr = item.emptyMsg;	
    		}	    				        
            return renderStr;
        },
        additionalParamaters: {languageId: 1},
        extractText: function(item) {
            return item.text;
        },
        select: function(item) {
            $("#rbAutocomplete").blur();
        }, 	
    }, {key: "jws.action", languageId: 1, text: "Action"});
});
 </script>   
```

![](/cf/files/40289d3d765124480176512a5e0f0000)

# Example to include basic autocomplete with prefetch:

HTML Structure: 

```
	<div class="col-6">
		<div class="col-inner-form full-form-fields">
			<label for="flammableState" style="white-space:nowrap">Autocomplete(Prefetch)</label>
			<input class="form-control" id="rbAutocompletePF" type="text">
 		</div>
	</div>
```

JS changes: 
```
<script>
let autocompletePF;

$(function () {
	autocompletePF = $(''#rbAutocompletePF'').autocomplete({
        autocompleteId: "resourcesAutocomplete",
		prefetch : true,
        render: function(item) {
        	var renderStr ='''';
        	if(item.emptyMsg == undefined || item.emptyMsg === ''''){
        		renderStr = ''<p>''+item.text+''</p>'';
    		}else{
        		renderStr = item.emptyMsg;	
    		}	    				        
            return renderStr;
        },
        additionalParamaters: {languageId: 1},
        extractText: function(item) {
            return item.text;
        },
        select: function(item) {
            $("#rbAutocompletePF").blur();
        }, 	
    });
});    
 </script>   
```

![](/cf/files/40289d3d765124480176512a6e660001) 


# Example to include basic autocomplete with local storage:

HTML Structure: 

```
		<div class="col-6">
			<div class="col-inner-form full-form-fields">
				<label for="flammableState" style="white-space:nowrap">Autocomplete(Local Storage)</label>
				<input class="form-control" id="rbAutocompleteLS" type="text">
 			</div>
		</div>
```

JS changes: 
```
<script>

$(function () {
 $("#rbAutocompleteLS").richAutocomplete({
		items: [{
			languageName: "English",
			languageId: 1
		}, {
			languageName: "French",
			languageId: 2
		}, {
			languageName: "Hindi",
			languageId: 3
		}],
		extractText: function(item) {
			return item.languageName;
		},
		filter: function(items, searchTerm) {
			return items.filter(function(item) {
				return item.languageName.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1;
			});
		},
		render: function(item) {
			return "<p>" + item.languageName + "</p><small>" + item.languageId + "</small>";
		}
	});
});	
 </script>   
```

![](/cf/files/40289d3d765124480176512a79560002)


# Example to include basic autocomplete with clear text:

HTML Structure: 

```
		<div class="col-6">
			<div class="col-inner-form full-form-fields">
				<label for="flammableState" style="white-space:nowrap">Autocomplete(Local Storage)</label>
				<input class="form-control" id="rbAutocompleteLS" type="text">
 			</div>
		</div>
```

JS changes: 
```
<script>
let autocompleteCT;

$(function () {
 	autocompleteCT = $(''#rbAutocompleteCT'').autocomplete({
        autocompleteId: "resourcesAutocomplete",
		prefetch : true,
		enableClearText: true,
        render: function(item) {
        	var renderStr ='''';
        	if(item.emptyMsg == undefined || item.emptyMsg === ''''){
        		renderStr = ''<p>''+item.text+''</p>'';
    		}else{
        		renderStr = item.emptyMsg;	
    		}	    				        
            return renderStr;
        },
        additionalParamaters: {languageId: 1},
        extractText: function(item) {
            return item.text;
        },
        select: function(item) {
            $("#rbAutocompleteCT").blur();
        }, 	
    });
});    
 </script>   
```

![](/cf/files/40289d3d765124480176512a89830003)


# Example to include basic multiselect component:
HTML Structure: 
```
 	<div class="multiselectcount_clear_block">
		<div id="rbMultiselect_removeAll" class="pull-right disable_cls">
			<span title="Clear All" class="clearall-cls" onclick="multiselect.removeAllElements(''rbMultiselect'')" style="pointer-events:none">Clear All</span>
		</div>
		<div id="rbMultiselect_count" class="multiselectcount pull-right disable_cls">
			<span title="hide show" onclick="multiselect.showHideDataDiv(''rbMultiselect_selectedOptions'')" style="pointer-events:none">0</span>
		</div>
	</div>
	<label for="flammableState" style="white-space:nowrap">${messageSource.getMessage(''jws.multiselect'')}</label>
	<input class="form-control" id="rbMultiselect" type="text">
			
	<div id="rbMultiselect_selectedOptions"></div>
```
JS changes:
```
<script>
let multiselect;

$(function () {
 multiselect = $(''#rbMultiselect'').multiselect({
        autocompleteId: "resourcesAutocomplete",
        multiselectItem: $(''#rbMultiselect_selectedOptions''),
        render: function(item) {
        	var renderStr ='''';
        	if(item.emptyMsg == undefined || item.emptyMsg === '''')
    		{
        		renderStr = ''<p>''+item.text+''</p>'';
    		}
        	else
    		{
        		renderStr = item.emptyMsg;	
    		}	    				        
            return renderStr;
        },
        additionalParamaters: {languageId: 1},
        extractText: function(item) {
            return item.text;
        },
        selectedItemRender: function(item){
            return item.text;
        },
        select: function(item) {
        	let dependArray = new Array();
        	let dependObj = new Object();
        	dependObj.componentId = "languages";
        	dependObj.context = languageSelector;
        	dependArray.push(dependObj);
        	let dependentCompUpdated = multiselect.resetDependent(dependArray);
        	if(dependentCompUpdated === true){ 
	            multiselect.setSelectedObject(item);
	        }
	        $("#rbMultiselect").blur();
	        $("#rbMultiselect").val("");
        },	
    }, [{key: "jws.action", languageId: 1, text: "Action"}]);
});
</script>
 ```

![](/cf/files/40289d3d765124480176512a96630004)
    
HTML Structure: 
```
<div class="col-6">
	<div class="col-inner-form full-form-fields">
		<div class="multiselectcount_clear_block">
			<div id="rbMultiselectLS_removeAll" class="pull-right disable_cls">
				<span title="Clear All" class="clearall-cls" onclick="rbMultiselectLS.removeAllElements(''rbMultiselectLS'')" style="pointer-events:none">Clear All</span>
			</div>
			<div id="rbMultiselectLS_count" class="multiselectcount pull-right disable_cls">
				<span title="hide show" onclick="rbMultiselectLS.showHideDataDiv(''rbMultiselectLS_selectedOptions'')" style="pointer-events:none">0</span>
			</div>
		</div>
				
		<label for="flammableState" style="white-space:nowrap">${messageSource.getMessage(''jws.multiselectLocalStorage'')}</label>
		<input class="form-control" id="rbMultiselectLS" type="text">
	
		<div id="rbMultiselectLS_selectedOptions"></div>
	</div>
</div>
```
 
JS changes:
```
<script>
$(function () {
	rbMultiselectLS = $("#rbMultiselectLS").multiselect({
            multiselectItem: $("#rbMultiselectLS_selectedOptions"),
            paging:false,
            items: [{
                languageName: "English",
                languageId: 1
            }, {
                languageName: "French",
                languageId: 2
            }, {
                languageName: "Hindi",
                languageId: 3
            }],

            render: function(item) {
                var renderStr ="";
                if(item.emptyMsg == undefined || item.emptyMsg === ''''){
                    renderStr = "<p>"+item.languageName+"</p>";
                }else{
                    renderStr = item.emptyMsg;    
                }                                
                return renderStr;
            },

            filter: function(items, searchTerm) {
                return items.filter(function(item) {
                	return item.languageName.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1;
                });
            },
            extractText: function(item) {
                return item.languageName;
            },

            selectedItemRender: function(item){
                return item.languageName;
            },

            select: function(item) {
                $("#rbMultiselectLS").blur();
                rbMultiselectLS.setSelectedObject(item);
            }    

        });
});
</script>
```
 
![](/cf/files/40289d3d765124480176512aa3f80005) 
 
**Note** : - Do not include limit in autocomplete query.', 7, NOW(), 'admin');

REPLACE INTO manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES
('6938f0ac-00fe-4b94-95e7-02ef72016fe4', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Form Builder', '# FormBuilder

In order to import this jar, add following dependency in your pom.xml

```
<dependency>
	<groupId>com.trigyn</groupId>
	<artifactId>dynamic-form</artifactId>
	<version>1.3.16-SNAPSHOT</version>
</dependency>
```

These will import the form builder jar and will create dynamic_form and dynamic_form_save_queries tables. Table dynamic_form  used for storing the  form details such as form html and select  query to fetch data for existing records, while dynamic_form_save_queries is used for storing the save/update queries.

To use these

', 9, NOW(), 'admin');


replace into manual_entry
(manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES 
('17feffba-99f4-4591-9cb5-0fef46ee0b77', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Templating', '# Templating 

In order to import the templating jar, add following dependency in your pom.xml.

```
<dependency>
<groupId>com.trigyn</groupId>
<artifactId>templating</artifactId>
<version>version</version>
</dependency>
```

This will also import resourcebundle and dbutils jar implicitly, as these templates can be used as views in an application and so we might need to support localization and internationalization. In order to process the template with the given set of data, Autowire TemplatingUtils class, this class will render the templates and will add some supporting data in it like, contextPath, messageSource (in-order to evaluate resource-bundle keys.) so in-order to get the label in local language.

Java code to process template
There are many methods available in menu service to process a template. Call appropriate method depending on your use case. 


| Method Name | Parameters | Layout included | Description |
| -------- | -------- | -------- | -------- |
| getTemplateWithSiteLayout     | Template name and Template Parameters     | Yes     | To display template with layout     |
| getTemplateWithSiteLayoutWithoutProcess     | Template name and Template Parameters     | Yes     | To display template content without processing it.    |
| getDashletTemplateWithLayout     | Dashlet name and Template Parameters     | Yes     | To display dashlet with layout     |
| getTemplateWithoutLayout     | Template name and Template Parameters     | No     | To display template without layout     |




**Step 1: **Autowired Menu Service
@Autowired
private MenuService menuService 			= null;

**Step 2: **Call method of menu service with required parameters
String processedTemplate = menuService.getTemplateWithSiteLayout(template-name,  templateData);


Default macros provided are :- 

| Macros | Parameters |
| -------- | -------- |
| templateWithoutParams     | Template-Name     |
| templateWithParams     | Template-Name, Template-Parameters     |
| resourceBundle     | Resource-Key     |
| resourceBundleWithDefault     | Resource-Key, Default-Value  |


**Default macros example :-
Template without parameters:**

Syntax:
<#noparse><@templateWithoutParams templateName/>

Example:
<@templateWithoutParams "role-autocomplete"/>

![](/cf/files/4028168b7647e50a0176488ec8860003) 

**Template with parameters:**
Syntax:
Create freemarket variable.
<@templateWithParams templateName freemarker-variable-name />

Example:
<#assign gaAttributes = {
"enableGoogleAnalytics": enableGoogleAnalytics,
"googleAnalyticsKey": googleAnalyticsKey,
"entityType": entityType,
"entityName": entityName
}>
<@templateWithParams "google-analytics-template" gaAttributes />

![](/cf/files/4028168b7647e50a0176488f32110004)

Resource Bundle without default
Syntax:
<@resourceBundle resource-key/>

Example:
<@resourceBundle "jws.addProperty"/>

![](/cf/files/4028168b7647e50a0176488f4ebe0005) 

Resource Bundle with default
Syntax:
<@resourceBundleWithDefault resource-key default-text/>

Example:
<@resourceBundleWithDefault "jws.addProperty" "Add property"/></#noparse>

![](/cf/files/4028168b7647e50a0176488f60ba0006)

**Note** : - Importing the jar will create template_master table in your application schema.

References for Freemaker :- https://freemarker.apache.org/ ', 5, NOW(), 'admin'), ('57bdec61-325a-4487-9ba6-de218207f8c0', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'JQuiver', '# Purpose 
Trigyn has been working with number of Web Application project, which consists of components like Grids, Forms, Templating. In-order to speed up the initial project setup and components configuration there was a need to develop a reusable component. 

# Including Jar

```
<!-- https://mvnrepository.com/artifact/com.trigyn/java-web-starter --> <dependency>
    <groupId>com.trigyn</groupId>
    <artifactId>java-web-starter</artifactId>
    <version>1.3.15</version>
</dependency>
```

# Modules
Maven Group-id :- com.trigyn
1. **DBUtils** : - (dbutils) In our every project, we need to configure our data-source and beans which will interact with our underlying database, this jar configures all those for you. JDBC templates, Named JDBC Templates, Hibernate Configuration, this jar also provides a script migrator tool Flyway which can be used in application to migrate scripts and maintain database changes.
2. **DB Resource Bundle / Multilingual** : - (resourcebundle) This jar is responsible to provide the application with localization and internationalization support; it will create resource-bundle tables and language tables for you.
3. **Templating Engine** : - (templating) Many web applications contain certain structure or pattern to be followed while display views, sending out mails, templating jar becomes handy in that case.
4. **Grid Utils** : - (gridutils) While developing any web application, there is always a need to show listing page, wherein the user can sort the data, filter it and keeping the performance of application in mind the data should be loaded lazily. JQuiver provides all this as a part of Gridutils jar package.
5. **Notification** : - (notification) With notification jar, you can create notifications for your application and control the duration and context with ease. You can use it for displaying notification on multiple platforms as well.
6. **Typeahead** : - (typeahead) In web-applications there is always a need to have a search box, where user can search his/her data with typing key words, JQuiver provides the jar for this functionality too. Not just single select, typeahead also give you provision for selecting multiple options.
7. **Form Builder** : - (dynamicform) Suppose there is a need to build a simple form, where you have to perform CRUD operations on one or two entities (usually for master tables), you can leverage the dynamic form jar features provided by JQuiver.
8. **Dashboard** : - (dashboard) Just like in JIRA wherein you create dashboard, and add multiple widgets so that you can view the status of your tickets or sprints, if there is a need of such components in your application, Dashboard jar has it covered.
9. **Java-Web-Starter** : - (java-web-starter) If you are using all the above components extensively in your web application, so there will be a need of an admin panel, wherein you can see and manage all your application grids, DB resource bundle, templates (views) dynamic forms, notifications, java-web-starter jar provides you with the UI where you can manage all these functionalities.
10. **REST Builder** : - (dynamic-rest) 
11. **User Management** :- (usermanagement)

', 0, NOW(), 'admin'), ('67b91245-e86c-4b9b-9aa9-7f373916d1c5', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'DB Utils', '# DB Utils

Configuring datasource in application using application.yml : 

```
server:
  port: 8080
  shutdown: graceful
spring:
  servlet:
    multipart:
      enabled: true
      max-file-size: -1
      max-request-size: -1
  application:
    name: adc-demo
  flyway:
    cleanDisabled: true
    enabled: true
  datasource:
    driver-class-name: org.mariadb.jdbc.Driver
    url: jdbc:mysql://localhost:3306/demoportal09?createDatabaseIfNotExist=true&serverTimezone=UTC&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&useSSL=false
    username: root
    password: root
logging:
  level:
    root: info
    org:
      flywaydb: info
```

Database utils provides the database and hibernate configuration. In order to import and use the database utils, you need to include the dbutils jar in your pom.xml.

```
<dependency>
<groupId>com.trigyn</groupId>
<artifactId>dbutils</artifactId>
<version>version</version>
</dependency>
```

Once you have added the jar to your pom.xml you can extend your Repository classes with DBConnection.java class and autowire the datasource.

```
@Repository
public class TemplateDAO extends DBConnection { 

@Autowired
public TemplateDAO(DataSource dataSource) { super(dataSource); }

}
```

DB Utils also provides you with flyway configuration. 
**P.S** All the JQuiver script migrations are done using Flyway. Version scripts has the version between V0.0.0 -- V0.9.9. The migration script file location is resources/db/mysql User can override or customize the flyway configuration using the below code.

```
@Bean
public FluentConfiguration flywayConfiguration(DataSource dataSource) { FluentConfiguration configuration = Flyway.configure().dataSource(dataSource).locations("db/migration");
configuration.cleanDisabled(Boolean.TRUE);
configuration.placeholderReplacement(Boolean.FALSE);
configuration.ignoreFutureMigrations(Boolean.TRUE);
configuration.outOfOrder(Boolean.TRUE);
configuration.ignorePendingMigrations(Boolean.TRUE);
configuration.ignoreMissingMigrations(Boolean.TRUE);
return configuration;
}

```

DB Utils also contains a table **property_master**, which is used as a configuration table for application. Please refer **Application configuration** manual for more details on this.', 1,  NOW(), 'admin'), ('6938f0ac-00fe-4b94-95e7-02ef72016fe4', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Form Builder', '# FormBuilder In order to import this jar, add following dependency in your pom.xml

```
<dependency>
<groupId>com.trigyn</groupId>
<artifactId>dynamic-form</artifactId>
<version>1.3.16-SNAPSHOT</version>
</dependency>
```

These will import the form builder jar and will create dynamic_form and dynamic_form_save_queries tables. Table dynamic_form  used for storing the  form details such as form html and select  query to fetch data for existing records, while dynamic_form_save_queries is used for storing the save/update queries.

To use these
', 9, NOW(), 'admin'),
('7428a452-da97-4ef0-b6d7-acf4921beb82', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Grid Utils', '# Grid Utils

```
<dependency>
     <groupId>com.trigyn</groupId>
     <artifactId>gridutils</artifactId>
     <version>version</version>
</dependency>
```

This will import dbutils jar implicitly and will create grid_details table. The jar will provide an URL ***server-name***:***port***/cf/grid-data which will be the data-provider for the grid. The user needs to create a stored procedure which will return the data for grid, the details needs to be inserted into grid_tables as follows: - `grid_id` : The unique identifier for your grid, this will be used to be called from UI  `grid_name` : The name of the grid.  `grid_description`  : The description stating the purpose of this grid. `grid_table_name` : This column will have your stored procedure name which will be called to get the data for grid. `grid_column_names` : This are the comma separated names of columns (aliases mentioned in your SP) 
While creating the SP make sure you add following input parameters,    
* forCount INT,
* limitFrom INT,
* limitTo INT,
* sortIndex VARCHAR(100),
* sortOrder VARCHAR(20),
* langCode VARCHAR (20)


We have added an example demonstrating the use of the grid utility. Stored procedure reference gridDetails. 

Steps to create grid details.

**Step 1: -**
 ![](/cf/files/40289d3d7629c27501762a22257f0012) 
 
**Step 2 :- **Add a new entry.
![](/cf/files/40289d3d7629c27501762a22341b0013) 

**Step 3 :- **Fill in the required details , Grid Table name can have table name, view name and Stored Procedure name as a value, and columns names are comma seperated values.
![](/cf/files/40289d3d7629c27501762a223f2e0014) 

**Step 4 :- **After creating the grid entry, go to templates modules from Jquiver home page and click on add template, a form will get opened, enter the template name in which the grid will be displayed and select the default-template-listing from Default Template drop-down, on selecting it will create the basic template for your grid listing page.
![](/cf/files/40289d3d7629c27501762a2258450015)

**Step 5 :- **Modify the col models accordingly in template, and pass the appropriate values in the grid initialization. 

Parameters to be passed, gridId, additionalParams, colModels.', 4, NOW(), 'admin'), ('81c506ff-dab5-43de-a790-58af356de3e9', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Rest API Builder', '# Rest API Builder 

Rest API Builder lets you write API''s in below languages :
1. FTL (Freemaker)
2. Java
3. Javascript.

Follow the steps below to create a REST API dynamically.

**Step 1: **Visit the REST API Builder module on Jquiver home.
 ![](/cf/files/40281694762864a50176288c66620001)

**Step 2 : **Click on Add REST API, it will open up a form to add/edit REST API
 ![](/cf/files/40281694762864a50176288c755a0002)
 ![](/cf/files/402816947628cb18017628cfa6110000)
 
# Service logic example:
** FTL **


```
<#--
[
	<#list employees as employee>
		{
		    "firstName" : "${employee?api.getFirstName()!''''}",
		    "lastName" : "${employee?api.getLastName()!''''}",
		    "emailId" : "${employee?api.getEmailId()!''''}",
		    "address" : "${employee?api.getAddress()!''''}",
		    "city" : "${employee?api.getCity()!''''}",
		    "joiningData" : "${employee?api.getJoiningData()!''''}",
		    "skills" : "${employee?api.getSkills()!''''}" 
		}
	</#list>
]
-->
```

**Java**
If you choose platform id as java then either you can import specific class in service logic or your can wirite java code in service logic itself for example:

```
 int first = 10;
 int second = 20;

 System.out.println("Enter two numbers: " + first + " " + second);
 int sum = first + second;
 System.out.println("The sum is: " + sum);
```

**JavaScript**

```
function myFunction(requestDetails, daoResults) {
    return daoResults["manualTypes"];
}

myFunction(requestDetails, daoResults);
```


', 10, NOW(), 'admin'), ('918676c8-b653-43ee-964a-d4faaeb13787', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Application Configurations', '# Property Master Details.

Jquiver provides with a database level implementation of application configurations, wherein you can manage all you environment and system related properties.
Property Master table contains below configurations :

| Property Name | Usage |
| -------- | -------- | 
| authentication-type     | Authentication type - default in memory authentication     |
| enable-user-management     |By default user management will be disabled     |
| max-version-count      | Maximum limit to persist versioning data |
| regexPattern     | Regex Pattern to validate password     |
| user-profile-form-details     | Dynamic Form for add edit user details     |
| user-profile-template-details   | Custom template for user profile listing page     |
| user-profile-form-name     | Dynamic Form for user profile     |
| enable-google-analytics     | To add google analytics on each screen     |
| google-analytics-key | Google analytics key,that needs to be passed to GA     |
| jws-date-format     | Date Format to be used at various levels such as on, UI layer, Java Layer, and Database.Stored in JSON format     |
| version     | JQuiver Application Version    |
| profile     | Checks the profile in which the application is running.      |
| template-storage-path     | Path at which the template will be stored during local development.    |


To get the property master details in your application autowire either of the below classes :- 

```
@Autowired
private PropertyMasterDetails propertyMasterDetails = null;

@Autowired
private PropertyMasterService propertyMasterService = null; ```

You can run JQuiver Application in 2 modes, 1. Development Mode. (dev) 2. Production Mode. (prod)

By default the production mode is enabled. In this mode the templates, and forms are editable only through the UI-Editor provided by the JQuiver application. 
Whereas dev mode enabled the user to download the Template, Form Builder templates to your local machine and enables you edit it locally. This modes can be edited using **profile** property in Application Configurations module.


 ![](/cf/files/40289d3d763887410176388995320000) 
 
 Application configuration also provides you with enabling Google Analytics, Create a Google Analytics Key and add it in **google-analytics-key** and also you need to set the property of **enable-google-analytics** to **true**
 
 ![](/cf/files/40289d3d763887410176388b36b60001)', 2, NOW(), 'admin'),
  
('1d5577fa-a7e3-4bdf-85ed-b84ac81fbb0b', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Versioning', '# Versioning

Versioning plays pivotal role when developing an application which require frequent changes and keeping track of previous version is very important. You just need to add DBUtils as a dependecy in your application to enbale versioning for your application. Modify **max-version-count** from **Application Configuration** module if you want to change default max no of versionig that should be saved in database.

To save data in versioning table, follow the steps below:
**Step 1: **Autowired ModuleVersionService
@Autowired
private ModuleVersionService moduleVersionService				= null;

**Step 2: **Save data by following line of code
moduleVersionService.saveModuleVersion(entityData,null, primaryKeyValue, entityName, sourceTypeId);

**Enable Revision Details On UI: **
**Step 1: **To access revision history of any module add following code in your listing page:
**HTML structure:**
```
<form action="contextPath/cf/cmv" method="POST" id="revisionForm">
 	<input type="hidden" id="entityName" name="entityName" value="entityName">
    <input type="hidden" id="entityId" name="entityId">
	<input type="hidden" id="moduleName" name="moduleName">
	<input type="hidden" id="moduleType" name="moduleType" value="moduleType">
	<input type="hidden" id="saveUrl" name="saveUrl" value="saveUrl">
	<input type="hidden" id="previousPageUrl" name="previousPageUrl" value="previousPageUrl">
</form>
```

**Step 2: **Modify your action column formatter function and add revision button:
`<span id="primaryKeyValue_entity" name="moduleName" onclick="submitRevisionForm(this)" class= "grid_action_icons"><i class="fa fa-history"></i></span>`

**Step 3: **Add submitRevisionForm function
**JS changes:**
```
function submitRevisionForm(sourceElement) {
	let selectedId = sourceElement.id.split("_")[0];
	let moduleName = $("#"+sourceElement.id).attr("name")
    $("#entityId").val(selectedId);
	$("#moduleName").val(moduleName);
    $("#revisionForm").submit();
}
```

**Simple example :**

**Step 1: ** Click on revision button from the listing page: 
![](/cf/files/40289d3d7629c27501762a0eb728000a) 


**Step 2: ** Select revision time using autocomplete:
![](/cf/files/40289d3d7629c27501762a0ee8f3000b)


**Step 3: ** See the difference between two versions
![](/cf/files/40289d3d76509b1e017650ae7d4d0015)


**Step 4: ** If you want you can replace current data with old data using copy button:
![](/cf/files/40289d3d7629c27501762a0f3e5a000c)


**Complex example:**

![](/cf/files/40289d3d7629c27501762a0f8466000d)
 
![](/cf/files/40289d3d7629c27501762a0f914b000e)

![](/cf/files/40289d3d7629c27501762a0f9c51000f)', 11, NOW(), 'admin'),
   ('e03447c8-eaa0-4119-b97e-b802bd8f4ff1', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'User Management', '# User Management ', 3, NOW(), 'admin');
   
REPLACE INTO manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES
('9c25fb63-8336-4f22-bb97-a5042159d5c4', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Mulitlingual', '# Mulitlingual
If you are finding ways to spread your market reach and attain global presence, localization of application software is of vital importance. Besides, the very nature of any software application liberalizes the user to have it accessed, bought and downloaded from any geographical location. To enable multilingual for your application just import the resourcebundle jar by adding following dependency in your pom.xml.
 
```
<dependency>
	<groupId>com.trigyn</groupId>
	<artifactId>resourcebundle</artifactId>
	<version>version</version>
</dependency>
```

This jar will create resource_bundle and language table in your database. You can easily add support for new language by just adding new record in language table.
**language table structure:**
	language_id: This will be the primary key
	language_name: Name of the language
	language_code:  ISO code of a language
	last_update_ts:  Last updated timestamp
	is_deleted: Possible values(0 or 1). If language is marked as 0 then it will be displayed in UI.

**resource_bundle table structure::**
	resource_key: Unique key. This will be used wherever we need support for internationlization or localization.
	language_id: language id for corresponding resource key and text.
	text: Translated text. Except for English language, system will save text in unicode format.

**Step 1: **Navigate to Multilingual master.

 ![](/cf/files/40289d3d762c323c01762cc6c8a30000) 

**Step 2: **Click on Add Resource Bundle.

![](/cf/files/40289d3d762c323c01762cc6f25c0001)

**Step 3: **Add new resource key and provide translation for all languages.

 ![](/cf/files/40289d3d762c323c01762cc7015f0002)

Multilingual Demo

 ![](/cf/files/40289d3d762c323c01762cc712310003) 
 
**French language**

 ![](/cf/files/40289d3d762c323c01762cc71ee00004) 
 
**Hindi languae**

 ![](/cf/files/40289d3d762c323c01762cc72f480005)
 
 
Following are the steps if you want to fetch data from resource bundle:

**Step 1: **Autowired Resource Bundle repository
```
@Autowired
private IResourceBundleRepository iResourceBundleRepository = null;```

**Step 2: **Use findByKeyAndLanguageCode method of Resource Bundle repository with all rquired parameters
```
String message = iResourceBundleRepository.findByKeyAndLanguageCode(resourceBundleKey,localeCode,defaultLocaleCode,isDeleted);
```

', 12, NOW(), 'admin');

REPLACE INTO manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES

('935b9394-c33d-4113-a248-27c46c45e7e9', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'Dev environment', '# Dev environment:

You can modify the following modules in your favourite editor just by changing the value of **Profile** property to **dev** from application configuration:
* Templating
* Dynamic Form
* Dashlet

![](/cf/files/40289d3d765d4f9c01765d5514740000)

You can configure default path which will be used by the application to download, upload and process the content

![](/cf/files/4028168b7647e50a017648ca0c690009)

Ddev environment features:
** Download: **If you want to download(from database to local directory) all custom records then you can use Download All feature.
** Upload:**If you want to upload(from local directory to database) all custom records then you can use Upload All feature.
** Note: **If you add any new record from the UI then application will save the changes in database as well as create appropriate files in local directory.
 
Download All custom templates:
![](/cf/files/40289d3d765d4f9c01765d67c7d90005) 
	
Download All custom dynamic forms:
![](/cf/files/40289d3d765d4f9c01765d67e8320007)

Download All custom dashlets:
![](/cf/files/40289d3d765d4f9c01765d7279a50009)


Upload All custom templates:
![](/cf/files/40289d3d765d4f9c01765d67d7850006)
 
Upload All custom dynamic forms:
![](/cf/files/40289d3d765d4f9c01765d67f5d90008)
 
Upload All custom dashlets:
![](/cf/files/40289d3d765d4f9c01765d7287ee000a)


Download/Upload system templates
![](/cf/files/40289d3d7660efd0017660f91702000a)

Download/Upload system dynamic forms
![](/cf/files/40289d3d7660efd0017660f9ba53000c)

Download/Upload system dashlets
![](/cf/files/40289d3d7660efd0017660f9a518000b) 


Find all the templates under **Templates** folder. It consist of **template-name.tgn** files

![](/cf/files/40289d3d7661398f0176615d9dbd0001)
 
 Application will save all forms in **DynamicForms** folder. Inside DynamicForms, there will be one folder for each dynamic form and it should contain at least 3 files:
*  htmlContent.tgn
*  selectQuery
*  saveQuery-1

![](/cf/files/402816927661a061017661a86f8c0004)

![](/cf/files/40289d3d7661398f0176617633730002)



**Note: **There should be one file for each save query.

Like dynamic forms, each dashlet details will be stored in seperate folder and all dashlets will be saved in Dashlets folder. There should be only two files in each folder:
* htmlContent
* selectQuery

![](/cf/files/40289d3d7661398f0176617e3aee0004)

![](/cf/files/402816927661a061017661a88a860006)


', 13, NOW(), 'admin');





REPLACE INTO manual_entry (manual_entry_id, manual_type, entry_name, entry_content, sort_index, last_modified_on, last_updated_by) VALUES
('e03447c8-eaa0-4119-b97e-b802bd8f4ff1', '07cf45ae-2987-11eb-a9be-e454e805e22f', 'User Management', '# User Management 
User management utils provides  user authentication through various authentication types.It also provides ACL. In order to  use these, you need to include the usermanagement jar in your pom.xml.

```
<dependency>
<groupId>com.trigyn</groupId>
<artifactId>usermanagement</artifactId>
<version>version</version>
</dependency>
```


These module provide following features ->  
* Manage roles -
* Manage users - 
* Manage permissions - 

![](/cf/files/4028b8817646ed030176480e43ab0026)



** Manage roles** 
  There are 3 predefined system roles  : ADMIN, AUTHENTICATED, ANONYMOUS  which you can''t edit.
	 You can add/edit  role  and set as active or inactive depending on your use case.
	 
![](/cf/files/4028b8817646ed03017647dc3ab40021)

** Manage users** 
	 There is 1 predefined user which can''t be modified : admin user
	While  add/edit user by default AUTHENTICATED role will be assigned and disabled.
	
![](/cf/files/4028b8817646ed03017647ef2f050022)
	
	You need to enter basic user fields "name", "email"  etc..   and assign role.
	You can active/deactivate a user through "is active" field.
	 If you enable "force user to change password" field  then a mail would be sent to the user
	 mail id  for changing the password or else a default password would be
	 sent for login purpose
	The template used for email is : "force-password-mail".
	You can modify if you need to alter it.
	
![](/cf/files/4028b8817646ed03017647f1c1330023)
 

	 
**Manage Permissions**
	 There are 2 tabs listed here - Manage Role Modules,  Manage Entity Roles
	 
	 Manage Role Modules -  Various Modules are listed  with roles associated to it, user can enable/disable to access  
	 particular module or not ex Grid Module. If user has authenitcated role and if we disable then the user having only
	 authenticated role cannot access the module. Grid Module - Cannot access the listing grid , cannot add or edit grid 
	 details.
	 
![](/cf/files/4028b8817646ed030176480a3c080024)
	 
	 Manage Entity Roles -  It contains all the entites which are made up from various modules  present above 
	 if we want to remove a particular entity access just uncheck it from the grid for that role. 
	 Only those modules will be visible whose module_type_id = 0 is in the table jws_entity_role_association
	 
![](/cf/files/4028b8817646ed030176480ce3fd0025)
	 


There are 4 types of authentication:

1) In-memory
2) Database
3) LDAP
4) OAuth

![](/cf/files/4028b8817650f1220176511211c40002)


**Database Authentication **  There are 3 different ways to configure database authentication :
1) Password
2) Password + Captcha
3) TOTP

![](/cf/files/4028b8817650f122017651166e0d0004)

**Password **-   Email id + password login 

![](/cf/files/4028b8817650f12201765121c1300005)
 
** Password + Captcha **-  Email id + password  + captcha login 
 
![](/cf/files/4028b8817650f122017651226ab90006)
	
**	TOTP **- Email Id + TOTP login
	
![](/cf/files/4028b8817650f12201765122f1750007)
 



**OAuth** : There are 3 clients for signing through 
1) Google
2) Facebook
3) Office365

![](/cf/files/4028b881765fd657017660116dac0000)


**Google OAuth Steps** - 

1) Go to https://console.developers.google.com/apis/credentials  

2)  Refer above image  click on project
 
![](/cf/files/4028b881765fd65701766028c6f60001)
 
3) Add project name and  and keep  location as default value, then click on create
 
![](/cf/files/4028b881765fd6570176602a9c080002)
 
4) Click on "+ New Credentials" > O Auth client Id > Click on configure consent screen 
   1) Select on  external user type  > create button  >
	 
![](/cf/files/4028b881765fd6570176602ca2d50003)
		
   2) Add mandatory fields in step 1 and keep rest of the steps as default and continue
   
![](/cf/files/4028b8817661a798017661afd9e80000)
		
 5)Click on Credentials tab  >  Click on + new credentials > O Auth client Id > select web application  and add application name
    1) Scroll down and add google redirect uri http://localhost:8080/login/oauth2/code/google
    2)Clck on create after that a pop up would be displayed with client id and secret id > copy it 

![](/cf/files/4028b881765fd6570176609447520005)
	 
6)  Go to jws_authentication_type table  > Oauth > change authentication_properties of google client id and secret id 


**Facebook Oauth Steps** -
1) Go to https://developers.facebook.com
2) Click on myapps    > Click on create app >Choose Build Connected Experiences and continue  >Enter App display name  and rest as default and click on create app 

![](/cf/files/4028b881765fd657017660d3c0550006)
 
3) Click on  Settings tab > Click on basic  you will get client  id and secret id

![](/cf/files/4028b881765fd657017660d441bd0007)

4)  Go to jws_authentication_type table  > Oauth > change authentication_properties  of facebook client id and secret id


**Office365 Oauth Steps** -
1) Click on https://portal.azure.com/
2) Click on Azure active Directory> Click on app registration > Click on new registration

![](/cf/files/4028b881765fd657017660d70c6d0008)

3) Enter name > choose single tenant  > choose web >scroll down to bottom and add redirect uri Example http://localhost:8080/login/oauth2/code/office365 > Click on register 

![](/cf/files/4028b881765fd657017660d8b7380009)

4) After that you will be reidrected to overiew > Copy the Application (client) ID 

![](/cf/files/4028b881765fd657017660d92df9000a)

5) Click on Certificates And Secrets tab  > Click on New Client Secret  >  Enter description for client and click add

![](/cf/files/4028b881765fd657017660da0caa000b)

6) Copy client secret value from "Value" column data  and maintain safely  it is secret id 

![](/cf/files/4028b881765fd657017660da9464000c)

7) Go to jws_authentication_type table  > Oauth > change authentication_properties  of office365  client id and secret id 

', 3, NOW(), 'admin@jquiver.com');



REPLACE INTO jws_file_upload (file_upload_id, file_path, original_file_name, physical_file_name, updated_by, last_update_ts, file_config_id) VALUES
('40281694762864a50176288c66620001', '/images', 'REST_API_Home.png', '54d81128-66eb-44e1-bd7c-a7aba6c1f081', 'admin', NOW(), 'dynamic-form'), 
('40281694762864a50176288c755a0002', '/images', 'REST_API_Step_1.PNG', 'f34047da-dbe7-4f0a-8672-8ff74a47b391', 'admin', NOW(), 'dynamic-form'),
('402816947628cb18017628cfa6110000', '/images', 'REST_API_Step_2.PNG', '538e5a16-0eb6-47d3-b196-23733426a0e1', 'admin',  NOW(), 'dynamic-form'),
('402816947628e22d017628e709eb0000', '/images', 'Dashboard_Master.PNG', '1a999d28-8f4b-4475-99e6-439e7b40bec4', 'admin',  NOW(), 'dynamic-form'), 
('40289d3d7650c0a1017650c8fccf0001', '/images', 'Add_Edit_Dashlet_Step_1.png', '5eda819c-bcbb-486a-b94b-1d93d73379c5', 'admin',  NOW(), 'dynamic-form'), 
('40289d3d7650c0a1017650c90cce0002', '/images', 'Add_Edit_Dashlet_Step_2.png', 'e54568fc-8d7c-40eb-ab62-cd8521956878', 'admin',  NOW(), 'dynamic-form'),
('402816947628e22d017628e71f020001', '/images', 'Add_Edit_Dashlet_3.PNG', 'ff8c8d67-2b68-4a2b-843b-de7d747324b7', 'admin',  NOW(), 'dynamic-form'), 
('402816947628e22d017628ea39e00002', '/images', 'Add_Edit_Dashlet_4.PNG', '75368f52-d90f-456c-b9f5-69703014991e', 'admin', NOW(), 'dynamic-form'),
('40289d3d7650c0a1017650c8ef410000', '/images', 'Add_Edit_Dashboard_Step_1.png', '8346ff39-89b4-40f2-b1fa-cd01ca503541', 'admin', NOW(), 'dynamic-form'),
('40289d3d7629c275017629c35c830000', '/images', 'Add_Edit_Dashboard_Step_2.PNG', '606e1003-2f89-4514-9b63-1ff0d11ac8ce', 'admin', NOW(), 'dynamic-form'),
('40289d3d7629c27501762a0eb728000a', '/images', 'Revision_Enable_UI.PNG', '461685d6-a188-406c-920e-41bc210ada68', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7629c27501762a0ee8f3000b', '/images', 'Revision_Simple_1.PNG', '5303697a-2fc2-4abc-af89-9621fe0fdf25', 'admin', NOW(), 'dynamic-form'), 
('40289d3d76509b1e017650ae7d4d0015', '/images', 'Revision_Simple_2.png', 'af8ce88f-a5f0-401d-ac19-05fb1e583d15', 'admin', NOW(), 'dynamic-form'),
('40289d3d7629c27501762a0f3e5a000c', '/images', 'Revision_Simple_3.PNG', 'ed8c766f-5da2-4dbe-a335-c3aeca501157', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7629c27501762a0f8466000d', '/images', 'Revision_Complex_1.PNG', '4713e718-d56d-46f4-9d98-fb0c74902c4a', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7629c27501762a0f914b000e', '/images', 'Revision_Complex_2.PNG', '44c79c88-138d-487e-ab18-187c55efff6c', 'admin', NOW(), 'dynamic-form'),
('40289d3d7629c27501762a0f9c51000f', '/images', 'Revision_Complex_3.PNG', '1de987bc-dbc4-46f3-9eb4-d524304c5fe4', 'admin', NOW(), 'dynamic-form'),
('40289d3d7629c27501762a22257f0012', '/images', 'Grid_Util_Master.PNG', '5a25ffc8-d516-41ca-931e-6a3ad8ddf6bf', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7629c27501762a22341b0013', '/images', 'Add_Grid_Utils.PNG', 'dbbaf3ee-eb76-4e9c-8df4-27e8be86cab2', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7629c27501762a223f2e0014', '/images', 'Add_Grid_Utils_Step_2.PNG', '2cb34a18-ad8c-4ace-818f-d7d3eb0d5d5d', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7629c27501762a2258450015', '/images', 'Listing_Template.PNG', '165dad67-09bf-4521-b4cf-023f7851516f', 'admin', NOW(), 'dynamic-form'),
('40289d3d762c323c01762cc6c8a30000', '/images', 'Multilingual_Master.PNG', '263dbcbd-754e-42d0-b1bf-3ba1dfa85a0e', 'admin', NOW(), 'dynamic-form'), 
('40289d3d762c323c01762cc6f25c0001', '/images', 'Add_Multilingual_Data_Step_1.PNG', 'd6e30474-ca6c-4b3c-8894-090f1d985de5', 'admin', NOW(), 'dynamic-form'), 
('40289d3d762c323c01762cc7015f0002', '/images', 'Add_Multilingual_Data_Step_2.PNG', '3d331031-fb3c-4aaa-81f9-e18dc99d2812', 'admin', NOW(), 'dynamic-form'), 
('40289d3d762c323c01762cc712310003', '/images', 'Multilingual_Demo.PNG', '5a1a9bf9-ce85-483c-8eb9-a9ce0d8884b9', 'admin',NOW(), 'dynamic-form'), 
('40289d3d762c323c01762cc71ee00004', '/images', 'Multilingual_Demo_French.PNG', '688edc01-ec45-4a09-a08e-d18f7b5000ee', 'admin', NOW(), 'dynamic-form'), 
('40289d3d762c323c01762cc72f480005', '/images', 'Multilingual_Demo_Hindi.PNG', '86247f52-2f06-4506-b8e5-03056d3bbaca', 'admin', NOW(), 'dynamic-form'),
('40289d3d763887410176388995320000', '/images', 'Application_Configuration_1.PNG', '2e4403fd-9d8f-42ed-a782-551e45f50a59', 'admin', NOW(), 'dynamic-form'), 
('40289d3d763887410176388b36b60001', '/images', 'Application_Configuration_2.PNG', '11fdbaad-55f3-48e6-8032-4fd650df0e30', 'admin', NOW(), 'dynamic-form'),
('4028168b7647e50a0176488ec8860003', '/images', 'Template_Without_Param.PNG', 'c9336bc5-f083-42cd-bf70-152ef859b638', 'admin', NOW(), 'dynamic-form'), 
('4028168b7647e50a0176488f32110004', '/images', 'Template_With_Param.PNG', '3fb18376-b4df-43c7-bfde-a62ac98e241b', 'admin', NOW(), 'dynamic-form'), 
('4028168b7647e50a0176488f4ebe0005', '/images', 'Resource_Bundle_Without_Default.png', 'db085e59-de62-440c-a8c5-039595a8392a', 'admin', NOW(), 'dynamic-form'), 
('4028168b7647e50a0176488f60ba0006', '/images', 'Resource_Bundle_With_Default.png', '79fd4660-5fd7-40c0-9238-92a0b9e91cae', 'admin',NOW(), 'dynamic-form'),
('4028168b7647e50a017648c9a2fc0008', '/images', 'Profile_Property.PNG', '284056ff-151a-4230-a044-cf04306b89bf', 'admin', NOW(), 'dynamic-form'), 
('4028168b7647e50a017648ca0c690009', '/images', 'Template_Storage_Location_Property.png', '425284ef-03b1-4fbd-81f2-6649c6fb0404', 'admin', NOW(), 'dynamic-form'),
('4028b8817646ed03017647dc3ab40021', '/images', 'manageRole.PNG', '1eab0154-70c2-4b19-824b-3a99a7f72bb5', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817646ed03017647ef2f050022', '/images', 'manageUser.PNG', '55072ccf-76cf-4a20-b66b-8d9ba9371e38', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817646ed03017647f1c1330023', '/images', 'forcePasswordMail.PNG', '076e8dd4-6389-4a13-be07-c524e96dbef7', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817646ed030176480a3c080024', '/images', 'manageRoleModule.PNG', '50b32b99-29e1-45e4-8920-84701895e783', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817646ed030176480ce3fd0025', '/images', 'manageEntityRole.PNG', '891bd5e4-043a-41eb-a623-95856f23c453', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817646ed030176480e43ab0026', '/images', 'userManagement.PNG', '75354d31-d32b-41d8-877c-f15b86bac8da', 'admin@jquiver.com', NOW(), 'dynamic-form'),
('4028b8817650f1220176511211c40002', '/images', 'authTypes.png', '85b8a915-bd77-4b54-9e39-0fcbc27fb9d0', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817650f12201765116077e0003', '/images', 'databaseAuth-1.png', 'ebfd663a-42ec-4ce9-9190-f0f9b6acba74', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817650f122017651166e0d0004', '/images', 'databaseAuth-2.png', '9563f6a8-7ef5-4bef-8db5-2a89edf07c75', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817650f12201765121c1300005', '/images', 'databaseAuth-password.png', '7f733b86-f55b-4eb5-ab5d-1a0f530aeeec', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817650f122017651226ab90006', '/images', 'databaseAuth-password-captcha.png', '43966179-960e-4339-aa47-94d676a44aa0', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b8817650f12201765122f1750007', '/images', 'databaseAuth-totp.png', '93c8b0c5-3e68-444b-8c64-fb86c6aaf62f', 'admin@jquiver.com',NOW(), 'dynamic-form'), 
('4028b881765fd657017660116dac0000', '/images', 'oauth-clients.png', '394f9c18-0b9e-4f05-ac14-ca4a754fc018', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd65701766028c6f60001', '/images', 'google-credentials.PNG', 'e6599f51-6988-4ec3-b382-a0caeb78105a', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd6570176602a9c080002', '/images', 'google-create-project.PNG', '3df83556-44da-48a1-a68b-7ad6d2d84b14', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd6570176602ca2d50003', '/images', 'google-configure-consent-screen.PNG', '554929bc-c01a-4f7b-8786-386107c7e682', 'admin@jquiver.com',NOW() , 'dynamic-form'), 
('4028b881765fd6570176602d10ac0004', '/images', 'google-configure-consent-screen-2.PNG', '86102523-6b13-4313-8d27-c9db1816d54f', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd6570176609447520005', '/images', 'google-credentials-3.PNG', '67d1978e-1274-4e51-9a75-4ffbba12a8d3', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660d3c0550006', '/images', 'facebook-1.PNG', 'e0820928-668d-4558-bd8c-e4e9d190a764', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660d441bd0007', '/images', 'facebook-2.PNG', 'a9a61d99-4697-4482-b791-b651fa49373e', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660d70c6d0008', '/images', 'offcie365-1.PNG', '8f1ca6b2-b9e5-4dfa-ac9b-1976637abc4b', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660d8b7380009', '/images', 'offcie365-2.PNG', 'd1ef583f-6fc7-4a58-a5d8-9e015052f0f8', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660d92df9000a', '/images', 'offcie365-3.PNG', 'cad0118f-f44f-48fa-b6de-ff2b6fc74fa2', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660da0caa000b', '/images', 'offcie365-4.PNG', '4e4a9bd9-d0ed-44e0-9b14-263bcc39f25c', 'admin@jquiver.com', NOW(), 'dynamic-form'), 
('4028b881765fd657017660da9464000c', '/images', 'offcie365-5.PNG', 'bf29893b-b207-4982-b350-a32c8ca377a0', 'admin@jquiver.com', NOW() , 'dynamic-form'),
('40289d3d765124480176512a5e0f0000', '/images', 'Autocomplete_Example_1.PNG', 'cb9f36dd-18be-429a-b6be-9a6042f06c9a', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765124480176512a6e660001', '/images', 'Autocomplete_Example_2.PNG', 'f77ad3ca-d27c-4a0a-a2e7-e9a4ebd776a0', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765124480176512a79560002', '/images', 'Autocomplete_Example_3.PNG', '17fb0677-f999-4fe0-8cd9-7190098a7e8d', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765124480176512a89830003', '/images', 'Autocomplete_Example_4.PNG', 'bf5e5d91-56f2-4c75-89aa-458612aba3cd', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765124480176512a96630004', '/images', 'MultiSelect_Example_1.PNG', '99a536d6-7dd4-4e7e-9702-6a312c14cc8a', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765124480176512aa3f80005', '/images', 'MultiSelect_Example_2.PNG', 'db6394b8-d7a6-4231-be9a-f587794e2f99', 'admin', NOW(), 'dynamic-form'),
('40289d3d765d4f9c01765d5514740000', '/images', 'Profile_Property.PNG', 'e8ba205c-1f99-46e6-891f-cf7f220daf76', 'admin', NOW(), 'dynamic-form'),
('40289d3d765d4f9c01765d67c7d90005', '/images', 'Template_Download_All.PNG', '118e8bd6-1fa5-4b72-b30a-64e4ac09a447', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765d4f9c01765d67d7850006', '/images', 'Template_Upload_All.PNG', '27d6eba0-55b4-4e82-82fb-4c16d38d1d19', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765d4f9c01765d67e8320007', '/images', 'Dynamic_Form_Download_All.PNG', '2684d1d6-6650-4d08-bed8-fb229afa969c', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765d4f9c01765d67f5d90008', '/images', 'Dynamic_Form_Upload_All.PNG', '58bd210e-47d5-4516-a9dc-89b27d32d49d', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765d4f9c01765d7279a50009', '/images', 'Dashlet_Download_All.png', '8090ddee-8014-46a0-b147-6c2ed5fd6d57', 'admin', NOW(), 'dynamic-form'), 
('40289d3d765d4f9c01765d7287ee000a', '/images', 'Dashlet_Upload_All.png', '092a5276-c6c6-4710-a50b-c1913b8c2d36', 'admin', NOW(), 'dynamic-form'),
('40289d3d7660efd0017660f91702000a', '/images', 'Template_Action_Buttons.PNG', '65b32265-e86e-4e87-9901-2e986dda2dc1', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7660efd0017660f9a518000b', '/images', 'Dashlet_Action_Buttons.png', '4a848d47-474d-4d27-a597-adf003fd094a', 'admin', NOW(), 'dynamic-form'), 
('40289d3d7660efd0017660f9ba53000c', '/images', 'Dynamic_Form_Action_Buttons.PNG', '46d81eed-e1a6-4db2-b02f-bb617321f08f', 'admin', NOW(), 'dynamic-form'),
('40289d3d7661398f0176615d9dbd0001', '/images', 'Template_Folder_Structure.PNG', 'fa1b8ef9-5a89-49b1-935d-25959e47ed21', 'admin', NOW(), 'dynamic-form'),
('402816927661a061017661a88a860006', '/images', 'Dashlet_Folder_Structure_1.PNG', '2b9debb5-9f13-40e6-9d58-e51a7c83e0d7', 'admin', NOW(), 'dynamic-form'),
('40289d3d7661398f0176617e3aee0004', '/images', 'Dashlet_Folder_Structure_2.PNG', '850316b0-bd29-41a3-88b8-30764903b73b', 'admin',  NOW(), 'dynamic-form'),
('402816927661a061017661a86f8c0004', '/images', 'Dynamic_Form_Folder_Structure_1.PNG', 'a0661c6d-887b-44eb-9bb4-ac29cfe78dc3', 'admin', NOW(), 'dynamic-form'),
('40289d3d7661398f0176617633730002', '/images', 'Dynamic_Form_Folder_Structure_2.PNG', 'b7568e9a-c31b-4492-bea1-bfe580a580ec', 'admin',  NOW(), 'dynamic-form');
 

SET FOREIGN_KEY_CHECKS=1;


