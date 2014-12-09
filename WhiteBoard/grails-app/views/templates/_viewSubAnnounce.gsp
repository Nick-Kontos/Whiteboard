
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Announcement Post Success</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="announcement"
				action="returnAnnouncement" enctype="multipart/form-data">
				<div class="form-group">
				<label for="InputText">Course : ${course}</label>
				
			
			<div class="form-group">
				<label for="InputTitle">Announcement Title :${title}</label>
				
		
			<div class="form-group">
				<label for="InputText">Announcement Text : ${text}</label>
				
			
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Return</button>
			</div>
		</g:form>
	</div>
</div>
