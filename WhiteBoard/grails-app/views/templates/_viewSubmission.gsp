<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Grade Center for ${coursecode }</div>
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
					<g:if test="${currentDateTime < it.datedue && it.gradeCompleted}">
						<tr class="success">
							<td><g:remoteLink update="MainContent" controller="grading" action="assignmentGrades" params="${[assignmentId: it.id] }">
							${it.title }
							</g:remoteLink>
							</td>
							<td>${it.datedue }
							</td>
							<td>${it.max }</td>
							<td>${it.min }</td>
							<td>${it.avg }</td>
							<td>${it.med }</td>
							<td>Histogram</td>
							<td>Download Report</td>
						</tr>
					</g:if>
					<g:elseif test="${currentDateTime < it.datedue && !it.gradeCompleted }">
						<tr class="warning">
							<td><g:remoteLink update="MainContent" controller="grading" action="assignmentGrades" params="${[assignmentId: it.id] }">
							${it.title }
							</g:remoteLink>
							</td>
							<td>${it.datedue }
							</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>Histogram</td>
							<td>Download Report</td>
						</tr>
					</g:elseif>
					<g:else>
						<tr class="danger">
							<td><g:remoteLink update="MainContent" controller="grading" action="assignmentGrades" params="${[assignmentId: it.id] }">
							${it.title }
							</g:remoteLink>
							</td>
							<td>${it.datedue }
							</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>Histogram</td>
							<td>Download Report</td>
						</tr>
					</g:else>
					
				</g:each>

			</table>
		</div>
	</div>
</div>