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
					<li><g:remoteLink update="sidebar" controller="Announcement"
							class="active" action="sidebar">Announcements</g:remoteLink></li>
					<g:if
						test="${currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_SITEMANAGER'}">
						<li><g:remoteLink update="sidebar" controller="Course"
								action="sidebar">Courses</g:remoteLink></li>
					</g:if>
					<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
						<li><g:remoteLink update="sidebar" controller="Account"
								action="sidebar">Accounts</g:remoteLink></li>
					</g:if>
					<g:if
						test="${currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_STUDENT'}">
						<li><g:remoteLink update="sidebar" controller="Grade"
								action="sidebar">Grades</g:remoteLink></li>
					</g:if>
					<g:if test="${currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_STUDENT' || currentUserRole == 'ROLE_TEACHER'}">
						<li><g:remoteLink update="sidebar" controller="Assignment"
								action="sidebar">Assignments</g:remoteLink></li>
					</g:if>
					<g:if
						test="${currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_TA' }">
						<li><g:remoteLink update="sidebar" controller="Grading"
								action="sidebar">Grading</g:remoteLink></li>
					</g:if>
					<a href="#" class="btn btn-success" data-toggle="modal" data-target="#basicModal">Help</a> 
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
	
	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="myModalLabel">Help Page</h2>
				</div>
				<div class="modal-body">
					<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
					<h2>Instructions for site manager</h2>
					<h2>1. Announcements</h2>
					<p>Site managers may create and view announcements. Announcements created by site managers
					   will be available to all users of the website.</p>
					<p>To create an announcement, click on 'Announcements' on the nav-bar, and then click 'Create' on
					   the sidebar (left-side). Give your announcement a title and fill in the body of your announcement. 
					   If you wish to upload any files to the announcement, you may do so. There is a check box, labeled
					   'Visible', which will enable you to toggle the visibility of your message.</p>
					<h2>2. Courses</h2>
					<p>To create a course, click on 'Courses' on the nav-bar, and then click 'Create' on the sidebar.
					   Enter the course code, course name, a textual description of the course, the course instructor ID.
					   To enter the class roster for the class, you may manually type in the student IDs of the roster or,
					   upload a CSV file, which must be formatted as ID, Last name, First name, email address. Click 'Submit'
					   when you are finished.</p>
					<h2>3. Accounts</h2>
					<p>To create an account, click on 'Accounts' on the nav-bar, and then click 'Create' on the sidebar.
					   For the account, enter the email address, user name, password, first and last name, and then select
					   the role of the account(student,teacher,TA). When you are finished, click 'Submit.</p>
					<p>In the accounts tab, you may view a list of all teachers, students, TAs, and other site managers, as well.</p>
					</g:if>
					
					<g:if test="${currentUserRole == 'ROLE_STUDENT'}">
					<h2>Instructions for students</h2>
					<h2>1. Announcements</h2>
					<p>You may view general(site-wide) and course-specific announcements. On the nav bar, 
					   click 'Announcements' and choose either 'All', 'General', or a specific course you are
					   enrolled in. Depending on your choice, you will be shown all announcements available to you,
					   announcements created by site managers, or announcements specific to the course you selected.</p>
					<h2>2. Grades</h2>
					<p>Students may view their grades either all on one page, or grades specific to a certain course.
					    Click 'Grades' on the nav-bar and click 'All' to view all grades or, choose a course and view the 
					    grades for that course.</p>
					<h2>3. Assignments</h2>
					<p>Students may view either assignments either all at once or, specific assignments for a course.
					    To view assignments, click 'Assignments' on the nav-bar. Click 'All' to view all assignments on
					    one page or, choose a course and view the assignments specific to that course.</p>
					</g:if>
					
					<g:if test="${currentUserRole == 'ROLE_TEACHER'}">
					<h2>Instructions for teachers</h2>
					<h2>1. Announcements</h2>
					<p>Teachers can create announcements for classes they are teaching or view all announcements available to them.</p>
					<p>To create an announcement, click on 'Announcements' on the nav-bar and then click 'Create'. Select the course,
					   give the announcement a title, fill in the text body for the announcement and upload any files you wish to provide.
					   There is a checkbox, labeled 'Visible', which you can select to toggle the visibility of your announcement. When you are 
					   done, click 'Submit'.</p>
					<p>To view announcements, on the sidebar, click 'All' to view all announcements available, or select a course you are teaching
					   to view the announcements specific to that course.</p>
					<h2>2. Courses</h2>
					<p>Regarding courses, teachers can appoint TAs(teacher assistants) or view course information for a course they are teaching.</p>
					<p>To appoint a TA, click 'Courses' on the nav-bar and click 'Appoint TA'. Select a course and type in a comma-separated, no-spaces,
					   list of TA IDs. When you are done, click 'Submit'.</p>
					<p>To view course information, on the sidebar and view</p>
					<h2>3. Assignments</h2>
					<p>For assignments, teacher can create assignments for classes or view previously assigned ones for any or all courses.</p>
					<p>Access assignments from the 'Assignments' tab on the nav-bar and then click 'Create' on the sidebar. Select the course,
					   enter the assignment name, a description if necessary, total points worth, due date, and upload any files necessary. Use the
					   'Visible' checkbox to toggle visibility. Upon completion, click 'Submit'.</p>
					<p>View assignments by clicking 'All' on the sidebar to view all assignments or click a course to view the assignments specific
					   to that course.</p>
					<h2>4. Grades</h2>
					<p>To view the grading statistics for assignments, click 'Grading' on the navbar, and then select a course. You may download a grade report,
					   which will provide statistics for assignments.</p> 
					</g:if>
					
					<g:if test="${currentUserRole == 'ROLE_TA'}">
					<h2>Instructions for TA</h2>
					<h2>1. Announcements</h2>
					<p>Click 'Announcements' on the navbar. To create an announcement, click 'Create' on the sidebar and select course,
					   enter title, text, and upload any files needed. Toggle visibility if required and click 'Submit' to finish. To view
					   announcements, click 'All' on the sidebar for all available announcements or select a course to see announcements
					   specific to that course.</p>
					<h2>2. Grades</h2>
					<p>
					</g:if>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
				</div>
			</div>
		</div>
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