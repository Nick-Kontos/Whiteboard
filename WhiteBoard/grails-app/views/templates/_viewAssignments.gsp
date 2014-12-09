<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">Assignment</div>

		<g:each in="${assignlist }">
			<div class="panel panel-info">
				<div class="panel-heading">
					${it?.course.coursecode }
					-
					${it?.creator.firstname}
					${it?.creator.lastname}
					<g:if test="${currentUserRole == 'ROLE_TEACHER'||currentUserRole == 'ROLE_SITEMANAGER' }">
								<div class="pull-right">

								<li><g:remoteLink type="button" update="MainContent" controller="assignment"
								action="editAssignment" params="${[assignmentno: it?.id, course1: it?.course.coursecode]}"  >Edit</g:remoteLink></li> 
								 
								<li><g:remoteLink type="button" update="MainContent" controller="assignment"
								action="deleteAssignment" params="${[assignmentno: it?.id] }"  >Delete</g:remoteLink></li>
								 
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
					${it?.text }<br>
				</div>
				<div>
					uploaded file:
					<g:link controller="assignment" action="download" id="${it?.id}">
						${it?.doclink}
					</g:link>
				</div>

				<g:if test="${currentUserRole == 'ROLE_STUDENT'}">
					<g:form role="form" controller="grading" action="saveAssignment"
						enctype="multipart/form-data">


						<div class="form-group">
							<input type="hidden" id="AssignmentId" name="AssignmentId"
								value="${it?.id}"> <input type="hidden" id="CourseId"
								name="CourseId" value="${it?.course.id}"> <input
								type="hidden" id="StudentId" name="StudentId"
								value="${it?.course.students.id}"> <input type="hidden"
								id="DateDue" name="DateDue" value="${it?.datedue}"> <input
								type="hidden" id="StudentFirstName" name="StudentFirstName"
								value="${it?.course.students.firstname}"> <input
								type="hidden" id="StudentLastName" name="StudentLastName"
								value="${it?.course.students.lastname}"> <input
								type="hidden" id="CourseCode" name="CourseCode"
								value="${it?.course.coursecode}"> <input type="hidden"
								id="AssignmentName" name="AssignmentName" value="${it?.title}">
						</div>
						<div class="form-group">

							<label for="FileUpload">Upload File </label> <input type="file"
								id="FileUpload" name="FileUpload">

						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
						</div>

					</g:form>

				</g:if>


			</div>
		</g:each>
	</div>

</div>



