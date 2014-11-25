<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">Assignment</div>
			<div class="row">
				<g:each in="${assignlist }">
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
						${it?.text }<br>
						uploaded file: ${it?.doclink}</div>
						<input type="file" class="btn btn-default btn-lg btn-block"s id="FileUpload" name="FileUpload">
						<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
						
					</div>

				</div>
				</g:each>
			</div>
		</div>
	</div>
</div>