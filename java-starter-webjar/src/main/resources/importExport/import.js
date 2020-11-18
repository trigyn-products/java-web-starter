
    function importFile() {
		importedFileData = new FormData(document.getElementById("importForm"))
    	    	
    	$.ajax({
	    	url : '/cf/impF',
	    	type : "post",
	    	data: importedFileData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	    	success : function(data) {
				localStorage.removeItem("imporatableData");
	    		localStorage.removeItem("importedIdList");
	    		imporatableData = data;
	    		loadTable(imporatableData);
	    	},
	    	error: function (textStatus, errorThrown) {
	    		showMessage("Error while importing data", "error");
	    	}
    	});
    }
    
    function loadTable(data) {
    	var versionMap = new Map();
    	$.ajax({
	    	url : '/cf/glv',
	    	async : false,
	    	type : "post",
	    	data: {
	    		imporatableData : data
	    	},
	    	success : function(outData) {
	    		let versionJson = JSON.parse(outData);
	    		for (var value in versionJson) {  
	    			versionMap.set(value,versionJson[value])  
	    		}
	    	},
	    	error: function (textStatus, errorThrown) {
	    		showMessage("Error while importing data", "error");
	    	}
    	});
    	
    	var crcMap = new Map();
    	$.ajax({
	    	url : '/cf/glcrc',
	    	async : false,
	    	type : "post",
	    	data: {
	    		imporatableData : data
	    	},
	    	success : function(outData) {
	    		let crcJson = JSON.parse(outData);
	    		for (var value in crcJson) {  
	    			crcMap.set(value,crcJson[value])  
	    		}
	    	},
	    	error: function (textStatus, errorThrown) {
	    		showMessage("Error while importing data", "error");
	    	}
    	});
    	
    	
    	let jsonObject = JSON.parse(data);
		for (var value in jsonObject) {  
			zipFileJsonDataMap.set(value,jsonObject[value])  
		}  
		
		let completeZipJsonData = zipFileJsonDataMap.get("completeZipJsonData");
		var htmlTableJsonArray = JSON.parse(completeZipJsonData);
		var tableRow="";
		$("#htmlTable > tbody").empty();
		if(htmlTableJsonArray != null) {
			for (var i = 0; i < htmlTableJsonArray.length; i++) {
				let importVersion = htmlTableJsonArray[i].moduleVersion;
				let moduleType = htmlTableJsonArray[i].moduleType;
				let moduleID = htmlTableJsonArray[i].moduleID;
				let existingVersion = versionMap.get(moduleID);
				let isNonVersioningModule = "false";
				if(moduleType == "FileManager" || moduleType == "Permission" || moduleType == "SiteLayout") {
					isNonVersioningModule = "true";
				}
				let isCheckSumUpdated = crcMap.get(moduleID);
				
				tableRow += '<tr>';
				tableRow += '<td><label>'+moduleType+'</label> </td>';
				tableRow += '<td><label>'+moduleID+'</label> </td>';
				tableRow += '<td><label s>'+htmlTableJsonArray[i].moduleName+'</label> </td>';
				tableRow += '<td><label id = "lblExistingVersion' + moduleID +'">'+ existingVersion +'</label> </td>';
				tableRow += '<td><label>'+ importVersion +'</label> </td>';
				tableRow += '<td>';
				
				if((existingVersion == "NA" && isNonVersioningModule == "false") || idList.includes(moduleID) || isCheckSumUpdated == false) {
					tableRow += '<button id="btnCompare'+ moduleID +'" class="btn" name="importInd" type="button" disabled="disabled" ' 
								+ 'onclick="submitRevisionForm(\'' + moduleType +'\','
								+ '\'' + moduleID +'\')" >'
								+ '<i class="fa fa-exchange"></i></button>';
				} else {
					tableRow += '<button id="btnCompare'+ moduleID +'" class="btn" name="importInd" type="button" ' 
								+ 'onclick="submitRevisionForm(\'' + moduleType +'\','
								+ '\'' + moduleID +'\')" >'
								+ '<i class="fa fa-exchange"></i></button>';
				}
				
				if(idList.includes(moduleID) || isCheckSumUpdated == false) {
					tableRow += '<button id="btnImport'+ moduleID +'" class="btn" name="importInd" type="button"  disabled="disabled" ' 
								+ 'onclick="importSingle(\'' + moduleType +'\','
								+ '\'' + moduleID +'\')" >'
								+ '<i class="fa fa-download"></i></button>';
				} else {
					tableRow += '<button id="btnImport'+ moduleID +'" class="btn" name="importInd" type="button" ' 
								+ 'onclick="importSingle(\'' + moduleType +'\','
								+ '\'' + moduleID +'\')" >'
								+ '<i class="fa fa-download"></i></button>';
				}
				tableRow += '</td>';
				tableRow += '</tr>';
	        }
		}

		$("#htmlTable > tbody").append(tableRow);	
    }

    function submitRevisionForm(moduleType, entityId) {
    	let entity = zipFileJsonDataMap.get(entityId);
    	let jsonObject = JSON.parse(entity);
		let formId = "";
		let moduleName = "";
		let saveURL = "";
		let isNonVersioningModule = "false";
		let nonVersioningFetchURL = "";

		localStorage.setItem("imporatableData", imporatableData);
		
		if(moduleType == "Grid") {
			formId = jsonObject["formId"];
			moduleName = jsonObject["gridName"];
			moduleTypeStr = "grid";
		}  else if(moduleType == "Templates") {
			saveURL = "/cf/stdv";
			moduleName = jsonObject["templateName"];
			moduleTypeStr = "template";
		} else if(moduleType == "ResourceBundle") {
			saveURL = "/cf/srbv";
			moduleName = jsonObject["id"];
			moduleTypeStr = "resourceBundle";
		} else if(moduleType == "Autocomplete") {
			moduleName = jsonObject["autocompleteDesc"];
			moduleTypeStr = "autocomplete";
		} else if(moduleType == "Notification") {
			formId = jsonObject["formId"];
			moduleName = jsonObject["targetPlatform"];
			moduleTypeStr = "notification";
		} else if(moduleType == "Dashboard") {
			saveURL = "/cf/sdbv";
			moduleName = jsonObject["dashboardName"];
			moduleTypeStr = "dashboard";
		} else if(moduleType == "Dashlets") {
			saveURL = "/cf/sdlv";
			moduleName = jsonObject["dashletName"];
			moduleTypeStr = "dashboard";
		} else if(moduleType == "DynamicForm") {
			moduleName = jsonObject["formName"];
			moduleTypeStr = "dynamicForm";
		} else if(moduleType == "FileManager") { 
			moduleName = jsonObject["fileUploadConfigId"];
			moduleTypeStr = "fileManager";
			isNonVersioningModule = "true";
			nonVersioningFetchURL = "/cf/fuj";
			saveURL = "/cf/sfuc";
		} else if(moduleType == "DynaRest") {
			formId = jsonObject["formId"];
			moduleName = jsonObject["jwsDynamicRestUrl"];
			moduleTypeStr = "dynarest";
		} else if(moduleType == "Permission") { 
			moduleName = jsonObject["entityName"];
			moduleTypeStr = "permission";
			isNonVersioningModule = "true";
			nonVersioningFetchURL = "/cf/puj";
			saveURL = "/cf/sjra";
		} else if(moduleType == "SiteLayout") { 
			moduleName = jsonObject["moduleName"];
			moduleTypeStr = "sitelayout";
			isNonVersioningModule = "true";
			nonVersioningFetchURL = "/cf/muj";
			saveURL = "/cf/sml";
		}
		
      	$("#entityId").val(entityId);
		$("#moduleName").val(moduleName);
		$("#moduleType").val(moduleTypeStr);
		$("#formId").val(formId);
		$("#saveUrl").val(saveURL);
		$("#isNonVersioningModule").val(isNonVersioningModule);
		$("#nonVersioningFetchURL").val(nonVersioningFetchURL);
		$("#isImport").val("true");
		localStorage.setItem("importJson", entity);
		$("#importJson").val(entity);
		$("#previousPageUrl").val("/cf/vimp");
		$("#revisionForm").submit();
    
    	// hold an array of imported list, to manage in import all
    }
    
    function importSingle(moduleType, entityId) {
		$.ajax({
	    	url : '/cf/importConfig',
	    	type : "post",
	    	data: {
	    		imporatableData : imporatableData,
	    		importId		: entityId
	    	},
	    	success : function(data) {
	    		idList.push(entityId);
	    		localStorage.setItem("importedIdList", JSON.stringify(idList));
	    		$("#lblExistingVersion"+entityId).text(data);
	    		$("#btnImport"+entityId).attr("disabled", true);
	    		$("#btnCompare"+entityId).attr("disabled", true);
	    		showMessage("Data imported.", "success");
	    	},
	    	error: function (textStatus, errorThrown) {
	    		showMessage("Error while importing data", "error");
	    	}
    	});
    }

    function importAll(moduleType, entityId) {
		$.ajax({
	    	url : '/cf/importAll',
	    	type : "post",
	    	data: {
	    		imporatableData : imporatableData,
	    		importedIdList  : idList
	    	},
	    	success : function(data) {
	    		$("#importAllBtn").attr("disabled", true);
	    		backToPreviousPage();
	    		showMessage("All data imported.", "success");
	    	},
	    	error: function (textStatus, errorThrown) {
	    		showMessage("Error while importing data", "error");
	    	}
    	});
    }

	function backToPreviousPage(){
		location.href = "/cf/pml";
	}
		