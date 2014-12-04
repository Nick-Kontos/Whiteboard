<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap core CSS -->
<link
	href="${request.contextPath}/WhiteBoardFrontEnd/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${request.contextPath}/WhiteBoardFrontEnd/css/whiteboard.css"
	rel="stylesheet">
<title>Whiteboard Home</title>
<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css"> -->
</head>


<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">White Board <g:if
						test="${currentUserRole == 'ROLE_SITEMANAGER'}">
						<span class="label label-default">SiteManager</span>
					</g:if> <g:elseif test="${currentUserRole == 'ROLE_TEACHER'}">
						<span class="label label-default">Teacher</span>
					</g:elseif> <g:elseif test="${currentUserRole == 'ROLE_TA'}">
						<span class="label label-default">TA</span>
					</g:elseif> <g:elseif test="${currentUserRole == 'ROLE_STUDENT'}">
						<span class="label label-default">Student</span>
					</g:elseif>

				</a>

			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><g:remoteLink update="sidebar" controller="Announcement" class="active"
							action="sidebar">Announcements</g:remoteLink></li>
					<g:if
						test="${currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_SITEMANAGER'}">							
					<li><g:remoteLink update="sidebar" controller="Course"
							action="sidebar">Courses</g:remoteLink></li>
					</g:if>		
					<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
						<li><g:remoteLink update="sidebar" controller="Account"
								action="sidebar">Accounts</g:remoteLink></li>
					</g:if>
					<g:if
						test="${currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_STUDENT'}">
						<li><g:remoteLink update="sidebar" controller="Grade"
								action="sidebar">Grades</g:remoteLink></li>
						<li><g:remoteLink update="sidebar" controller="Assignment"
								action="sidebar">Assignments</g:remoteLink></li>
					</g:if>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<form name="submitForm" method="POST"
						action="${createLink(controller: 'logout')}"></form>
					<li><a HREF="javascript:document.submitForm.submit()">
							Logout</a></li>
				</ul>

			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div id="sidebar" class="col-sm-3 col-md-2 sidebar">
				<g:include controller="announcement" action="sidebar" />
			</div>
		</div>
	</div>

	<div id="MainContent"
		class="col-sm-9 col-sm-offset-3 col-md-5 col-md-offset-2 main">
			<g:include controller="announcement" action="allLink" />
	</div>

	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${request.contextPath}/WhiteBoardFrontEnd/js/bootstrap.min.js"></script>
	<script
		src="${request.contextPath}/WhiteBoardFrontEnd/assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="${request.contextPath}/WhiteBoardFrontEnd/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>