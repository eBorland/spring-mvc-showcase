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
  <noscript id="appContent">
    <div class="app-container">
      <div *ngFor="let element of template.elements">
        <div *ngIf="element.visible" [ngSwitch]="element.id" class="text-center">
          <h1 class="text-center" *ngSwitchCase="'title'">{{ element.text || 'This is the Title' }}</h1>
          <h3 class="text-center" *ngSwitchCase="'subtitle'">{{ element.text || 'This is the default subtitle' }}</h3>
          <img *ngSwitchCase="'img'" [src]="element.src">
          <div *ngSwitchCase="'get-started'">
            <button class="get-started-btn" (click)="getStarted = !getStarted">
              <span *ngIf="getStarted">
                STOP
              </span>
              <span *ngIf="!getStarted">
                GET STARTED
              </span>
            </button>
            <h2 *ngIf="getStarted">Loading...</h2>
          </div>
        </div>
      </div>
    </div>
  </noscript>
  <script>
    var mainTemplate = document.getElementById('appContent');
    window.mainTemplate = mainTemplate.innerText;
  </script>
  <script type="text/javascript" src="<c:url value="/app/assets/template.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/inline.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/polyfills.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/styles.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/vendor.bundle.js" />"></script>
  <script type="text/javascript" src="<c:url value="/app/main.bundle.js" />"></script>
</body>
</html>