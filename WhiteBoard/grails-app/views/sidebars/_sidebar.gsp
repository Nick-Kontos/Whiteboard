<ul class="nav nav-sidebar">
	<g:if test="${controllertype == 'Announcement' }">
		<g:if
			test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_SITEMANAGER' || currentUserRole == 'ROLE_TA'}">
			<li><g:remoteLink update="MainContent" controller="announcement"
					action="createLink">Create</g:remoteLink></li>
		</g:if>
		<g:if
			test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_TA' || currentUserRole == 'ROLE_STUDENT'}">
			<li><g:remoteLink update="MainContent" controller="announcement" class="active"
					action="allLink">All</g:remoteLink></li>
		</g:if>
							
		<li><g:remoteLink update="MainContent" controller="announcement"
				action="generalLink">General</g:remoteLink></li>
		<g:if
			test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_STUDENT' || currentUserRole == 'ROLE_TA'}">
			<g:each in="${sidebarlinks}">
				<li><g:remoteLink update="MainContent"
						controller="announcement" action="courseLink"
						params="[coursename: "${it }"]">
						${it }
					</g:remoteLink></li>
			</g:each>
		</g:if>
	</g:if>
	<g:elseif test="${controllertype == 'Assignment' }">
		<g:if test="${ currentUserRole == 'ROLE_TEACHER'}">
			<li><g:remoteLink update="MainContent" controller="assignment"
					action="createLink">Create</g:remoteLink></li>
		</g:if>
		<li><g:remoteLink update="MainContent" controller="assignment"
				action="allLink">All</g:remoteLink></li>
		<g:if
			test="${ currentUserRole == 'ROLE_TEACHER' || currentUserRole == 'ROLE_STUDENT' || currentUserRole == 'ROLE_TA'}">
			<g:each in="${sidebarlinks}">
				<li><g:remoteLink update="MainContent" controller="assignment"
						action="courseLink" params="[coursename: "${it }"]">
						${it }
					</g:remoteLink></li>
			</g:each>
		</g:if>
	</g:elseif>
	<g:elseif test="${controllertype == 'Account' }">
		<g:if test="${currentUserRole == 'ROLE_SITEMANAGER'}">
			<li><g:remoteLink update="MainContent" controller="account"
					action="createLink">Create</g:remoteLink></li>
			<li><g:remoteLink update="MainContent" controller="account"
					action="searchLink">Search</g:remoteLink></li>
		</g:if>
	</g:elseif>
	<g:elseif test="${controllertype == 'Course' }">
		<g:if test="${currentUserRole == 'ROLE_SITEMANAGER' }">
			<li><g:remoteLink update="MainContent" controller="course"
					action="createLink">Create</g:remoteLink></li>
			<li><g:remoteLink update="MainContent" controller="course"
					action="searchLink">Search</g:remoteLink></li>
		</g:if>
		<g:if test="${currentUserRole != 'ROLE_SITEMANAGER' }">
			<g:each in="${sidebarlinks}">
				<li><g:remoteLink update="MainContent" controller="course"
						action="courseLink" params="[coursename: "${it }"]">
						${it }
					</g:remoteLink></li>
			</g:each>
		</g:if>

	</g:elseif>
	<g:elseif test="${controllertype == 'Grade' }">
		<g:if test="${currentUserRole != 'ROLE_SITEMANAGER' }">
			<li><g:remoteLink update="MainContent" controller="grade"
					action="allLink">All</g:remoteLink></li>
			<g:each in="${sidebarlinks}">
				<li><g:remoteLink update="MainContent" controller="grade"
						action="courseLink" params="[coursename: "${it }"]">
						${it }
					</g:remoteLink></li>
			</g:each>
		</g:if>
	</g:elseif>
</ul>