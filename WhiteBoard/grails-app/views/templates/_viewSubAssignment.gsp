
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Assignment Post Success</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="assignment"
				action="returnAssignment" enctype="multipart/form-data">
				<div class="form-group">
				<label for="InputText">Course : ${course}</label>
				
			
			<div class="form-group">
				<label for="InputTitle">Assignment Title :${title}</label>
				
		
			<div class="form-group">
				<label for="InputText">Assignment Text : ${text}</label>
				<div class="form-group">
				
				<label for="InputText">Assignment Point : ${point}</label>
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Return</button>
			</div>
		</g:form>
	</div>
</div>
