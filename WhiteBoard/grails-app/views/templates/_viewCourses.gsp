<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">				
				Courses
			</div>
			<table class="table table-bordered">
				<tr>
					<th>Course Name</th>
					<th>Course Code</th>
					<th>Teacher</th>
				</tr>
				<g:each in="${courseList }">
					<tr>
						<td>${it.coursename }</td>
						<td>${it.coursecode }</td>
						<td>${it.teacher.firstname + " " + it.teacher.lastname }</td>
					</tr>
				</g:each>
			</table>
		</div>
	</div>
</div>
