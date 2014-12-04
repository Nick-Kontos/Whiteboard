<div class="container">
	<div class="col-md-12 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Assignment</div>

			<div class="row">
				<g:each in="${assignlist }">

					<div class="col-md-11 col-md-offset-1">
						<div class="panel panel-info">
							<div class="panel-heading">
								${it?.course.coursecode }
								-
								${it?.creator.firstname}
								${it?.creator.lastname}

								<g:if test="${currentUserRole == 'ROLE_TEACHER' }">
									<div class="pull-right">
										<button type="button" class="btn btn-default">Edit</button>
										<button type="button" class="btn btn-default">Delete</button>
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

									<p>
										[Assignment]AssignmentId:${it?.id}<br> [Assignment]DueDate:${it?.datedue}<br>
										[Assignment]Title:${it?.title}<br> [Course]CourseId:${it?.course.id}<br>
										[Course]CourseCode:${it?.course.coursecode}<br>
										[Course]CourseName:${it?.course.coursename}<br>
										[User]Student Id:${it?.course.students.id}<br>
										[User]Student User:${it?.course.students.username}
									</p>
									<div class="form-group">
										<input type="hidden" id="AssignmentId" name="AssignmentId"
											value="${it?.id}"> <input type="hidden" id="CourseId"
											name="CourseId" value="${it?.course.id}"> <input
											type="hidden" id="StudentId" name="StudentId"
											value="${it?.course.students.id}">
									</div>
									<div class="form-group">

										<label for="FileUpload">Upload File </label> <input
											type="file" id="FileUpload" name="FileUpload">

									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
									</div>

								</g:form>

							</g:if>


						</div>
<<<<<<< HEAD
						<div>uploaded file: <g:link controller="assignment" action="download"  id="${it?.id}">${it?.doclink}</g:link> </div>

						<g:if test="${currentUserRole == 'ROLE_STUDENT'}">
							<g:form role="form" controller="grading" action="saveAssignment"
								enctype="multipart/form-data">
								
								<p>
								[Assignment]AssignmentId:${it?.id}<br> 
								[Assignment]DueDate:${it?.datedue}<br> 
								[Assignment]Title:${it?.title}<br>
								[Course]CourseId:${it?.course.id}<br>
								[Course]CourseCode:${it?.course.coursecode}<br>
								[Course]CourseName:${it?.course.coursename}<br> 
								[User]Student Id:${it?.course.students.id}<br> 
								[User]Student User:${it?.course.students.username}
								</p>
								<div class="form-group">
									<input type="hidden" id="AssignmentId" name="AssignmentId" value="${it?.id}">
									<input type="hidden" id="CourseId" name="CourseId" value="${it?.course.id}">
									<input type="hidden" id="StudentId" name="StudentId" value="${it?.course.students.id}">
									<input type="hidden" id="DateDue" name="DateDue" value="${it?.datedue}">
								</div>
								<div class="form-group">
									<g:formatDate format="yyyy-MM-dd" date="${it?.datedue}"/>
									<label for="FileUpload">Upload File </label> 
									<input type="file" id="FileUpload" name="FileUpload">
=======

						<g:if test="${currentUserRole == 'ROLE_TEACHER' }">
							<div class="pull-right">
								<button type="button" class="btn btn-default">Edit</button>
								<button type="button" class="btn btn-default">Delete</button>
							</div>
						</g:if>
>>>>>>> origin/master

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
						${it?.doclink}
					</div>
					<g:if test="${currentUserRole == 'ROLE_STUDENT'}">
						<input type="file" class="btn btn-default btn-lg btn-block"
							id="FileUpload" name="FileUpload">
						<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
					</g:if>
				</g:each>
			</div>

		</div>



	</div>

</div>

