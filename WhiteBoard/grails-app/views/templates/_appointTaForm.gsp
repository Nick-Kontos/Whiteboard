<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Appoint TA</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="course" action="appointTa2" enctype="multipart/form-data">
			<div class="form-group">
				<label for="InputCourse">Select Course</label>
				<g:select name="InputCourse" class="form-control" id="InputCourse"
					from="${coursecodes}" />
			</div>
			
			<div class="form-group">
				<label for="InputRoster">TA
					(Comma-separated):</label>
				<g:textArea class="form-control" rows="10" name="InputRoster" id="InputRoster"/>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
			</div>
		</g:form>
	</div>
</div>
