<%
/**
 * Copyright (c) 2000-2007 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%
String userMappings = ParamUtil.getString(request, "userMappings", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_USER_MAPPINGS));

String[] userMappingArray = userMappings.split("\n");

String userMappingScreenName = StringPool.BLANK;
String userMappingPassword = StringPool.BLANK;
String userMappingEmailAddress = StringPool.BLANK;
String userMappingFullName = StringPool.BLANK;
String userMappingFirstName = StringPool.BLANK;
String userMappingLastName = StringPool.BLANK;
String userMappingJobTitle = StringPool.BLANK;
String userMappingGroup = StringPool.BLANK;

for (int i = 0 ; i < userMappingArray.length ; i++) {
	if (userMappingArray[i].indexOf("=") == -1) {
		continue;
	}

	String mapping[] = userMappingArray[i].split("=");

	if (mapping.length != 2) {
		continue;
	}

	if (mapping[0].equals("screenName")) {
		userMappingScreenName = mapping[1];
	}
	else if (mapping[0].equals("password")) {
		userMappingPassword = mapping[1];
	}
	else if (mapping[0].equals("emailAddress")) {
		userMappingEmailAddress = mapping[1];
	}
	else if (mapping[0].equals("fullName")) {
		userMappingFullName = mapping[1];
	}
	else if (mapping[0].equals("firstName")) {
		userMappingFirstName = mapping[1];
	}
	else if (mapping[0].equals("lastName")) {
		userMappingLastName = mapping[1];
	}
	else if (mapping[0].equals("jobTitle")) {
		userMappingJobTitle = mapping[1];
	}
	else if (mapping[0].equals("group")) {
		userMappingGroup = mapping[1];
	}

	mapping[1] = "";
}

String groupMappings = ParamUtil.getString(request, "groupMappings", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_GROUP_MAPPINGS));

String[] groupMappingArray = groupMappings.split("\n");

String groupMappingGroupName = StringPool.BLANK;
String groupMappingDescription = StringPool.BLANK;
String groupMappingUser = StringPool.BLANK;

for (int i = 0 ; i < groupMappingArray.length ; i++) {
	if (userMappingArray[i].indexOf("=") == -1) {
		continue;
	}

	String mapping[] = groupMappingArray[i].split("=");

	if (mapping.length != 2) {
		continue;
	}

	if (mapping[0].equals("groupName")) {
		groupMappingGroupName = mapping[1];
	}
	else if (mapping[0].equals("description")) {
		groupMappingDescription = mapping[1];
	}
	else if (mapping[0].equals("user")) {
		groupMappingUser = mapping[1];
	}
}
%>

<script type="text/javascript">
	<portlet:namespace/>testSettings = function(type) {
		var popup = Liferay.Popup(
			{
				modal: true,
				width: 600
			}
		);

		var url = "";

  		if (type == "ldapConnection") {
  			url = "<portlet:renderURL windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"><portlet:param name="struts_action" value="/enterprise_admin/test_ldap_connection" /></portlet:renderURL>";
		}
		else if (type == "ldapGroups") {
  			url = "<portlet:renderURL windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"><portlet:param name="struts_action" value="/enterprise_admin/test_ldap_groups" /></portlet:renderURL>";
		}
		else if (type == "ldapUsers") {
  			url = "<portlet:renderURL windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"><portlet:param name="struts_action" value="/enterprise_admin/test_ldap_users" /></portlet:renderURL>";
		}

		AjaxUtil.update(url, popup);
	}

	function <portlet:namespace />updateDefaultLdap() {
		var baseProviderURL = "";
		var baseDN = "";
		var principal = "";
		var credentials = "";
		var searchFilter = "";
		var importUserSearchFilter = "";
		var userMappingScreenName = "";
		var userMappingPassword = "";
		var userMappingEmailAddress = "";
		var userMappingFullName = "";
		var userMappingFirstName = "";
		var userMappingLastName = "";
		var userMappingJobTitle = "";
		var userMappingGroup = "";
		var importGroupSearchFilter = "";
		var groupMappingGroupName = "";
		var groupMappingDescription = "";
		var groupMappingUser = "";

		var ldapType = Liferay.Util.getSelectedRadioValue(document.<portlet:namespace />fm.<portlet:namespace />defaultLdap);

		if (ldapType == "apache") {
			baseProviderURL = "ldap://localhost:10389";
			baseDN = "dc=example,dc=com";
			principal = "uid=admin,ou=system";
			credentials = "secret";
			searchFilter = "(mail=@email_address@)";
			importUserSearchFilter = "(objectClass=person)";
			userMappingScreenName = "cn";
			userMappingPassword = "userPassword";
			userMappingEmailAddress = "mail";
			userMappingFullName = "";
			userMappingFirstName = "givenName";
			userMappingLastName = "sn";
			userMappingJobTitle = "";
			userMappingGroup = "";
			importGroupSearchFilter = "";
			groupMappingGroupName = "";
			groupMappingDescription = "";
			groupMappingUser = "";
		}
		else if (ldapType == "fedora") {
			baseProviderURL = "ldap://localhost:19389";
			baseDN = "dc=localdomain";
			principal = "cn=Directory Manager";
			credentials = "";
			searchFilter = "(mail=@email_address@)";
			importUserSearchFilter = "(objectClass=inetOrgPerson)";
			userMappingScreenName = "uid";
			userMappingPassword = "userPassword";
			userMappingEmailAddress = "mail";
			userMappingFullName = "cn";
			userMappingFirstName = "givenName";
			userMappingLastName = "sn";
			userMappingJobTitle = "title";
			userMappingGroup = "";
			importGroupSearchFilter = "";
			groupMappingGroupName = "";
			groupMappingDescription = "";
			groupMappingUser = "";
		}
		else if (ldapType == "microsoft") {
			baseProviderURL = "ldap://localhost:389";
			baseDN = "dc=example,dc=com";
			principal = "admin";
			credentials = "secret";
			searchFilter = "(&(objectCategory=person)(sAMAccountName=@user_id@))";
			importUserSearchFilter = "(objectClass=person)";
			userMappingScreenName = "sAMAccountName";
			userMappingPassword = "userPassword";
			userMappingEmailAddress = "userprincipalname";
			userMappingFullName = "cn";
			userMappingFirstName = "givenName";
			userMappingLastName = "sn";
			userMappingJobTitle = "";
			userMappingGroup = "memberOf";
			importGroupSearchFilter = "(objectClass=group)";
			groupMappingGroupName = "cn";
			groupMappingDescription = "sAMAccountName";
			groupMappingUser = "member";
		}
		else if (ldapType == "novell") {
			url = "ldap://localhost:389";
			baseDN = "";
			principal = "cn=admin,ou=test";
			credentials = "secret";
			searchFilter = "(mail=@email_address@)";
			importUserSearchFilter = "";
			userMappingScreenName = "cn";
			userMappingPassword = "userPassword";
			userMappingEmailAddress = "mail";
			userMappingFullName = "";
			userMappingFirstName = "givenName";
			userMappingLastName = "sn";
			userMappingJobTitle = "title";
			userMappingGroup = "";
			importGroupSearchFilter = "";
			groupMappingGroupName = "";
			groupMappingDescription = "";
			groupMappingUser = "";
		}
		else if (ldapType == "open") {
			url = "ldap://localhost:389";
			baseDN = "dc=example,dc=com";
			principal = "cn=admin,ou=test";
			credentials = "secret";
			searchFilter = "(mail=@email_address@)";
			importUserSearchFilter = "(objectClass=inetOrgPerson)";
			userMappingScreenName = "cn";
			userMappingPassword = "userPassword";
			userMappingEmailAddress = "mail";
			userMappingFullName = "";
			userMappingFirstName = "givenName";
			userMappingLastName = "sn";
			userMappingJobTitle = "title";
			userMappingGroup = "";
			importGroupSearchFilter = "(objectClass=groupOfUniqueNames)";
			groupMappingGroupName = "cn";
			groupMappingDescription = "description";
			groupMappingUser = "uniqueMember";
		}

		document.<portlet:namespace />fm.<portlet:namespace />baseProviderURL.value = baseProviderURL;
		document.<portlet:namespace />fm.<portlet:namespace />baseDN.value = baseDN;
		document.<portlet:namespace />fm.<portlet:namespace />principal.value = principal;
		document.<portlet:namespace />fm.<portlet:namespace />credentials.value = credentials;
		document.<portlet:namespace />fm.<portlet:namespace />searchFilter.value = searchFilter;
		document.<portlet:namespace />fm.<portlet:namespace />importUserSearchFilter.value = importUserSearchFilter;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingScreenName.value = userMappingScreenName;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingPassword.value = userMappingPassword;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingEmailAddress.value = userMappingEmailAddress;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingFullName.value = userMappingFullName;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingFirstName.value = userMappingFirstName;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingLastName.value = userMappingLastName;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingJobTitle.value = userMappingJobTitle;
		document.<portlet:namespace />fm.<portlet:namespace />userMappingGroup.value = userMappingGroup;
		document.<portlet:namespace />fm.<portlet:namespace />importGroupSearchFilter.value = importGroupSearchFilter;
		document.<portlet:namespace />fm.<portlet:namespace />groupMappingGroupName.value = groupMappingGroupName;
		document.<portlet:namespace />fm.<portlet:namespace />groupMappingDescription.value = groupMappingDescription;
		document.<portlet:namespace />fm.<portlet:namespace />groupMappingUser.value = groupMappingUser;
		document.<portlet:namespace />fm.<portlet:namespace />usersDN.value = baseDN;
		document.<portlet:namespace />fm.<portlet:namespace />groupsDN.value = baseDN;
	}

	jQuery(
		function() {
			Liferay.Util.toggleBoxes('<portlet:namespace />importEnabledCheckbox', '<portlet:namespace />importEnabledSettings');
			Liferay.Util.toggleBoxes('<portlet:namespace />exportEnabledCheckbox', '<portlet:namespace />exportEnabledSettings');
		}
	);
</script>

<liferay-ui:error key="ldapAuthentication" message="failed-to-bind-to-the-ldap-server-with-given-values" />

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="enabled" />
	</td>
	<td>
		<liferay-ui:input-checkbox param="enabled" defaultValue='<%= ParamUtil.getBoolean(request, "enabled", PortalLDAPUtil.isAuthEnabled(company.getCompanyId())) %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="required" />
	</td>
	<td>
		<liferay-ui:input-checkbox param="required" defaultValue='<%= ParamUtil.getBoolean(request, "required", PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsUtil.LDAP_AUTH_REQUIRED)) %>' />
	</td>
</tr>
</table>

<br />

<liferay-ui:tabs names="default-values" />

<table class="liferay-table">
<tr>
	<td>
		<input name="<portlet:namespace />defaultLdap" type="radio" value="apache"> Apache Directory Server
	</td>
	<td>
		<input name="<portlet:namespace />defaultLdap" type="radio" value="fedora"> Fedora Directory Server
	</td>
	<td>
		<input name="<portlet:namespace />defaultLdap" type="radio" value="microsoft"> Microsoft Active Directory Server
	</td>
	<td>
		<input name="<portlet:namespace />defaultLdap" type="radio" value="novell"> Novell eDirectory
	</td>
	<td>
		<input name="<portlet:namespace />defaultLdap" type="radio" value="open"> OpenLDAP
	</td>
	<td>
		<input name="<portlet:namespace />defaultLdap" type="radio" value="other"> <liferay-ui:message key="other-directory-server" />
	</td>
</tr>
</table>

<br />

<input type="button" value="<liferay-ui:message key="reset-values" />" onClick="<portlet:namespace />updateDefaultLdap();" />

<br /><br />

<liferay-ui:tabs names="connection" />

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="base-provider-url" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />baseProviderURL" type="text" value='<%= ParamUtil.getString(request, "baseProviderURL", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_BASE_PROVIDER_URL)) %>' />

		<liferay-ui:icon-help message="the-ldap-url-format-is" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="base-dn" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />baseDN" type="text" value='<%= ParamUtil.getString(request, "baseDN", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_BASE_DN)) %>' />

		<liferay-ui:icon-help message="the-ldap-url-format-is" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="principal" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />principal" type="text" value='<%= ParamUtil.getString(request, "principal", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_SECURITY_PRINCIPAL)) %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="credentials" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />credentials" type="password" value='<%= ParamUtil.getString(request, "credentials", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_SECURITY_CREDENTIALS)) %>' />
	</td>
</tr>
</table>

<br />

<input type="button" value="<liferay-ui:message key="test-ldap-connection" />" onClick="<portlet:namespace/>testSettings('ldapConnection');" />

<br /><br />

<liferay-ui:tabs names="users" />

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="authentication-search-filter" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />searchFilter" type="text" value='<%= ParamUtil.getString(request, "searchFilter", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_AUTH_SEARCH_FILTER)) %>' />

		<liferay-ui:icon-help message="enter-the-search-filter-that-will-be-used-to-test-the-validity-of-a-user" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="import-search-filter" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />importUserSearchFilter" type="text" value='<%= ParamUtil.getString(request, "importUserSearchFilter", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_IMPORT_USER_SEARCH_FILTER)) %>' />
	</td>
</tr>
<tr>
	<td colspan="2">
		<br />

		<b><liferay-ui:message key="user-mapping" /></b>
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="screen-name" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingScreenName" type="text" value='<%= userMappingScreenName %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="password" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingPassword" type="text" value='<%= userMappingPassword %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="email-address" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingEmailAddress" type="text" value='<%= userMappingEmailAddress %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="full-name" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingFullName" type="text" value='<%= userMappingFullName %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="first-name" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingFirstName" type="text" value='<%= userMappingFirstName %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="last-name" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingLastName" type="text" value='<%= userMappingLastName %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="job-title" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingJobTitle" type="text" value='<%= userMappingJobTitle %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="group" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />userMappingGroup" type="text" value='<%= userMappingGroup %>' />
	</td>
</tr>
</table>

<br />

<input type="button" value="<liferay-ui:message key="test-ldap-users" />" onClick="<portlet:namespace />testSettings('ldapUsers');" />

<br /><br />

<liferay-ui:tabs names="groups" />

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="import-search-filter" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />importGroupSearchFilter" type="text" value='<%= ParamUtil.getString(request, "importGroupSearchFilter", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_IMPORT_GROUP_SEARCH_FILTER)) %>' />
	</td>
</tr>
<tr>
	<td colspan="2">
		<br />

		<b><liferay-ui:message key="group-mapping" /></b>
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="group-name" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />groupMappingGroupName" type="text" value='<%= groupMappingGroupName %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="description" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />groupMappingDescription" type="text" value='<%= groupMappingDescription %>' />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="user" />
	</td>
	<td>
		<input class="liferay-input-text" name="<portlet:namespace />groupMappingUser" type="text" value='<%= groupMappingUser %>' />
	</td>
</tr>
</table>

<br />

<input type="button" value="<liferay-ui:message key="test-ldap-groups" />" onClick="<portlet:namespace />testSettings('ldapGroups');" />

<br /><br />

<liferay-ui:tabs names="import-export" />

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="import-enabled" />
	</td>
	<td>
		<liferay-ui:input-checkbox param="importEnabled" defaultValue='<%= ParamUtil.getBoolean(request, "importEnabled", PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsUtil.LDAP_IMPORT_ENABLED)) %>' />
	</td>
</tr>
<tbody id="<portlet:namespace />importEnabledSettings">
	<tr>
		<td>
			<liferay-ui:message key="import-on-startup-enabled" />
		</td>
		<td>
			<liferay-ui:input-checkbox param="importOnStartup" defaultValue='<%= ParamUtil.getBoolean(request, "importOnStartup", PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsUtil.LDAP_IMPORT_ON_STARTUP)) %>' />
		</td>
	</tr>
	<tr>
		<td>
			<liferay-ui:message key="import-interval" />
		</td>
		<td>

			<%
			long importInterval = ParamUtil.getLong(request, "importInterval", PrefsPropsUtil.getLong(company.getCompanyId(), PropsUtil.LDAP_IMPORT_INTERVAL));
			%>

			<select name="<portlet:namespace />importInterval">
				<option value="0" <%= (importInterval == 0) ? " selected " : "" %>><liferay-ui:message key="disabled" /></option>
				<option value="5" <%= (importInterval == 5) ? " selected " : "" %>>5 <liferay-ui:message key="minutes" /></option>
				<option value="10" <%= (importInterval == 10) ? " selected " : "" %>>10 <liferay-ui:message key="minutes" /></option>
				<option value="30" <%= (importInterval == 30) ? " selected " : "" %>>30 <liferay-ui:message key="minutes" /></option>
				<option value="60" <%= (importInterval == 60) ? " selected " : "" %>>1 <liferay-ui:message key="hour" /></option>
				<option value="120" <%= (importInterval == 120) ? " selected " : "" %>>2 <liferay-ui:message key="hours" /></option>
				<option value="180" <%= (importInterval == 180) ? " selected " : "" %>>3 <liferay-ui:message key="hours" /></option>
			</select>
		</td>
	</tr>
</tbody>
<tr>
	<td>
		<liferay-ui:message key="export-enabled" />
	</td>
	<td>
		<liferay-ui:input-checkbox param="exportEnabled" defaultValue='<%= ParamUtil.getBoolean(request, "exportEnabled", PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsUtil.LDAP_EXPORT_ENABLED)) %>' />
	</td>
</tr>
<tbody id="<portlet:namespace />exportEnabledSettings">
	<tr>
		<td>
			<liferay-ui:message key="users-dn" />
		</td>
		<td>
			<input class="liferay-input-text" name="<portlet:namespace />usersDN" type="text" value='<%= ParamUtil.getString(request, "usersDN", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_USERS_DN)) %>' />
		</td>
	</tr>
	<tr>
		<td>
			<liferay-ui:message key="user-default-object-classes" />
		</td>
		<td>
			<input class="liferay-input-text" name="<portlet:namespace />userDefaultObjectClasses" type="text" value='<%= ParamUtil.getString(request, "userDefaultObjectClasses", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_USER_DEFAULT_OBJECT_CLASSES)) %>' />
		</td>
	</tr>
	<tr>
		<td>
			<liferay-ui:message key="groups-dn" />
		</td>
		<td>
			<input class="liferay-input-text" name="<portlet:namespace />groupsDN" type="text" value='<%= ParamUtil.getString(request, "groupsDN", PrefsPropsUtil.getString(company.getCompanyId(), PropsUtil.LDAP_GROUPS_DN)) %>' />
		</td>
	</tr>
</tbody>
</table>

<br />

<liferay-ui:tabs names="password-policy" />

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="use-ldap-password-policy" />
	</td>
	<td>
		<liferay-ui:input-checkbox param="passwordPolicyEnabled" defaultValue='<%= ParamUtil.getBoolean(request, "passwordPolicyEnabled", PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsUtil.LDAP_PASSWORD_POLICY_ENABLED)) %>' />
	</td>
</tr>
</table>

<br />

<input type="button" value="<liferay-ui:message key="save" />" onClick="<portlet:namespace />saveSettings('updateLdap');" />