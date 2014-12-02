<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Grades</div>
			
			<div class="row">		
				<g:each in="${assignlist }">
				
				<div class="col-md-11 col-md-offset-1">
					<div class="panel panel-info">
						<div class="panel-heading">
						${it?.course.coursecode }
						${it?.assignment.title }
						 
							<g:if test="${currentUserRole == 'ROLE_TEACHER' }">
								<div class="pull-right">
								<button type="button" class="btn btn-default">Edit</button>
		  						<button type="button" class="btn btn-default">Delete</button>			
								</div>
							</g:if>							
						<div>Name: ${it?.student.firstname} ${it?.student.lastname}	</div>
						<div>Grade: ${it?.grade}</div>						 				
						</div>

						<div class="panel-body">
						${it?.assignment.text }<br>
						submitted file: ${it?.docLink}
						</div>						
					</div>

				</div>
				</g:each>
				

			</div>
			
		</div>
	</div>
</div>