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
				<a class="navbar-brand" href="index.html">White Board 
					<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
					<span class="label label-default">SiteManager</span>
					</g:if>
					<g:elseif test="${currentUserRole == 'ROLE_TEACHER'}">	
					<span class="label label-default">Teacher</span>
					</g:elseif>
					<g:elseif test="${currentUserRole == 'ROLE_TA'}">	
					<span class="label label-default">TA</span>
					</g:elseif>					
					<g:elseif test="${currentUserRole == 'ROLE_STUDENT'}">	
					<span class="label label-default">Student</span>
					</g:elseif>					

					</a>

			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><g:link controller="Announcement">Announcements</g:link></li>
					<li><g:link controller="Course">Courses</g:link></li>	
					<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
						<li><g:link controller="Account">Accounts</g:link></li>
					</g:if>
					<g:if test="${currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_STUDENT'}">	
						<li><g:link controller="Grade">Grades</g:link></li>
						<li><g:link controller="Assignment">Assignments</g:link></li>
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
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<g:if test="${controllertype == 'Announcement' }">
						<g:if
							test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_SITEMANAGER' || currentUserRole == 'ROLE_TA'}">
							<li><g:link controller="announcement" action="createLink">Create</g:link></li>
						</g:if>
						<g:if
							test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_STUDENT'}">
							<li><g:link controller="announcement" action="allLink">All</g:link></li>
						</g:if>
						<li><g:link controller="announcement" action="generalLink">General</g:link></li>
						<g:if
							test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_STUDENT' || currentUserRole == 'ROLE_TA'}">
							<g:each in="${sidebarlinks}">
								<li><g:link controller="announcement" action="courseLink"
										params="[coursename: "${it }"]">
										${it }
									</g:link></li>
							</g:each>
						</g:if>
					</g:if>
					<g:elseif test="${controllertype == 'Assignment' }">
						<g:if test="${ currentUserRole == 'ROLE_TEACHER'}">
							<li><g:link controller="assignment" action="createLink">Create</g:link></li>
						</g:if>
						<li><g:link controller="assignment" action="allLink">All</g:link></li>
						<g:if
							test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_STUDENT' || currentUserRole == 'ROLE_TA'}">
							<g:each in="${sidebarlinks}">
								<li><g:link controller="assignment" action="courseLink"
										params="[coursename: "${it }"]">
										${it }
									</g:link></li>
							</g:each>
						</g:if>
					</g:elseif>
					<g:elseif test="${controllertype == 'Account' }">
						<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
							<li><g:link controller="account" action="createLink">Create</g:link></li>
							<li><g:link controller="account" action="searchLink">Search</g:link></li>
						</g:if>
					</g:elseif>
					<g:elseif test="${controllertype == 'Course' }">
						<g:if test="${currentUserRole == 'ROLE_SITEMANAGER' }">
							<li><g:link controller="course" action="createLink">Create</g:link></li>
							<li><g:link controller="course" action="searchLink">Search</g:link></li>
						</g:if>
						<g:if test="${currentUserRole != 'ROLE_SITEMANAGER' }">
							<g:each in="${sidebarlinks}">
								<li><g:link controller="course" action="courseLink"
										params="[coursename: "${it }"]">
										${it }
									</g:link></li>
							</g:each>
						</g:if>

					</g:elseif>
					<g:elseif test="${controllertype == 'Grade' }">
						<g:if test="${currentUserRole != 'ROLE_SITEMANAGER' }">
							<li><g:link controller="grade" action="allLink">All</g:link></li>
							<g:each in="${sidebarlinks}">
								<li><g:link controller="grade" action="courseLink"
										params="[coursename: "${it }"]">
										${it }
									</g:link></li>
							</g:each>
						</g:if>
					</g:elseif>
				</ul>
			</div>
		</div>
	</div>

					<g:if test="${controllertype == 'Announcement' }">
						<g:if
							test="${ currentUserRole == 'ROLE_STUDENT' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Everyone gets A
									veryone gets Averyone gets Averyone gets Averyone gets Averyone gets Averyone gets A
									veryone gets A
									veryone gets Averyone gets A
									veryone gets A
									veryone gets A
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Everyone gets A
							      </div>
							    </div></div>
							</div>
	

						</g:if>
					<g:elseif test="${currentUserRole == 'ROLE_TEACHER' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Professor's list of Announcements
							        
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>							

					</g:elseif>
					<g:elseif test="${currentUserRole == 'ROLE_TA' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        TA's list of Announcements
							        
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>							

					</g:elseif>											
					</g:if>

					<g:if test="${controllertype == 'Course' }">
						<g:if
							test="${ currentUserRole == 'ROLE_STUDENT' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the course functions will be here
							        Everyone gets AEveryone gets AEveryone gets AEveryone gets AEveryone gets A
							        Everyone gets AEveryone gets AEveryone gets AEveryone gets AEveryone gets AEveryone gets A
							        Everyone gets AEveryone gets AEveryone gets A

							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
		
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Everyone gets A
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Everyone gets A
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Everyone gets A
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Everyone gets A
							      </div>
							    </div></div>
							</div>
						</g:if>
					<g:elseif test="${currentUserRole == 'ROLE_TEACHER' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Professor's list of courses
							        
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>							

					</g:elseif>	
					<g:elseif test="${currentUserRole == 'ROLE_TA' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        TA's list of courses
							        
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>							

					</g:elseif>											
					</g:if>

					<g:if test="${controllertype == 'Grade' }">
						<g:if
							test="${ currentUserRole == 'ROLE_STUDENT' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2">


					<table class="table table-hover">
					  <tr><td>Date</td>
					  	<td>Name</td>
					  	<td>Median</td>
					  	<td>Average</td>
					  	<td>Grade</td>
					  	<td>LetterGrade</td>
					  </tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>

					</table>
							  </div>
							</div>
							
						</g:if>
					<g:elseif test="${currentUserRole == 'ROLE_TEACHER' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2">
					<table class="table table-hover">
					  <tr><td>Date</td>
					  	<td>Name</td>
					  	<td>Median</td>
					  	<td>Average</td>
					  	<td>Grade</td>
					  	<td>LetterGrade</td>
					  </tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>

					</table>
							  </div>
							</div>
					</g:elseif>			
					<g:elseif test="${currentUserRole == 'ROLE_TA' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2">
					<table class="table table-hover">
					  <tr><td>Date</td>
					  	<td>Name</td>
					  	<td>Median</td>
					  	<td>Average</td>
					  	<td>Grade</td>
					  	<td>LetterGrade</td>
					  </tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>
					  <tr><td>213</td>
					  <td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					<td>213</td>
					</tr>

					</table>
							  </div>
							</div>
					</g:elseif>									
					</g:if>					
				<g:if test="${controllertype == 'Assignment' }">
						<g:if
							test="${ currentUserRole == 'ROLE_STUDENT' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Assignment page
							      </div>
							    </div></div>
							</div>
						</g:if>
					<g:elseif test="${currentUserRole == 'ROLE_TEACHER' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        Professor's list of Assignments
							        
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>							

					</g:elseif>	
					<g:elseif test="${currentUserRole == 'ROLE_TA' }">
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							       TA's list of Assignments
							        
							      </div>
							    </div></div>
							</div>
							<div class="row">
							  <div class="col-md-6 col-md-offset-2"><div class="panel panel-primary">
							      <div class="panel-heading">CSE 312 8/20/14</div>
							      <div class="panel-body">
							        All of the announcments will be displayed here
							        Everyone gets A
							      </div>
							    </div></div>
							</div>							

					</g:elseif>											

					</g:if>
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