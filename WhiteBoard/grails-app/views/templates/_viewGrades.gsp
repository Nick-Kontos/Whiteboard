<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Grades</div>
			
			<div class="row">		
				<g:each in="${assignlist }">
				
				<div class="col-md-11 col-md-offset-1">

					<table class="table table-hover">
  						<tr>
  							<th>Name of the assignment<br>
  							Date Due: ${it?.assignment.datedue}</th>
  							<th>Grades of student</th>
  						</tr>
  						<tr>
  							<td class="info">${it?.assignment.title }</td>
  							<td class="info">${it?.grade }</td>
  						</tr>
					</table>					

				</div>
				</g:each>
				

			</div>
			
		</div>
	</div>
</div>