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
</head>
<body>
  <app-root>Loading...</app-root>
  <script type="text/javascript" src="<c:url value="/app/inline.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/polyfills.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/styles.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/vendor.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/main.bundle.js" />"></script>
</body>
</html>