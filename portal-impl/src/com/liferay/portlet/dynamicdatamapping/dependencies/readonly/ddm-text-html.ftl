<#include "../init.ftl">

<#if fieldValue?? && fieldValue != "">
	<div class="aui-field-wrapper-content lfr-forms-field-wrapper">
		<@aui.input name=namespacedFieldName type="hidden" value=fieldValue />

		<label class="aui-field-label">
			<@liferay_ui.message key=escape(label) />
		</label>

		${fieldValue}

		${fieldStructure.children}
	</div>
</#if>