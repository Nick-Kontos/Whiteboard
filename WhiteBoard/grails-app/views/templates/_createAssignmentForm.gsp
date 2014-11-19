
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Create Assignment</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="assignment"
			action="createAssignment" enctype="multipart/form-data">
			<div class="form-group">
				<label for="InputCourse">Enter Course</label>
				<g:textField name="InputCourse" type="text" class="form-control"
					id="InputCourse" />
			</div>
			<div class="form-group">
				<label for="InputTitle">Enter assignment name</label>
				<g:textField name="InputTitle" type="text" class="form-control"
					id="InputTitle" />
			</div>
			<div class="form-group">
				<label for="InputDescription">Description</label>
				<g:textArea name="InputDescription" class="form-control" rows="5"
					id="InputDescription" />
			</div>
			<div class="form-group">
				<label for="FileUpload">Upload File</label> <input type="file"
					id="FileUpload" name="FileUpload">
			</div>
			<div class="form-group">
				<label for="InputVisible">Visible</label>
				<g:checkBox name="InputVisible" value="${true }"
					id="InputVisible" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
			</div>
		</g:form>
	</div>
</div>
