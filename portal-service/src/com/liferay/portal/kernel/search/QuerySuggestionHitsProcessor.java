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

package com.liferay.portal.kernel.search;

/**
 * @author Michael C. Han
 */
public class QuerySuggestionHitsProcessor implements HitsProcessor {

	public boolean process(SearchContext searchContext, Hits hits)
		throws SearchException {

		QueryConfig queryConfig = searchContext.getQueryConfig();

		if (!queryConfig.isQuerySuggestionEnabled()) {
			return true;
		}

		String[] querySuggestions = SearchEngineUtil.suggestKeywordQueries(
			searchContext, _maxSuggestions);

		hits.setQuerySuggestions(querySuggestions);

		return true;
	}

	public void setMaxSuggestions(int maxSuggestions) {
		_maxSuggestions = maxSuggestions;
	}

	private int _maxSuggestions = 5;

}