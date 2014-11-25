<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Announcement</div>
			<br>
			<div class="row">
				<g:each in="${announcelist }">
				<div class="col-md-11 col-md-offset-1">
					<div class="panel panel-info">
						<div class="panel-heading">${it?.course.coursecode }
						- ${it?.creator.firstname} 
						${it?.creator.lastname} 

						<div class="pull-right">
						<button type="button" class="btn btn-default">Edit</button>
  						<button type="button" class="btn btn-default">Delete</button>			
						</div>
						

						<div>posted Date: <g:formatDate format="yyyy-MM-dd" date="${it?.dateCreated}"/></div>
						</div>
						<div class="panel-body">
						<font size="6">${it?.title } </font><br>
						${it?.text }</div>

					</div>
				</div>
				</g:each>
			</div>
		</div>
	</div>
</div>

