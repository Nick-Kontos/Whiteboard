<div class="container">
	<div class="col-md-11 col-md-offset-1">
		<div class="panel panel-primary">
			<div class="panel-heading">Assignment</div>
			<div class="row">
				<g:each in="${assignlist? }">
				<div class="col-md-10 col-md-offset-1">
					<div class="panel panel-info">
						<div class="panel-heading">${it?.course?.coursecode }</div>
						<div class="panel-heading">date created</div>
						<div class="panel-heading">${it?.title }</div>
						<div class="panel-body">${it?.text }</div>
					</div>
				</div>
				</g:each>
			</div>
		</div>
	</div>
</div>