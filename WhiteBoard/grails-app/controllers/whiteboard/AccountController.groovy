package whiteboard

class AccountController {

	def springSecurityService

	def index() {
		def currentRole = getAccountType()
		render(view: '/default', model: [controllertype: 'Account', currentUserRole: currentRole])
	}

	def getAccountType(){
		UserRole.findAllByUser(springSecurityService.currentUser).get(0).role.authority
	}

	def createLink(){
		//render placeholder
		render(template: '/templates/createAccountForm')
	}

	def searchLink(){
		//render placeholder
		render('Search Account')
	}
	def createAccount(){
		//first checks to see if all input fields are filled in
		if(params.InputUserName && params.InputPassword && params.InputEmail && params.InputFirstName &&params.InputLastName){
			def newUser = new User(username: params.InputUserName, password: params.InputPassword, email: params.InputEmail, firstname: params.InputFirstName, lastname: params.InputLastName)
			//this attempts to save the new user to the database and catches any errors
			try{
				newUser.save(failOnError: true)
				def newUserRole
				if(params.InputAccountType == "Student"){
					newUserRole = Role.findByAuthority('ROLE_STUDENT')
				}else if(params.InputAccountType == "Teacher"){
					newUserRole = Role.findByAuthority('ROLE_TEACHER')
				}else if(params.InputAccountType == "TA"){
					newUserRole = Role.findByAuthority('ROLE_TA')
				}

				UserRole.create(newUser, newUserRole, true)
				render('Successfully created ')
			}catch(Exception e){
				//this needs to be filled in for error detection later
				render(e.message)
			}
		}else render('Error Incomplete fields')
	}
}
