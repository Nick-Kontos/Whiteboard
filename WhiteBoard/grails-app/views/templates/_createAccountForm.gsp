<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Create Account</h3>
	</div>
	<div class="panel-body">
		<g:formRemote update="MainContent" name="createAccount" url="[controller: 'account', action: 'createAccount']">
				<div class="form-group">
					<label for="InputEmail">Email address</label> <g:textField type="email"
						class="form-control" name="InputEmail" id="InputEmail" placeholder="Enter email"/>
				</div>
				<div class="form-group">
					<label for="InputUserName">User Name</label> <g:textField type="text"
						class="form-control" name="InputUserName" id="InputUserName" placeholder="User Name"/>
				</div>
				<div class="form-group">
					<label for="InputPassword">Password</label> <g:textField type="password"
						class="form-control" name="InputPassword" id="InputPassword" placeholder="Password"/>
				</div>
				<div class="form-group">
					<label for="InputFirstName">First Name</label> <g:textField
						type="text" class="form-control" id="InputFirstName"
						placeholder="First Name" name="InputFirstName"/>
				</div>
				<div class="form-group">
					<label for="InputLastName">Last Name</label> <g:textField type="text"
						class="form-control" name="InputLastName" id="InputLastName" placeholder="Last Name"/>
				</div>
				<div class="form-group">
					<label for="InputAccountType">Select Account Role</label> <g:select
						class="form-select" name="InputAccountType" id="InputAccountType" from="${['Teacher','Student','TA']}"/>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
				</div>		
			</g:formRemote>
		</div>
</div>