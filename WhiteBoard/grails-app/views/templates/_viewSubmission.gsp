<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Submission</div>
			
			<div class="row">		

				
				
				<div class="col-md-11 col-md-offset-1">
					<div class="panel panel-info">


  						<g:each in="${assignlist }">
  						<g:form role="form" controller="grade" action="saveGrades"
						enctype="multipart/form-data">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingOne">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					          Collapsible Group Item #1
					        </a>
					      </h4>
					    </div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
					      <div class="panel-body">
					      <table class="table table-hover">
  						<tr>
  							<td class="info">${it?.assignment.title }<br>(Date Due:Date Due: ${it?.assignment.datedue})</td>
  							<td class="info">${it?.student.firstname } ${it?.student.lastname }(${it?.student.username})</td>
  							<td class="info"><g:link controller="grading" action="download"  id="${it?.id}">${it?.docLink}</g:link></td>
  							<td class="info"><g:textArea name="InputComment" class="form-control" rows="5"
								id="InputComment" /></td>
  							<td class="info"><g:textField name="InputGrades"  id="InputGrades"/> / ${it?.assignment.totalpoints}</td>
  							<td class="info"><button type="submit" class="btn btn-default btn-lg btn-block">Submit Grades</button></td>
  							<div class="form-group">

							<input type="hidden" id="SubmissionId" name="SubmissionId" value="${it?.id}">
							<input type="hidden" id="CourseId" name="CourseId" value="${it?.assignment.course.id}">
							<input type="hidden" id="StudentId" name="StudentId" value="${it?.course.students.id}">
							<input type="hidden" id="AssignmentId" name="AssignmentId" value="${it?.assignment.id}">
							<input type="hidden" id="DocLink" name="DocLink" value="${it?.docLink}">
							</div>		
  						</tr>
				  		</table>				
				      </div>
				    </div>					    


  						</g:form>
 						</g:each> 						
					
						
							
					</div>

				</div>	

				

			</div>

		
			
		</div>



</div>	
	</div>
</div>