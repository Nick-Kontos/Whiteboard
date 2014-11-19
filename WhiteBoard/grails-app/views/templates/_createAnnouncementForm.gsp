<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Create Announcement</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="announcement"
			action="createAnnouncement" enctype="multipart/form-data">
			<div class="form-group">
				<label for="InputCourse">Select Course</label>
				<g:select name="InputCourse" class="form-control" id="InputCourse"
					from="${sidebarlinks}" />
			</div>
			<div class="form-group">
				<label for="InputTitle">Announcement Title</label>
				<g:textField name="InputTitle" type="text" class="form-control"
					id="InputTitle" placeholder="Title" />
			</div>
			<div class="form-group">
				<label for="InputText">Announcement Text</label>
				<g:textArea class="form-control" name="InputText" rows="5"
					id="InputText" />
			</div>
			<div class="form-group">
				<label for="fileUpload">Upload File</label> <input type="file"
					id="fileUpload" name="fileUpload">
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