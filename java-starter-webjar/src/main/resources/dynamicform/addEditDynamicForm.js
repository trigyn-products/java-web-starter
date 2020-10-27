class AddEditDynamicForm {
    constructor() {
    	
    }
    
    loadAddEditDynamicForm() {
    	const context = this;
		
		require.config({ paths: { "vs": "../webjars/1.0/monaco/min/vs" }});
    	require(["vs/editor/editor.main"], function() {
        dashletSQLEditor = monaco.editor.create(document.getElementById("sqlEditor"), {
		        	value: $("#sqlContent").val().trim(),
		            language: "sql",
		            roundedSelection: false,
					scrollBeyondLastLine: false,
					readOnly: false,
					theme: "vs-dark",
					wordWrap: 'wordWrapColumn',
					wordWrapColumn: 100,
					wordWrapMinified: true,
					wrappingIndent: "indent"
	        	});
	        	$("#sqlContent").remove();
    	});
    	
    	require(["vs/editor/editor.main"], function() {
        dashletHTMLEditor = monaco.editor.create(document.getElementById("htmlEditor"), {
		            language: "html",
		            roundedSelection: false,
					scrollBeyondLastLine: false,
					readOnly: false,
					theme: "vs-dark",
					wordWrap: 'wordWrapColumn',
					wordWrapColumn: 250,
					wordWrapMinified: true,
					wrappingIndent: "indent"
	        	});
	        	$("#htmlContent").remove();
    	});

		let formId = $("#formId").val();
		
		if(formId != "") {
			$.ajax({
				type : "POST",
				url : "gfsq",
				data : {formId: formId},
				success : function(data) {
					for(let counter = 0; counter < data.length; ++counter) {
						context.addSaveQueryEditor(null, data[counter]);
					}
					getEntityRoles();
				}
			});
		} else {
			context.addSaveQueryEditor();
		}
			
		$("#saveSqlContent").remove(); 
    }
    
    backToDynamicFormListing(){
		window.location.href="./dfl"
	}
	
	addSaveQueryEditor(element, data){
		let formQueryId;
		let formBody;
		let formSaveQuery;
		let versionDetailsMap;
		
		if(data != undefined){
			formBody = data.formBody.trim();
			formSaveQuery = data.formSaveQuery.trim();
			versionDetailsMap = data.versionDetailsMap;
		}
    		
		require.config({ paths: { "vs": "../webjars/1.0/monaco/min/vs" }});
    	require(["vs/editor/editor.main"], function() {
    		
    		let index = dashletSQLEditors.length;
    		let parentElement;
			if(element != null) {
				parentElement = $(element).parent().parent().parent().parent();
			}
			
    		if(versionDetailsMap != undefined && $.isEmptyObject(versionDetailsMap) === false){
				let versionDiv = $("<div class='col-3'><div id='compareDiv_"+index+"' class='col-inner-form full-form-fields'><label for='versionId'>Compare with </label>");
    			if(parentElement != undefined) {
	    			versionDiv.insertAfter(parentElement);
	    		} else {
	    			$("#saveScriptContainer").append(versionDiv);	
		    	}
    			
    			$("#compareDiv_"+index).append("<select class='form-control' id="+formQueryId+" onchange='addEdit.getSelectTemplateData(this.id);' name='versionId' title='Template Versions'>");
    			$("#"+formQueryId).append("<option value='' selected>Select</option>");
    			for (let prop in versionDetailsMap) {
   			 		if (Object.prototype.hasOwnProperty.call(versionDetailsMap, prop)) {
        				$("#"+formQueryId).append("<option value="+prop+">"+versionDetailsMap[prop]+"</option>");
    				}
				}
    		}
    		
    		if(formBody != undefined){
    			dashletHTMLEditor.setValue(formBody);
    		}
    		let daoContainer = $('<div id="daoContainer_'+index+'"><div class="row"><div id="actionButtonDiv_'+index+'"class="col-12 margin-t-25 float-right"><div class="btn-icons float-right"><input type="button" id="addEditor_'+index+'" value="Add" class="margin-r-5 btn btn-primary" onclick="addEdit.addSaveQueryEditor(this);"><input type="button" id="removeTemplate_'+index+'"  value="Remove" class="btn btn-secondary" onclick="addEdit.removeSaveQueryEditor(this);"></div></div></div><div id="container_'+index+'" class="html_script" style="margin-top: 10px;"><div class="grp_lblinp"><div id="saveSqlContainer_'+index+'" class="ace-editor-container"><div id="saveSqlEditor_'+index+'" class="ace-editor"></div></div></div></div></div>');

			if(parentElement != undefined) {
	    		daoContainer.insertAfter(parentElement);
	    	} else {
	    		$("#saveScriptContainer").append(daoContainer);	
		    }
		    	
        	dashletSAVESQLEditor = monaco.editor.create(document.getElementById("saveSqlEditor_"+index), {
	        	value: formSaveQuery,
	            language: "sql",
	            roundedSelection: false,
				scrollBeyondLastLine: false,
				readOnly: false,
				theme: "vs-dark",
				wordWrap: 'wordWrapColumn',
				wordWrapColumn: 100,
				wordWrapMinified: true,
				wrappingIndent: "indent"
        	});
        	
        	let editorObj = new Object();
	        editorObj["index"] = index;
	        editorObj["editor"] = dashletSAVESQLEditor;
	        dashletSQLEditors.push(editorObj);
	        $("#removeTemplate_0").remove();
    	});
    	
	}
	
	removeSaveQueryEditor(element){
		let index = element.id.split("_")[1];
		if(index != 0) {
			$("#daoContainer_"+index).remove();
			removeByAttribute(dashletSQLEditors, "index", index);
		}
	}
    
    saveDynamicForm (){
    	let context = this;
    	let isDataSaved = false;
    	let formValid = context.validateDynamicForm();
    	if(formValid){
			$("#formSelectQuery").val(dashletSQLEditor.getValue().toString());
			$("#formBody").val(dashletHTMLEditor.getValue().toString());
			let queries = new Array();	
			for(let iCounter = 0; iCounter < dashletSQLEditors.length; ++iCounter){
				let index = $("[id^=daoContainer_]")[iCounter].id.split("_")[1];
				let editorObject = dashletSQLEditors.find(editors => editors["index"] == index);
				let queryContent = (editorObject["editor"].getValue().toString().trim());
				if(queryContent !== ""){
					queries.push(queryContent);
				}
			}
			$("#formSaveQuery").val(JSON.stringify(queries));
			
			const form = $("#dynamicform");
			let serializedForm = form.serializeArray();
			for(let iCounter =0, length = serializedForm.length;iCounter<length;iCounter++){
	  			serializedForm[iCounter].value = $.trim(serializedForm[iCounter].value);
			}
			serializedForm = $.param(serializedForm);
			
			 $.ajax({
	             async : false,
	             type : "GET",
	             cache : false,
	             url : "/cf/cdd", 
	             data : {
	                 formName : $("#formName").val(),
	             },
	             success : function(data) {
	                 if(data != ""){
	                     if(data != $("#formId").val()) {
	                    	 return false;
	                     }else{
	                    	 isDataSaved = AddEditDynamicForm.prototype.saveFormData(serializedForm);
	                     }
	                 }else{
	                	 isDataSaved = AddEditDynamicForm.prototype.saveFormData(serializedForm);
	                 }
	             }
	         });
		}
		return isDataSaved;
	}
    
    saveFormData(formData){
    	const context = this;
    	let isDataSaved = false;
	    $.ajax({
			type : "POST",
			async : false,
			url : "sdfd",
			data : formData,
			success : function(data) {
				isDataSaved = true;
				saveEntityRoleAssociation(data);
				showMessage("Information saved successfully", "success");
			},
			error : function(xhr, error){
				showMessage("Error occurred while saving", "error");
	        },
																						  
		});
		return isDataSaved;
    }
    
    validateDynamicForm = function(){
    	let formName = $("#formName").val().trim();
    	let selectQuery = $.trim(dashletSQLEditor.getValue().toString());
    	let htmlQuery = $.trim(dashletHTMLEditor.getValue().toString());
    	if(formName === ""){
    		$("#errorMessage").show();
    		$("#errorMessage").html("Please enter valid form name");
    		return false;
    	}
    	if(selectQuery === ""){
    		$("#errorMessage").show();
    		$("#errorMessage").html("Select query can not be blank");
    		return false;
    	}
    	if(htmlQuery === ""){
    		$("#errorMessage").show();
    		$("#errorMessage").html("HTML content can not be blank");
    		return false;
    	}
    	let saveUpdateQuery;
    	for(let iCounter = 0; iCounter < dashletSQLEditors.length; ++iCounter){
			if(saveUpdateQuery === undefined || saveUpdateQuery === ""){
				let index = $("[id^=daoContainer_]")[iCounter].id.split("_")[1];
				let editorObject = dashletSQLEditors.find(editors => editors["index"] == index);
				let queryContent = (editorObject["editor"].getValue().toString().trim());
				saveUpdateQuery = queryContent;
			}
		}
		if(saveUpdateQuery === ""){
			$("#errorMessage").show();
    		$("#errorMessage").html("Save/update query can not be blank");
    		return false;
		}
		
		
    	return true;
    }
    
    getSelectTemplateData = function(formQueryId) {
        const context = this;
		let versionId = $('#'+formQueryId).find(":selected").val();
        
        $('#diffEditor').html("");
        if(versionId != ""){
	       	const diffEditor = monaco.editor.createDiffEditor(document.getElementById("diffEditor"),{
				originalEditable: false,
	    		readOnly: false,
	       	});
	        $.ajax({
	            async : false,
	            type : "GET",
	            cache : false,
	            url : "/cf/vdfd", 
	            headers : {
	                "form-id" : formQueryId,
	                "version-id" : versionId,
	            },
	            success : function(data) {
					let modifiedContent = dashletHTMLEditor.getValue();
					let originalModel = monaco.editor.createModel(data, "text/plain");
					let modifiedModel = monaco.editor.createModel(modifiedContent, "text/plain");
					
					diffEditor.setModel({
						original: originalModel,
						modified: modifiedModel
					});
					
	            },
				error : function(xhr, error){
					showMessage("Error occurred while saving", "error");
	        	},
	        });
        }
    }
    
	
    
}

let saveEntityRoleAssociation = function(savedFormId){
	let roleIds =[];
	let entityRoles = new Object();
	entityRoles.entityName = $("#formName").val();
	entityRoles.moduleId=$("#moduleId").val();
	entityRoles.entityId= savedFormId;
	 $.each($("#rolesMultiselect_selectedOptions_ul span.ml-selected-item"), function(key,val){
		 roleIds.push(val.id);
     	
     });
	
	entityRoles.roleIds=roleIds;
	
	$.ajax({
        async : false,
        type : "POST",
        contentType : "application/json",
        url : "/cf/ser", 
        data : JSON.stringify(entityRoles),
        success : function(data) {
	    }
    });
}
let getEntityRoles = function(){
	$.ajax({
        async : false,
        type : "GET",
        url : "/cf/ler", 
        data : {
        	entityId:formId,
        	moduleId:$("#moduleId").val(),
        },
        success : function(data) {
            $.each(data, function(key,val){
            	multiselect.setSelectedObject(val);
            	
            });
	    }
    });
}


let removeByAttribute = function(arrayObject, attr, value){
    let iCounter = arrayObject.length;
        while(iCounter--){
        if( arrayObject[iCounter] 
            && arrayObject[iCounter].hasOwnProperty(attr) 
            && (arguments.length > 2 && arrayObject[iCounter][attr] == value ) ){ 
            arrayObject.splice(iCounter,1);
        }
    }
    return arrayObject;
}

    
