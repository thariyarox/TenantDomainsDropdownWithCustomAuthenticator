<%@ page import="org.wso2.carbon.identity.application.authentication.endpoint.util.CharacterEncoder" %>

<script type="text/javascript">
    function appendTenantDomain() {

        var tenantDropdownElement = document.getElementById("tenantList");
        var username = document.getElementsByName("username_tmp")[0].value;

        if (tenantDropdownElement != null) {

            var tenantDomain = tenantDropdownElement.options[tenantDropdownElement.selectedIndex].value;
            var userWithDomain = username + "@" + tenantDomain;
            document.getElementsByName("username")[0].value = userWithDomain;
        } else {
            document.getElementsByName("username")[0].value = username;

        }

    }
</script>


<div id="loginTable1" class="identity-box">
    <%
        loginFailed = CharacterEncoder.getSafeText(request.getParameter("loginFailed"));
        if (loginFailed != null) {

    %>
    <div class="alert alert-error">
        <fmt:message key='<%=CharacterEncoder.getSafeText(request.getParameter
                ("errorMessage"))%>'/>
    </div>
    <% } %>


    <% if (CharacterEncoder.getSafeText(request.getParameter("tenantList")) != null && !"".equals
            (CharacterEncoder.getSafeText(request.getParameter("tenantList")).trim())) {


    %>
    <!--Tenant Domains Dropdown-->
    <div class="control-group">
        <label class="control-label" for="tenantList">Tenant Domain:</label>

        <div class="controls">
            <select class="input-xlarge" id='tenantList' name="tenantList" size='1'>
                <option value="carbon.super">Super Tenant</option>
                <%

                    String commaSeparatedTenantList = CharacterEncoder.getSafeText(request.getParameter("tenantList")).trim();
                    String[] tenantList = commaSeparatedTenantList.split(",");
                    if (tenantList.length > 0) {
                        for (String tenant : tenantList) {%>
                <option value="<%=tenant%>"><%=tenant%>
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>
    </div>

    <% }%>


    <% if (CharacterEncoder.getSafeText(request.getParameter("username")) == null || "".equals
            (CharacterEncoder.getSafeText(request.getParameter("username")).trim())) { %>

    <!-- Username -->
    <div class="control-group">
        <label class="control-label" for="username_tmp"><fmt:message key='username'/>:</label>

        <div class="controls">
            <input class="input-xlarge" type="text" id='username_tmp' name="username_tmp" size='30'/>
            <input type="hidden" id="username" name="username"/>
        </div>
    </div>

    <%} else { %>

    <input type="hidden" id='username' name='username' value='<%=CharacterEncoder.getSafeText
        (request.getParameter("username"))%>'/>

    <% } %>

    <!--Password-->
    <div class="control-group">
        <label class="control-label" for="password"><fmt:message key='password'/>:</label>

        <div class="controls">
            <input type="password" id='password' name="password" class="input-xlarge" size='30'/>
            <input type="hidden" name="sessionDataKey"
                   value='<%=CharacterEncoder.getSafeText(request.getParameter("sessionDataKey"))%>'/>
            <label class="checkbox" style="margin-top:10px"><input type="checkbox" id="chkRemember"
                                                                   name="chkRemember"><fmt:message
                    key='remember.me'/></label>
        </div>
    </div>

    <div class="form-actions">
        <input type="submit" value='<fmt:message key='login'/>' class="btn btn-primary" onclick="appendTenantDomain();">
    </div>

</div>

