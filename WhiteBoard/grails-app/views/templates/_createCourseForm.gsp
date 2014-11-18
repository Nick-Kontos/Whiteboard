<div class="row">
	<div class="form-group">
		<label for="coursecode">Select Course Code:</label> <select
			class="form-control" id="coursecode">
			<option selected-disabled>Please select</option>
			<option>CSE</option>
			<option>AMS</option>
			<option>HUM</option>
			<option>MAT</option>
			<option>EGL</option>
		</select>
	</div>
</div>
<div class="row">&nbsp;</div>
<!--  Padding between rows -->
<div class="row">
	<div class="form-group">
		<label for="courseid">Input Course ID:</label> <input type="text"
			class="form-control" id="courseid" placeholder="Course ID">
	</div>
</div>
<div class="row">&nbsp;</div>
<div class="row">
	<div class="form">
		<label for="textdescription">Section:</label> <input type="text"
			class="form-control" id="coursesection" placeholder="00">
	</div>
</div>
<div class="row">&nbsp;</div>
<div class="row">
	<div class="form-group">
		<label for="textdescription">Textual Description:</label>
		<textarea class="form-control" rows=5 id="textdescription"></textarea>
	</div>
</div>
<div class="row">&nbsp;</div>
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
<div class="row">
	<div class="form-group">
		<button type="submit" class="btn btn-primary">Submit</button>
		<button type="cancel" class="btn btn-primary">Cancel</button>
	</div>
</div>
