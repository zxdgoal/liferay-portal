/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
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

import aQute.bnd.annotation.ProviderType;

import com.liferay.portal.kernel.bean.AutoEscape;
import com.liferay.portal.service.ServiceContext;

import com.liferay.portlet.expando.model.ExpandoBridge;

import java.io.Serializable;

import java.util.Date;
import java.util.Map;

/**
 * The base model interface for the BackgroundTask service. Represents a row in the &quot;BackgroundTask&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This interface and its corresponding implementation {@link com.liferay.portal.model.impl.BackgroundTaskModelImpl} exist only as a container for the default property accessors generated by ServiceBuilder. Helper methods and all application logic should be put in {@link com.liferay.portal.model.impl.BackgroundTaskImpl}.
 * </p>
 *
 * @author Brian Wing Shun Chan
 * @see BackgroundTask
 * @see com.liferay.portal.model.impl.BackgroundTaskImpl
 * @see com.liferay.portal.model.impl.BackgroundTaskModelImpl
 * @generated
 */
@ProviderType
public interface BackgroundTaskModel extends BaseModel<BackgroundTask>,
	GroupedModel, MVCCModel {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. All methods that expect a background task model instance should use the {@link BackgroundTask} interface instead.
	 */

	/**
	 * Returns the primary key of this background task.
	 *
	 * @return the primary key of this background task
	 */
	public long getPrimaryKey();

	/**
	 * Sets the primary key of this background task.
	 *
	 * @param primaryKey the primary key of this background task
	 */
	public void setPrimaryKey(long primaryKey);

	/**
	 * Returns the mvcc version of this background task.
	 *
	 * @return the mvcc version of this background task
	 */
	@Override
	public long getMvccVersion();

	/**
	 * Sets the mvcc version of this background task.
	 *
	 * @param mvccVersion the mvcc version of this background task
	 */
	@Override
	public void setMvccVersion(long mvccVersion);

	/**
	 * Returns the background task ID of this background task.
	 *
	 * @return the background task ID of this background task
	 */
	public long getBackgroundTaskId();

	/**
	 * Sets the background task ID of this background task.
	 *
	 * @param backgroundTaskId the background task ID of this background task
	 */
	public void setBackgroundTaskId(long backgroundTaskId);

	/**
	 * Returns the group ID of this background task.
	 *
	 * @return the group ID of this background task
	 */
	@Override
	public long getGroupId();

	/**
	 * Sets the group ID of this background task.
	 *
	 * @param groupId the group ID of this background task
	 */
	@Override
	public void setGroupId(long groupId);

	/**
	 * Returns the company ID of this background task.
	 *
	 * @return the company ID of this background task
	 */
	@Override
	public long getCompanyId();

	/**
	 * Sets the company ID of this background task.
	 *
	 * @param companyId the company ID of this background task
	 */
	@Override
	public void setCompanyId(long companyId);

	/**
	 * Returns the user ID of this background task.
	 *
	 * @return the user ID of this background task
	 */
	@Override
	public long getUserId();

	/**
	 * Sets the user ID of this background task.
	 *
	 * @param userId the user ID of this background task
	 */
	@Override
	public void setUserId(long userId);

	/**
	 * Returns the user uuid of this background task.
	 *
	 * @return the user uuid of this background task
	 */
	@Override
	public String getUserUuid();

	/**
	 * Sets the user uuid of this background task.
	 *
	 * @param userUuid the user uuid of this background task
	 */
	@Override
	public void setUserUuid(String userUuid);

	/**
	 * Returns the user name of this background task.
	 *
	 * @return the user name of this background task
	 */
	@AutoEscape
	@Override
	public String getUserName();

	/**
	 * Sets the user name of this background task.
	 *
	 * @param userName the user name of this background task
	 */
	@Override
	public void setUserName(String userName);

	/**
	 * Returns the create date of this background task.
	 *
	 * @return the create date of this background task
	 */
	@Override
	public Date getCreateDate();

	/**
	 * Sets the create date of this background task.
	 *
	 * @param createDate the create date of this background task
	 */
	@Override
	public void setCreateDate(Date createDate);

	/**
	 * Returns the modified date of this background task.
	 *
	 * @return the modified date of this background task
	 */
	@Override
	public Date getModifiedDate();

	/**
	 * Sets the modified date of this background task.
	 *
	 * @param modifiedDate the modified date of this background task
	 */
	@Override
	public void setModifiedDate(Date modifiedDate);

	/**
	 * Returns the name of this background task.
	 *
	 * @return the name of this background task
	 */
	@AutoEscape
	public String getName();

	/**
	 * Sets the name of this background task.
	 *
	 * @param name the name of this background task
	 */
	public void setName(String name);

	/**
	 * Returns the servlet context names of this background task.
	 *
	 * @return the servlet context names of this background task
	 */
	@AutoEscape
	public String getServletContextNames();

	/**
	 * Sets the servlet context names of this background task.
	 *
	 * @param servletContextNames the servlet context names of this background task
	 */
	public void setServletContextNames(String servletContextNames);

	/**
	 * Returns the task executor class name of this background task.
	 *
	 * @return the task executor class name of this background task
	 */
	@AutoEscape
	public String getTaskExecutorClassName();

	/**
	 * Sets the task executor class name of this background task.
	 *
	 * @param taskExecutorClassName the task executor class name of this background task
	 */
	public void setTaskExecutorClassName(String taskExecutorClassName);

	/**
	 * Returns the task context map of this background task.
	 *
	 * @return the task context map of this background task
	 */
	public Map<String, Serializable> getTaskContextMap();

	/**
	 * Sets the task context map of this background task.
	 *
	 * @param taskContextMap the task context map of this background task
	 */
	public void setTaskContextMap(Map<String, Serializable> taskContextMap);

	/**
	 * Returns the completed of this background task.
	 *
	 * @return the completed of this background task
	 */
	public boolean getCompleted();

	/**
	 * Returns <code>true</code> if this background task is completed.
	 *
	 * @return <code>true</code> if this background task is completed; <code>false</code> otherwise
	 */
	public boolean isCompleted();

	/**
	 * Sets whether this background task is completed.
	 *
	 * @param completed the completed of this background task
	 */
	public void setCompleted(boolean completed);

	/**
	 * Returns the completion date of this background task.
	 *
	 * @return the completion date of this background task
	 */
	public Date getCompletionDate();

	/**
	 * Sets the completion date of this background task.
	 *
	 * @param completionDate the completion date of this background task
	 */
	public void setCompletionDate(Date completionDate);

	/**
	 * Returns the status of this background task.
	 *
	 * @return the status of this background task
	 */
	public int getStatus();

	/**
	 * Sets the status of this background task.
	 *
	 * @param status the status of this background task
	 */
	public void setStatus(int status);

	/**
	 * Returns the status message of this background task.
	 *
	 * @return the status message of this background task
	 */
	@AutoEscape
	public String getStatusMessage();

	/**
	 * Sets the status message of this background task.
	 *
	 * @param statusMessage the status message of this background task
	 */
	public void setStatusMessage(String statusMessage);

	@Override
	public boolean isNew();

	@Override
	public void setNew(boolean n);

	@Override
	public boolean isCachedModel();

	@Override
	public void setCachedModel(boolean cachedModel);

	@Override
	public boolean isEscapedModel();

	@Override
	public Serializable getPrimaryKeyObj();

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj);

	@Override
	public ExpandoBridge getExpandoBridge();

	@Override
	public void setExpandoBridgeAttributes(BaseModel<?> baseModel);

	@Override
	public void setExpandoBridgeAttributes(ExpandoBridge expandoBridge);

	@Override
	public void setExpandoBridgeAttributes(ServiceContext serviceContext);

	@Override
	public Object clone();

	@Override
	public int compareTo(BackgroundTask backgroundTask);

	@Override
	public int hashCode();

	@Override
	public CacheModel<BackgroundTask> toCacheModel();

	@Override
	public BackgroundTask toEscapedModel();

	@Override
	public BackgroundTask toUnescapedModel();

	@Override
	public String toString();

	@Override
	public String toXmlString();
}