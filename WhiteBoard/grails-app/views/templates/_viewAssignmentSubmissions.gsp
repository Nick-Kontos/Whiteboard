<div class="container">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">Submission</div>
			<div class="span7 text-center">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-success btn-lg">Finalize
						Grades</button>
					<button type="button" class="btn btn-success btn-lg">Download
						Grade Report</button>
				</div>
			</div>
			<table class="table table-bordered">
				<tr>
					<th>Student Name</th>
					<th>Time Submitted</th>
					<th>Document</th>
					<th>Comments</th>
					<th>Grade</th>
				</tr>
				<g:each in="${submissionList }">
					<g:if test="${!it.grade }">
						<tr>
							<td>
								${it.student.firstname + ' ' + it.student.lastname  }
							</td>
							<td>
								${it.dateCreated }
							</td>
							<td><g:link controller="grading" action="download"
									id="${it?.id}">
									${it?.docLink}
								</g:link></td>
							<td><a href="#" class="btn btn-success" data-toggle="modal"
								data-target="#commentModal">View/Edit</a></td>
							<td><a href="#" data-toggle="modal"
								data-target="#gradeModal">No grade</a></td>
						</tr>
					</g:if>
					<g:else>
						<tr class="success">
							<td>
								${it.student.firstname + ' ' + it.student.lastname  }
							</td>
							<td>
								${it.dateCreated }
							</td>
							<td><g:link controller="grading" action="download"
									id="${it?.id}">
									${it?.docLink}
								</g:link></td>
							<td><a href="#" class="btn btn-success" data-toggle="modal"
								data-target="#commentModal">View/Edit</a></td>
							<td><a href="#" data-toggle="modal"
								data-target="#gradeModal"> ${it.grade }</a></td>
						</tr>
					</g:else>
				</g:each>
			</table>
		</div>
	</div>
</div>
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
	aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&amp;times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				<h3>Comment Modal Body</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="gradeModal" tabindex="-1" role="dialog"
	aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&amp;times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				<h3>Grade Modal Body</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>