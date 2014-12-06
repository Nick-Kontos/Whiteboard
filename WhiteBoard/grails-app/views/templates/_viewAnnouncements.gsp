<div class="container">
	<div class="col-md-12 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">${type }Announcements</div>
			<br>
			<div class="row">
				<g:each in="${announcelist }">
					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-info">
							<div class="panel-heading">
								${it?.course.coursecode }
								-
								${it?.creator.firstname}
								${it?.creator.lastname}
								<g:if test="${currentUserRole == 'ROLE_TEACHER' }">
									<div class="pull-right">
								<g:form role="form" controller="announcement"
								action="editAnnouncement"  name="InputText" id="InputText" enctype="multipart/form-data">
								 
								 
								<input type="hidden" id="announcementno" name="announcementno" value="${it?.title}">
								<button type="submit" class="btn btn-default">Edit</button>
								</g:form>
								 
								<g:form role="form" controller="announcement"
								action="deleteAnnouncement" enctype="multipart/form-data">
								 
								<input type="hidden" id="announcementno" name="announcementno" value="${it?.title}">
								  <button type="submit" class="btn btn-default">Delete</button>
								  </g:form>
									</div>
								</g:if>
								<div>
									posted Date:
									<g:formatDate format="yyyy-MM-dd" date="${it?.dateCreated}" />
								</div>
							</div>
							<div class="panel-body">
								<font size="6">
									${it?.title }
								</font><br>
								${it?.text }
							</div>

						</div>
					</div>
				</g:each>
			</div>
		</div>
	</div>
</div>

