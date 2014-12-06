<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Submission</div>
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
							<td>${it.student }</td>
							<td>${it.dateCreated }</td>
							<td>doc link</td>
							<td>comments</td>
							<td>Not graded</td>
						</tr>
					</g:if>
					<g:else>
						<tr class="success">
							<td>${it.student }</td>
							<td>${it.dateCreated }</td>
							<td>doc link</td>
							<td>comments</td>
							<td>${it.grade }</td>
						</tr>
					</g:else>
				</g:each>
			</table>
		</div>
	</div>
</div>