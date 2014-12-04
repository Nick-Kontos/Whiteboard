<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Submission</div>
			
			<div class="row">		
				<g:each in="${assignlist }">
				
				<div class="col-md-11 col-md-offset-1">
					<div class="panel panel-info">
						<div class="panel-heading">${it?.course.coursecode} ${it?.course.coursename} 
						${it?.student.firstname } ${it?.student.lastname } ${it?.student.username}


						</div>

						<div class="panel-body">
						<font size="6">${it?.assignment.title } </font><br>
						${it?.docLink }<br>
						</div>

					<g:form role="form" controller="grade" action="saveGrades"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" id="SubmissionId" name="SubmissionId" value="${it?.id}">
							<input type="hidden" id="CourseId" name="CourseId" value="${it?.assignment.course.id}">
							<input type="hidden" id="StudentId" name="StudentId" value="${it?.course.students.id}">
							<input type="hidden" id="AssignmentId" name="AssignmentId" value="${it?.assignment.id}">
							<input type="hidden" id="DocLink" name="DocLink" value="${it?.docLink}">
						</div>
						<div>uploaded file: <g:link controller="grading" action="download"  id="${it?.id}">${it?.docLink}</g:link> </div>				
						<div class="form-group">
							<label for="InputComment">Comment</label>
							<g:textArea name="InputComment" class="form-control" rows="5"
								id="InputComment" />
						</div>														
						<div class="form-group">
							<label for="SubmitGrades">Grades worth</label>
							<g:textField name="InputGrades"  id="InputGrades"/> / ${it?.assignment.totalpoints}
						</div>
						<div class="form-group">
						<button type="submit" class="btn btn-default btn-lg btn-block">Submit Grades</button>
						</div>
					</g:form>		
					</div>

				</div>	
				</g:each>
				

			</div>

		
			
		</div>
	</div>
</div>