<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">
				Grade Center for
				${coursecode }
			</div>
			<div class="span7 text-center">
				<div class="btn-group" role="group">
					<g:link controller="grading" action="downloadAssignment"
						type="button" class="btn btn-success btn-lg"
						params="${[coursename: coursecode] }">Download
						Grade Report</g:link>
				</div>
			</div>
			<table class="table table-bordered">
				<tr>
					<th>Assignment Name</th>
					<th>Date Due</th>
					<th>Max</th>
					<th>Min</th>
					<th>Average</th>
					<th>Median</th>
					<th>Histogram</th>
					<th>Download Report</th>
				</tr>
				<g:each in="${assignlist }">
					<g:if test="${it.gradeCompleted}">
						<tr class="success">
							<td>
							<g:remoteLink update="MainContent" controller="grading"
									action="assignmentGrades" params="${[assignmentId: it.id] }">
									${it.title }
							</g:remoteLink></td>
							<td>
								${it.datedue }
							</td>
							<td>
								${it.max }
							</td>
							<td>
								${it.min }
							</td>
							<td>
								${it.avg }
							</td>
							<td>
								${it.med }
							</td>
							<td>
							<a href="#" class="btn btn-success" data-toggle="modal"
								data-target="#gradeModal"> histogram </a></td>
							<td><div id="chart_div"></div></td>	
							<td><g:link controller="grading" action="downloadSubmission"
									type="button" class="btn btn-success"
									params="${[assignmentId: it.id]}">
						Download Report</g:link></td>
						</tr>
					</g:if>
					<g:elseif
						test="${currentDateTime < it.datedue && !it.gradeCompleted }">
						<tr class="warning">
							<td><g:remoteLink update="MainContent" controller="grading"
									action="assignmentGrades" params="${[assignmentId: it.id] }">
									${it.title }
								</g:remoteLink></td>
							<td>
								${it.datedue }
							</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>Histogram</td>
							<td><g:link controller="grading" action="downloadSubmission"
									type="button" class="btn btn-success"
									params="${[assignmentId: it.id]}">
						Download Report</g:link></td>
						</tr>
					</g:elseif>
					<g:else>
						<tr class="danger">
							<td><g:remoteLink update="MainContent" controller="grading"
									action="assignmentGrades" params="${[assignmentId: it.id] }">
									${it.title }
								</g:remoteLink></td>
							<td>
								${it.datedue }
							</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>Histogram</td>
							<td><g:link controller="grading" action="downloadSubmission"
									type="button" class="btn btn-success"
									params="${[assignmentId: it.id]}">
						Download Report</g:link></td>
						</tr>
					</g:else>

				</g:each>

			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="gradeModal" tabindex="-1" role="dialog"
	aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Histogram</h4>
			</div>

			<div class="modal-body">
					<div id="chart_div"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>


		</div>
	</div>
</div>
