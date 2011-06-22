/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
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

package com.liferay.portal.model;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portlet.PortalPreferences;

import java.util.List;

/**
 * @author Brian Wing Shun Chan
 */
public interface LayoutTypePortlet extends LayoutType {

	public void addModeAboutPortletId(String portletId);

	public void addModeConfigPortletId(String portletId);

	public void addModeEditDefaultsPortletId(String portletId);

	public void addModeEditGuestPortletId(String portletId);

	public void addModeEditPortletId(String portletId);

	public void addModeHelpPortletId(String portletId);

	public void addModePreviewPortletId(String portletId);

	public void addModePrintPortletId(String portletId);

	public String addPortletId(long userId, String portletId)
		throws PortalException, SystemException;

	public String addPortletId(
			long userId, String portletId, boolean checkPermission)
		throws PortalException, SystemException;

	public String addPortletId(
			long userId, String portletId, String columnId, int columnPos)
		throws PortalException, SystemException;

	public String addPortletId(
			long userId, String portletId, String columnId, int columnPos,
			boolean checkPermission)
		throws PortalException, SystemException;

	public void addPortletIds(
			long userId, String[] portletIds, boolean checkPermission)
		throws PortalException, SystemException;

	public void addPortletIds(
			long userId, String[] portletIds, String columnId,
			boolean checkPermission)
		throws PortalException, SystemException;

	public void addStateMaxPortletId(String portletId);

	public void addStateMinPortletId(String portletId);

	public List<Portlet> addStaticPortlets(
			List<Portlet> portlets, List<Portlet> startPortlets,
			List<Portlet> endPortlets)
		throws SystemException;

	public List<Portlet> getAllPortlets()
		throws PortalException, SystemException;

	public List<Portlet> getAllPortlets(String columnId)
		throws PortalException, SystemException;

	public LayoutTemplate getLayoutTemplate();

	public String getLayoutTemplateId();

	public String getModeAbout();

	public String getModeConfig();

	public String getModeEdit();

	public String getModeEditDefaults();

	public String getModeEditGuest();

	public String getModeHelp();

	public String getModePreview();

	public String getModePrint();

	public int getNumOfColumns();

	public PortalPreferences getPortalPreferences();

	public List<String> getPortletIds();

	public List<Portlet> getPortlets() throws SystemException;

	public String getStateMax();

	public String getStateMaxPortletId();

	public String getStateMin();

	public boolean hasDefaultScopePortletId(long groupId, String portletId)
		throws PortalException, SystemException;

	public boolean hasModeAboutPortletId(String portletId);

	public boolean hasModeConfigPortletId(String portletId);

	public boolean hasModeEditDefaultsPortletId(String portletId);

	public boolean hasModeEditGuestPortletId(String portletId);

	public boolean hasModeEditPortletId(String portletId);

	public boolean hasModeHelpPortletId(String portletId);

	public boolean hasModePreviewPortletId(String portletId);

	public boolean hasModePrintPortletId(String portletId);

	public boolean hasModeViewPortletId(String portletId);

	public boolean hasPortletId(String portletId)
		throws PortalException, SystemException;

	public boolean hasStateMax();

	public boolean hasStateMaxPortletId(String portletId);

	public boolean hasStateMin();

	public boolean hasStateMinPortletId(String portletId);

	public boolean hasStateNormalPortletId(String portletId);

	public boolean hasTemplate();

	public boolean hasUpdatePermission();

	public boolean isColumnDisabled(String columnId);

	public boolean isDefaultUpdated();

	public boolean isCustomizable();

	public boolean isCustomizable(String columnId);

	public boolean isCustomizedView();

	public boolean isTemplateCustomizable(String columnId);

	public void movePortletId(
			long userId, String portletId, String columnId, int columnPos)
		throws PortalException, SystemException;

	public void removeModeAboutPortletId(String portletId);

	public void removeModeConfigPortletId(String portletId);

	public void removeModeEditDefaultsPortletId(String portletId);

	public void removeModeEditGuestPortletId(String portletId);

	public void removeModeEditPortletId(String portletId);

	public void removeModeHelpPortletId(String portletId);

	public void removeModePreviewPortletId(String portletId);

	public void removeModePrintPortletId(String portletId);

	public void removeModesPortletId(String portletId);

	public void removeNestedColumns(String portletId);

	public void removePortletId(long userId, String portletId);

	public void removePortletId(
		long userId, String portletId, boolean modeAndState);

	public void removeStateMaxPortletId(String portletId);

	public void removeStateMinPortletId(String portletId);

	public void removeStatesPortletId(String portletId);

	public void reorganizePortlets(
		List<String> newColumns, List<String> oldColumns);

	public void resetModes();

	public void resetStates();

	public void resetUserPreferences();

	public void setLayoutTemplateId(long userId, String newLayoutTemplateId);

	public void setLayoutTemplateId(
		long userId, String newLayoutTemplateId, boolean checkPermission);

	public void setModeAbout(String modeAbout);

	public void setModeConfig(String modeConfig);

	public void setModeEdit(String modeEdit);

	public void setModeEditDefaults(String modeEditDefaults);

	public void setModeEditGuest(String modeEditGuest);

	public void setModeHelp(String modeHelp);

	public void setModePreview(String modePreview);

	public void setModePrint(String modePrint);

	public void setCustomizedView(boolean customizedView);

	public void setPortalPreferences(PortalPreferences portalPreferences);

	public void setPortletIds(String columnId, String portletIds);

	public void setStateMax(String stateMax);

	public void setStateMin(String stateMin);

	public void setUpdatePermission(boolean updatePermission);

}
