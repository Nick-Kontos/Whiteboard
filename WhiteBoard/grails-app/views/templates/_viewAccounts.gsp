<div class="container">
	<div class="col-md-11 col-md-offset-0">
		<div class="panel panel-primary">
			<div class="panel-heading">
				${role + " " }
				Accounts
			</div>
			<table class="table table-bordered">
				<tr>
					<th>Username</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<g:if test="${role != "ROLE_SITEMANAGER" }">
						<th>Delete</th>
					</g:if>
				</tr>
				<g:each in="${accountList }">
					<tr>
						<td>
							${it.username }
						</td>
						<td>
							${it.firstname }
						</td>
						<td>
							${it.lastname }
						</td>
						<td>
							${it.email }
						</td>
						<g:if test="${role != "ROLE_SITEMANAGER" }">
							<td><g:remoteLink type="button" class="btn btn-danger" update="MainContent"
									controller="account" action="delete" params="${[userid: it.id, role: role ]}">Delete</g:remoteLink></td>
						</g:if>
					</tr>
				</g:each>
			</table>
		</div>
	</div>
</div>
