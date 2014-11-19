<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Create Course</h3>
	</div>
	<div class="panel-body">
		<g:form role="form" controller="course" action="createCourse"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="InputCourseCode">Input Course Code</label>
				<g:textField type="text" name="InputCourseCode" class="form-control"
					id="InputCourseCode" placeholder="Course Code" />
			</div>
			<div class="form-group">
				<label for="InputCourseName">Input Course Name</label>
				<g:textField type="text" name="InputCourseName" class="form-control"
					id="InputCourseName" placeholder="Course Name" />
			</div>
			<div class="form-group">
				<label for="textdescription">Textual Description</label>
				<textarea class="form-control" rows=5 id="textdescription"></textarea>
			</div>
			<div class="form-group">
				<label for="InputInstructor">Input Course Instructor</label>
				<g:textField name="InputInstructor" type="text" class="form-control"
					id="InputInstructor" placeholder="Course Instructor" />
			</div>
			<div class="form-group">
				<label for="InputRoster">Input Course Roster
					(Comma-separated):</label>
				<g:textArea class="form-control" rows="10" name="InputRoster" id="InputRoster"/>
			</div>
			<!--  add teachers and student text box -->
			<!--  
				<label class="checkbox-inline">
					<input type="checkbox" id="monday" value="mondayopt">Monday
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" id="tuesday" value="tuesdayopt">Tuesday
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" id="wednesday" value="wednesdayopt">Wednesday
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" id="thursday" value="thursdayopt">Thursday
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" id="friday" value="fridayopt">Friday
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" id="saturday" value="saturdayopt">Saturday
				</label>
				<div class="row">&nbsp;</div>
				<div class="well">

               <form class="form-horizontal">
                 <fieldset>
                  <div class="control-group">
                    <label class="control-label" for="reservationtime">Choose your check-in and check-out times:</label>
                    <div class="controls">
                     <div class="input-prepend input-group">
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                       <input type="text" style="width: 400px" name="reservation" id="reservationtime" class="form-control" value="08/01/2013 1:00 PM - 08/01/2013 1:30 PM"  class="span4"/>
                     </div>
                    </div>
                  </div>
                 </fieldset>
               </form>

               <script type="text/javascript">
               $(document).ready(function() {
                  $('#reservationtime').daterangepicker({
                    timePicker: true,
                    timePickerIncrement: 30,
                    format: 'MM/DD/YYYY h:mm A'
                  }, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                  });
               });
               </script>

            </div>     -->
			<div class="form-group">
				<label for="fileUpload">Upload File</label> <input type="file"
					id="fileUpload" name="fileUpload">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
			</div>
		</g:form>
	</div>
</div>
