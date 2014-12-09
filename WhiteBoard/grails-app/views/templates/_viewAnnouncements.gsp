<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			${type }Announcements
		</div>
		<br>
		<g:each in="${announcelist }">
			<div class="panel panel-info">
				<div class="panel-heading">
					${it?.course.coursecode }
					-
					${it?.creator.firstname}
					${it?.creator.lastname}
					<g:if
						test="${currentUserRole == 'ROLE_TEACHER'||currentUserRole == 'ROLE_SITEMANAGER' }">
						<div class="pull-right">

							<li><g:remoteLink type="button" update="MainContent"
									controller="announcement" action="editAnnouncement"
									params="${[announcementno: it?.id, course1: it?.course.coursecode]}">Edit</g:remoteLink></li>

							<li><g:remoteLink type="button" update="MainContent"
									controller="announcement" action="deleteAnnouncement"
									params="${[announcementno: it?.id] }">Delete</g:remoteLink></li>

						</div>
					</g:if>
					<div>
						posted Date:
						<g:formatDate format="yyyy-MM-dd" date="${it?.dateCreated}" />
					</div>
				</div>
				<div class="panel-body">
					<font size="6"> ${it?.title }
					</font><br>
					${it?.text }
				</div>

			</div>

		</g:each>
	</div>
</div>

