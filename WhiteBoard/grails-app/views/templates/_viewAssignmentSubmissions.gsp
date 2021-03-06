<div class="container">
	<div class="col-md-11">
		<div class="panel panel-primary">
			<div class="panel-heading">Submission</div>

			<div class="span7 text-center">
				<div class="btn-group" role="group">
					<g:if test="${submissionList.assignment.gradeCompleted}">
						<g:link type="button" class="btn btn-success btn-lg"  controller="grade" action="finalizeGrade" params="${[FinalizeGrades: submissionList.grade, AssignmentId: submissionList.assignment.id]}" >Finalize Grades</g:link>
					</g:if>
					<g:else>
						<g:link type="button" class="btn btn-success btn-lg"  controller="grade" action="finalizeGrade" params="${[FinalizeGrades: submissionList.grade, AssignmentId: submissionList.assignment.id]}" >Finalize Grades</g:link>
					</g:else>
					<g:link controller="grading" action="downloadSubmission" type="button" class="btn btn-success btn-lg" params="${[assignmentId: assignmentId] }">Download
						Grade Report</g:link>
				</div>
			</div>
			<table class="table table-bordered">
				<tr>
					<th>Student Name</th>
					<th>Time Submitted</th>
					<th>Document</th>
					<th>Comments</th>
					<th>Grade</th>
				</tr>

				<g:each in="${submissionList }">
					<input type="hidden" id="FinalizeGrades" name="FinalizeGrades"
						value="${it?.assignment.gradeCompleted}">
					<input type="hidden" id="AssignmentId" name="AssignmentId"
						value="${it?.assignment.id}">


					<g:if test="${!it.grade }">
						<tr>
							<td>
								${it.student.firstname + ' ' + it.student.lastname  }
							</td>
							<td>
								${it.dateCreated }
							</td>
							<td><g:link controller="grading" action="download"
									id="${it?.id}">
									${it?.docname}
								</g:link></td>
							<td><g:hiddenField name="SubmissionId" id="SubmissionId"
									value="${it.id}" /> <a href="#" class="btn btn-success"
								data-toggle="modal" data-target="${'#comment' + it.id }">View/Edit</a></td>
							<td><g:hiddenField name="SubmissionId" id="SubmissionId"
									value="${it.id}" /> <a href="#" class="btn btn-success"
								data-toggle="modal" data-target="${'#grade' + it.id }"> No Grade/ ${it.assignment.totalpoints}</a>
							</td>

						</tr>

					</g:if>
					<g:else>

						<tr class="success">
							<td>
								${it.student.firstname + ' ' + it.student.lastname  }
							</td>
							<td>
								${it.dateCreated }
							</td>
							<td><g:link controller="grading" action="download"
									id="${it?.id}">
									${it?.docname}
								</g:link></td>
							<td><a href="#" class="btn btn-success" data-toggle="modal"
								data-target="${'#comment' + it.id }">View/Edit</a></td>
							<td><a href="#" class="btn btn-success" data-toggle="modal"
								data-target="${'#grade' + it.id }"> ${it.grade + '/' + it.assignment.totalpoints}
							</a></td>

						</tr>

					</g:else>

				</g:each>

			</table>
		</div>
	</div>
</div>
<g:each in="${submissionList }">
	<div class="modal fade" id="${'comment' + it.id }" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&amp;times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<g:form role="form" controller="grade" action="saveComments"
					enctype="multipart/form-data">
					<g:hiddenField name="SubmissionId" id="SubmissionId"
						value="${it.id}" />
					<div class="modal-body">
						<h3>
							<label for="InputComments">Comments</label><br>
							<g:textArea name="InputComments" id="InputComments"
								value="${it.comment}" />

						</h3>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<g:if test="${submissionList.assignment.gradeCompleted}">
							<button type="submit" class="btn btn-primary">Save
								changes</button>
						</g:if>
						<g:else>
							<button type="submit" class="btn btn-primary" disabled>Save
								changes</button>
						</g:else>
					</div>
				</g:form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="${'grade' + it.id }" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel">
						Type Grades
						${it.id}
					</h4>
				</div>
				<g:form role="form" controller="grade" action="saveGrades"
					enctype="multipart/form-data">
					<g:hiddenField name="SubmissionId" id="SubmissionId"
						value="${it.id}" />

					<div class="modal-body">
						<h3>
							<label for="InputPointsWorth">Points Worth</label>
							<g:textField name="InputGrades" id="InputGrades" />
							/
							${it.assignment.totalpoints}
						</h3>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<g:if test="${submissionList.assignment.gradeCompleted}">
							<button type="submit" class="btn btn-primary">Save
								changes</button>
						</g:if>
						<g:else>
							<button type="submit" class="btn btn-primary" disabled>Save
								changes</button>
						</g:else>
					</div>
				</g:form>

			</div>
		</div>
	</div>
</g:each>
