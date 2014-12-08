<!-- 
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options = {
			title : 'My Daily Activities'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
	}
</script>
-->
<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">
				Grade Center for
				${coursecode }
			</div>
			<div class="span7 text-center">
				<div class="btn-group" role="group">
					<g:link controller="grading" action="downloadAssignment" type="button" class="btn btn-success btn-lg">Download
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
					<g:if test="${currentDateTime < it.datedue && it.gradeCompleted}">
						<tr class="success">
							<td><g:remoteLink update="MainContent" controller="grading"
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
							<td><a href="#" class="btn btn-success" data-toggle="modal"
								data-target="#gradeModal"> histogram </a></td>
							<td>Download Report</td>
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
							<td>Download Report</td>
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
							<td>Download Report</td>
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
				<h3>
					<div id="piechart" style="width: 100px; height: 70px;"></div>
				</h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>


		</div>
	</div>
</div>