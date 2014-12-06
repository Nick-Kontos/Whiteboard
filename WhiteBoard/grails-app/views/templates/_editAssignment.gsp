
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Edit Assignment!</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="assignment" action="createAssignment"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="InputCourse">Select Course</label>
				<g:select name="InputCourse" class="form-control" id="InputCourse"
					from="${coursecodes}" />
			</div>
			<div class="form-group">
				<label for="InputTitle">Enter assignment name</label>
				<g:textField name="InputTitle" type="text" class="form-control"
					id="InputTitle" value="${title}" />
			</div>
			<div class="form-group">
				<label for="InputDescription">Description</label>
				<g:textArea name="InputDescription" class="form-control" rows="5"
					id="InputDescription" value="${text}" />
			</div>
			<div class="form-group">
				<label for="InputPointsWorth">Points Worth</label>
				<g:textField name="InputPointsWorth" class="form-control"
					id="InputPointsWorth" value="${point}" />
			</div>
			<div class="form-group">
				<label for="InputDueDate">Input Due Date</label>
				<g:datePicker name="InputDueDate" id="InputDueDate"
					relativeYears="[-1..1]" />
			</div>

			<div class="form-group">

				<label for="FileUpload">Upload File haha</label> 
				<input type="file" id="FileUpload" name="FileUpload">

			</div>
			<div class="form-group">
				<label for="InputVisible">Visible</label>
				<g:checkBox name="InputVisible" value="${true }" id="InputVisible" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
			</div>
		</g:form>
	</div>
</div>
