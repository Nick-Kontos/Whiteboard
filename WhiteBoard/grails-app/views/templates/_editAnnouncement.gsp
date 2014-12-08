<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Edit Announcement</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="announcement"
			action="createAnnouncement" enctype="multipart/form-data">
			<div class="form-group">
			<label for="InputCourse">Select Course</label>
			</div>			 
			<input type="hidden" name="InputCourse" id="InputCourse" value="${coursecodes}" />

			<div class="form-group">${coursecodes}</div>
			<div class="form-group">
				<label for="InputTitle">Announcement Title</label>
				<g:textField name="InputTitle" type="text" class="form-control"
					id="InputTitle" value="${title}" />
			</div>
			<div class="form-group">
				<label for="InputText">Announcement Text</label>
				<g:textArea class="form-control" name="InputText" rows="5"
					id="InputText" value="${text}"/>
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