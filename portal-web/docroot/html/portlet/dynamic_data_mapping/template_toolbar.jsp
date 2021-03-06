<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/dynamic_data_mapping/init.jsp" %>

<%
String toolbarItem = ParamUtil.getString(request, "toolbarItem", "view-all");

String redirect = ParamUtil.getString(request, "redirect");

long groupId = ParamUtil.getLong(request, "groupId", scopeGroupId);
long classNameId = ParamUtil.getLong(request, "classNameId");
long classPK = ParamUtil.getLong(request, "classPK");
%>

<div class="lfr-portlet-toolbar">
	<span class="lfr-toolbar-button view-button <%= toolbarItem.equals("view-all") ? "current" : StringPool.BLANK %>">
		<a href="<%= PortalUtil.escapeRedirect(redirect) %>"><liferay-ui:message key="view-all" /></a>
	</span>

	<%
	String message = "add";
	%>

	<c:choose>
		<c:when test="<%= classNameId == PortalUtil.getClassNameId(DDMStructure.class) %>">
			<c:if test="<%= DDMPermission.contains(permissionChecker, scopeGroupId, ddmResource, ActionKeys.ADD_TEMPLATE) && (Validator.isNull(templateTypeValue) || templateTypeValue.equals(DDMTemplateConstants.TEMPLATE_TYPE_FORM)) %>">
				<portlet:renderURL var="addTemplateURL">
					<portlet:param name="struts_action" value="/dynamic_data_mapping/edit_template" />
					<portlet:param name="redirect" value="<%= redirect %>" />
					<portlet:param name="groupId" value="<%= String.valueOf(groupId) %>" />
					<portlet:param name="classNameId" value="<%= String.valueOf(classNameId) %>" />
					<portlet:param name="classPK" value="<%= String.valueOf(classPK) %>" />
					<portlet:param name="structureAvailableFields" value='<%= renderResponse.getNamespace() + "getAvailableFields" %>' />
				</portlet:renderURL>

				<%
				if (Validator.isNull(templateTypeValue)) {
					message = "add-form-template";
				}
				%>

				<span class="lfr-toolbar-button add-template <%= toolbarItem.equals("add-form-template") ? "current" : StringPool.BLANK %>">
					<a href="<%= addTemplateURL %>"><liferay-ui:message key="<%= message %>" /></a>
				</span>
			</c:if>

			<c:if test="<%= DDMPermission.contains(permissionChecker, scopeGroupId, ddmResource, ActionKeys.ADD_TEMPLATE) && (Validator.isNull(templateTypeValue) || templateTypeValue.equals(DDMTemplateConstants.TEMPLATE_TYPE_DISPLAY)) %>">
				<portlet:renderURL var="addTemplateURL">
					<portlet:param name="struts_action" value="/dynamic_data_mapping/edit_template" />
					<portlet:param name="redirect" value="<%= redirect %>" />
					<portlet:param name="groupId" value="<%= String.valueOf(groupId) %>" />
					<portlet:param name="classNameId" value="<%= String.valueOf(classNameId) %>" />
					<portlet:param name="classPK" value="<%= String.valueOf(classPK) %>" />
					<portlet:param name="type" value="<%= DDMTemplateConstants.TEMPLATE_TYPE_DISPLAY %>" />
				</portlet:renderURL>

				<%
				if (Validator.isNull(templateTypeValue)) {
					message = "add-display-template";
				}
				%>

				<span class="lfr-toolbar-button add-template <%= toolbarItem.equals("add-display-template") ? "current" : StringPool.BLANK %>">
					<a href="<%= addTemplateURL %>"><liferay-ui:message key="<%= message %>" /></a>
				</span>
			</c:if>
		</c:when>
		<c:otherwise>

			<%
			List<TemplateHandler> templateHandlers = new ArrayList<TemplateHandler>();

			if (classNameId > 0) {
				templateHandlers.add(TemplateHandlerRegistryUtil.getTemplateHandler(classNameId));
			}
			else {
				templateHandlers.addAll(getPortletDisplayTemplateHandlers(permissionChecker, scopeGroupId));
			}

			if (!templateHandlers.isEmpty()) {
			%>

				<liferay-ui:icon-menu align="left" cssClass='<%= "lfr-toolbar-button add-button " + (toolbarItem.equals("add") ? "current" : StringPool.BLANK) %>' direction="down" extended="<%= false %>" icon='<%= themeDisplay.getPathThemeImages() + "/common/add.png" %>' message="add" showWhenSingleIcon="<%= true %>">

					<liferay-portlet:renderURL varImpl="addPortletDisplayTemplateURL">
						<portlet:param name="struts_action" value="/dynamic_data_mapping/edit_template" />
						<portlet:param name="redirect" value="<%= redirect %>" />
						<portlet:param name="backURL" value="<%= redirect %>" />
						<portlet:param name="groupId" value="<%= String.valueOf(scopeGroupId) %>" />
						<portlet:param name="type" value="<%= DDMTemplateConstants.TEMPLATE_TYPE_DISPLAY %>" />
						<portlet:param name="ddmResourceActionId" value="<%= ActionKeys.ADD_PORTLET_DISPLAY_TEMPLATE %>" />
					</liferay-portlet:renderURL>

					<%
					for (TemplateHandler templateHandler : templateHandlers) {
						addPortletDisplayTemplateURL.setParameter("classNameId", String.valueOf(PortalUtil.getClassNameId(templateHandler.getClassName())));
						addPortletDisplayTemplateURL.setParameter("classPK", String.valueOf(0));
						addPortletDisplayTemplateURL.setParameter("ddmResource", templateHandler.getResourceName());
					%>

						<liferay-ui:icon
							image="add_portlet_display_template"
							message="<%= templateHandler.getName(locale) %>"
							method="get"
							url="<%= addPortletDisplayTemplateURL.toString() %>"
						/>

					<%
					}
					%>

				</liferay-ui:icon-menu>

				<%
				}
				%>

		</c:otherwise>
	</c:choose>
</div>

<%!
public List<TemplateHandler> getPortletDisplayTemplateHandlers(PermissionChecker permissionChecker, long scopeGroupId) {
	List<TemplateHandler> templateHandlers = TemplateHandlerRegistryUtil.getTemplateHandlers();

	List<TemplateHandler> allowedPortletDisplayTemplateHandlers = new ArrayList<TemplateHandler>();

	for (TemplateHandler templateHandler : templateHandlers) {
		if ((templateHandler instanceof BasePortletDisplayTemplateHandler) && DDMPermission.contains(permissionChecker, scopeGroupId, templateHandler.getResourceName(), ActionKeys.ADD_PORTLET_DISPLAY_TEMPLATE)) {
			allowedPortletDisplayTemplateHandlers.add(templateHandler);
		}
	}

	return allowedPortletDisplayTemplateHandlers;
}
%>