<%@page import="java.io.FileReader"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <title>SPRING MVS + ANGULAR2</title>
	
	<!--
		Used for including CSRF token in JSON requests
		Also see bottom of this file for adding CSRF token to JQuery AJAX requests
	-->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <link rel="stylesheet" href="<c:url value="/app/assets/styles.css" />"></link>
</head>
<body>
  <div class="app-container">
    <% // Parse json
       JSONParser parser = new JSONParser();
       Object obj = parser.parse(new FileReader("src/main/webapp/WEB-INF/app/dist/assets/template.json"));
       JSONObject template = (JSONObject) obj;
       JSONArray elements = (JSONArray) template.get("elements");
       %>
    <% for (int i = 0; i < elements.size(); i++) { %>
      <% JSONObject jsonObject = (JSONObject)elements.get(i);
         Boolean visible = Boolean.parseBoolean(String.valueOf(jsonObject.get("visible")));
         if (visible) { %>
      <div class="text-center">
        <% if (String.valueOf(jsonObject.get("id")).equals("title")) { %>
          <h1 class="text-center"><%=String.valueOf(jsonObject.get("text"))%></h1>
        <% } %>
        <% if (String.valueOf(jsonObject.get("id")).equals("subtitle")) { %>
          <h3 class="text-center"><%=String.valueOf(jsonObject.get("text"))%></h3>
        <% } %>
        <% if (String.valueOf(jsonObject.get("id")).equals("img")) { %>
          <img src="<%=String.valueOf(jsonObject.get("src"))%>">
        <% } %>
        <% if (String.valueOf(jsonObject.get("id")).equals("get-started")) { %>
          <input type="button" value="GET STARTED" id="get-started-btn" class="get-started-btn" onclick="getStartedClick()">
          <p>
            <h2 id="loading" style="display: none">Loading...</h2>
          </p>
        <% } %>
      </div>
      <% } %>
    <% } %>
  </div>
</body>
<script>
function getStartedClick() {
  var btn = document.getElementById('get-started-btn');
  if (btn.value == "GET STARTED") {
    btn.value = "CLOSE";
    document.getElementById('loading').style.display = 'initial';
  } else {
    btn.value = "GET STARTED";
    document.getElementById('loading').style.display = 'none';
  }
}
</script>
</html>