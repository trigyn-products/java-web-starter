<#macro templateWithoutParams templateName>${dynamicTemplate.includeTemplate(templateName)}</#macro>
<#macro templateWithParams templateName templateParams>${dynamicTemplate.includeTemplate(templateName, templateParams)}</#macro>
<#macro resourceBundle resourceKey>${messageSource.getMessage(resourceKey)}</#macro>
<#macro resourceBundleWithDefault resourceKey defaultValue>
	${messageSource.getMessageWithDefault(resourceKey, defaultValue)}
</#macro>
