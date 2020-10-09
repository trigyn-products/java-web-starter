
REPLACE INTO template_master (template_id, template_name, template, updated_by, created_by, updated_date) VALUES 
('d5a5102b-09ab-11eb-a027-f48e38ab8cd7', 'default-listing-template', '<head>
<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.css"/>
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.theme.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="/webjars/1.0/pqGrid/pqgrid.min.js"></script>          
<script src="/webjars/1.0/gridutils/gridutils.js"></script> 
<link rel="stylesheet" href="/webjars/1.0/pqGrid/pqgrid.min.css" />
<link rel="stylesheet" href="/webjars/1.0/css/starter.style.css" />
</head>

<div class="container">
	<div class="topband">
		<h2 class="title-cls-name float-left">Your page title here</h2> 
		<div class="float-right">
			<form id="addEditRecords" action="${(contextPath)!''''}/cf/df" method="post" class="margin-r-5 pull-left">
				<input type="hidden" name="formId" value=""/>
				<input type="hidden" name="primaryId" id="primaryId" value=""/>
				<button type="submit" class="btn btn-primary"> Create New </button>
			</form>


			<span onclick="backToWelcomePage();">
				<input id="backBtn" class="btn btn-secondary" name="backBtn" value="Back" type="button">
			</span>	
		</div>
		
		<div class="clearfix"></div>		
	</div>
		
	<div id="yourGridId"></div>

</div>



<script>
	contextPath = "${contextPath}";
	$(function () {
	//Add all columns that needs to be displayed in the grid
		let colM = [
			{ title: "Column Name to be displayed", width: 130, dataIndx: "columnNameInQuery", align: "left", align: "left", halign: "center",
				filter: { type: "textbox", condition: "contain", listeners: ["change"]}  },
			{ title: "Action", width: 50, dataIndx: "action", align: "center", halign: "center", render: manageRecord}
		];
	
	//System will fecth grid data based on gridId
		let grid = $("#yourGridId").grid({
	      gridId: "",
	      colModel: colM
	  	});
	
	});
	
	//Customize grid action column. You can add buttons to perform various operations on records like add, edit, delete etc.
	function manageRecord(uiObject) {
		let primaryId = uiObject.rowData;

		console.log(uiObject);
	}
	
	//Add logic to navigate to create new record
	function createNew(element) {
		$("#primaryId").val(element.id);
		$("#addEditRecords").submit();
	}

	//Code go back to previous page
	function backToWelcomePage() {
		location.href = contextPath+"/cf/home";
	}
</script>', 'aar.dev@trigyn.com', 'aar.dev@trigyn.com',NOW());


REPLACE INTO template_master (template_id, template_name, template, updated_by, created_by, updated_date) VALUES 
('dfdf7c4e-09ab-11eb-a027-f48e38ab8cd7', 'default-form-template', '<head>
<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.css"/>
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.theme.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="/webjars/1.0/pqGrid/pqgrid.min.js"></script>          
<script src="/webjars/1.0/gridutils/gridutils.js"></script> 
<link rel="stylesheet" href="/webjars/1.0/pqGrid/pqgrid.min.css" />
<link rel="stylesheet" href="/webjars/1.0/css/starter.style.css" />
</head>

<div class="container">
	<div class="topband">
		<h2 class="title-cls-name float-left">Your page title here</h2> 
		<div class="float-right">
			<input class="btn btn-primary" name="createDashboard" value="Create new" type="button" onclick="createNew()">
			<span onclick="backToPreviousPage();">
				<input id="backBtn" class="btn btn-secondary" name="backBtn" value="Back" type="button">
			</span>	
		</div>
		
		<div class="clearfix"></div>		
	</div>
		
	<form method="post" name="addEditForm" id="addEditForm">
		
		<!-- You can include any type of form element over here -->
		<div class="row">
			<div class="col-3">
				<div class="col-inner-form full-form-fields">
					<label for="field1" style="white-space:nowrap"><span class="asteriskmark">*</span>Field 1</label>
					<input type="text" id="" name="field1" value="" maxlength="100" class="form-control">
				</div>
			</div>
			
			<div class="col-3">
				<div class="col-inner-form full-form-fields">
					<label for="field1" style="white-space:nowrap">Field 2</label>
						<select id="" name="field1"  class="form-control">
							<option value="">Select</option>
						</select>
					</label>
				</div>
			</div>
		</div>
		<!-- Your form fields end -->
		
		
		<div class="row">
			<div class="col-12">
				<div class="float-right">
					<input id="formId" class="btn btn-primary" name="addTemplate" value="Save" type="button" onclick="saveData();">
					<span onclick="backToPreviousPage();">
						<input id="backBtn" class="btn btn-secondary" name="backBtn" value="Cancel" type="button">
					</span> 
				</div>
			</div>
		</div>
		
	</form>


</div>



<script>
	contextPath = "${contextPath}";
	
	//Add logic to save form data
	function saveData (){
		let formData = $("#addEditForm").serialize();
	}
	
	//Code go back to previous page
	function backToPreviousPage() {
		
	}
</script>', 'aar.dev@trigyn.com', 'aar.dev@trigyn.com',NOW());




REPLACE INTO template_master (template_id, template_name, template, updated_by, created_by, updated_date) VALUES 
('e700ac42-09ab-11eb-a027-f48e38ab8cd7', 'default-template', '<head>
<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/webjars/1.0/css/starter.style.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script> 
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<div class="container" style="padding-top: 40px">
    <div class="page-header">
        
    </div>

	
</div>', 'aar.dev@trigyn.com', 'aar.dev@trigyn.com',NOW());



replace into template_master (template_id, template_name, template, updated_by, created_by, updated_date, checksum) VALUES
('ec26a648-09ab-11eb-a027-f48e38ab8cd7', 'system-form-html-template', '
<head>
<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.css"/>
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.theme.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/webjars/1.0/css/starter.style.css" />
</head>

<div class="container">
	<div class="topband">
		<h2 class="title-cls-name float-left">Add Edit Details</h2> 
		<div class="clearfix"></div>		
	</div>
  <form method="post" name="addEditForm" id="addEditForm">
    
    <#if (columnDetails)??>
    	<div class="row">
    	<#list columnDetails as columnDetailsList>
    		<div class="col-3">
			<div class="col-inner-form full-form-fields">
			<#if columnDetailsList?api.get(''columnType'') != "textarea">
		            <label for="${columnDetailsList?api.get(''columnName'')}" style="white-space:nowrap"><span class="asteriskmark">*</span>
		              ${columnDetailsList?api.get("fieldName")!""}
		            </label>
				<input type="${columnDetailsList?api.get(''columnType'')}" id="${columnDetailsList?api.get(''columnName'')}" name="${columnDetailsList?api.get(''columnName'')}"  value="" maxlength="${columnDetailsList?api.get(''columnSize'')}" class="form-control">
			<#else>
				<span class="asteriskmark">*</span>
				<label for="${columnDetailsList?api.get("columnName")!""}">${columnDetailsList?api.get("fieldName")!""}</label>
				<textarea class="form-control" rows="15" cols="90" title="${columnDetailsList?api.get("fieldName")!""}" id="${columnDetailsList?api.get("columnName")!""}" placeholder="${columnDetailsList?api.get("fieldName")!""}" name="${columnDetailsList?api.get("columnName")!""}" style="height:80px"></textarea>
			</#if>
			</div>
		</div>
    	</#list>
    	</div>
    </#if>
    
  </form>
  <div class="row">
			<div class="col-12">
				<div class="float-right">
					<input id="formId" class="btn btn-primary" name="addTemplate" value="Save" type="button" onclick="saveData();">
					<span onclick="backToPreviousPage();">
						<input id="backBtn" class="btn btn-secondary" name="backBtn" value="Cancel" type="button">
					</span> 
				</div>
			</div>
		</div>
</div>
<script>
  <#noparse>
	let formId = "${formId}";
	contextPath = "${contextPath}";
	</#noparse>
  
  $(function(){
    // setting value on edit.
    <#noparse>
      <#if (resultSet)??>
      	<#list resultSet as resultSetList>
      		$("#fieldId option[value=''${resultSetList?api.get("aliasFromSelectQuery")}'']").attr("selected", "selected");
      		$("#fieldId").val(''${resultSetList?api.get("aliasFromSelectQuery")}'');
      	</#list>
      </#if>
    </#noparse>
    
  });
  
	//Add logic to save form data
	function saveData (){
		let formData = $("#addEditForm").serialize()+ "&formId="+formId;
		$.ajax({
		  type : "POST",
		  url : contextPath+"/cf/sdf",
		  data : formData,
          success : function(data) {
			showMessage("Information saved successfully", "success");
		  },
	      error : function(xhr, error){
			showMessage("Error occurred while saving", "error");
	      },
		});
	}
	
	//Code go back to previous page
	function backToPreviousPage() {
		location.href = contextPath+"/cf/home";
	}
</script>
', 'aar.dev@trigyn.com', 'aar.dev@trigyn.com', NOW(), NULL);

REPLACE INTO  template_master (template_id, template_name, template, updated_by, created_by, updated_date, checksum) VALUES
('f16c057f-09ab-11eb-a027-f48e38ab8cd7', 'system-form-save-query-template', '
  <#noparse>
    <#if (formData?api.getFirst("yourPrimaryKey"))?has_content>
  </#noparse>
    ${updateQuery}
  <#noparse>
    <#else>
  </#noparse>
    ${insertQuery}
  <#noparse>
    </#if>
  </#noparse>
', 'aar.dev@trigyn.com', 'aar.dev@trigyn.com', NOW(), NULL);



REPLACE INTO template_master (template_id, template_name, template, updated_by, created_by, updated_date) VALUES 
('d3cb061d-0743-11eb-9926-e454e805e22f', 'system-listing-template', '<head>
<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.css"/>
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.theme.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="/webjars/1.0/pqGrid/pqgrid.min.js"></script>          
<script src="/webjars/1.0/gridutils/gridutils.js"></script> 
<link rel="stylesheet" href="/webjars/1.0/pqGrid/pqgrid.min.css" />
<link rel="stylesheet" href="/webjars/1.0/css/starter.style.css" />
</head>

<div class="container">
    <div class="topband">
        <h2 class="title-cls-name float-left">Your page title here</h2> 
        <div class="float-right">
            <form id="addEditRecords" action="${(contextPath)!''''}/cf/df" method="post" class="margin-r-5 pull-left">
                <input type="hidden" name="formId" value="${formId}"/>
                <#list primaryKeysIds as primaryKey>
                <input type="hidden" name="${primaryKey}" id="${primaryKey}" value=""/>
                </#list>
                <button type="submit" class="btn btn-primary"> Create New </button>
            </form>


            <span onclick="backToWelcomePage();">
                <input id="backBtn" class="btn btn-secondary" name="backBtn" value="Back" type="button">
            </span> 
        </div>
        
        <div class="clearfix"></div>        
    </div>
        
    <div id="${gridId}"></div>

    <div id="snackbar"></div>
</div>

<script>
    contextPath = "${contextPath}";
    $(function () {
    //Add all columns that needs to be displayed in the grid
        let colM = [
          <#list gridDetails as gridInfo>
            { title: "${gridInfo?api.get("displayName")}", width: 130, dataIndx: "${gridInfo?api.get("column")}", align: "left", align: "left", halign: "center",
                filter: { type: "textbox", condition: "contain", listeners: ["change"]}  },
          </#list>
            { title: "Action", width: 50, dataIndx: "action", align: "center", halign: "center", render: manageRecord}
        ];
    
    //System will fecth grid data based on gridId
        let grid = $("#${gridId}").grid({
          gridId: "${gridId}",
          colModel: colM
        });
    
    });
    
    //Customize grid action column. You can add buttons to perform various operations on records like add, edit, delete etc.
    function manageRecord(uiObject) {
        let rowIndx = uiObject.rowIndx;
        return ''<span id="''+rowIndx+''" onclick="createNew(this)" class= "grid_action_icons"><i class="fa fa-pencil"></i></span>''.toString();
    }
    
    //Add logic to navigate to create new record
    function createNew(element) {
        let rowData = $( "#propertyMasterListingGrid" ).pqGrid("getRowData", {rowIndxPage: element.id});
        <#list primaryKeys as primaryKey>
        $("#${primaryKey?replace("_", "")}").val(rowData["${primaryKey}"]);
        </#list>
        $("#addEditRecords").submit();
    }

    //Code go back to previous page
    function backToWelcomePage() {
        location.href = contextPath+"/cf/home";
    }
</script>', 'admin', 'admin',NOW());