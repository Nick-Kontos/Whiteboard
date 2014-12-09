
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Announcement Post Success</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="course"
				action="returnCourse" enctype="multipart/form-data">
					<div class="form-group">
				<label for="InputTitle">Course Name  :${coursename}</label>
				
				<div class="form-group">
				<label for="InputTitle">Course Code :${coursecode}</label>
				<div class="form-group">
				<label for="InputTitle">Course Description :${description}</label>
				
			
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Return</button>
			</div>
		</g:form>
	</div>
</div>
