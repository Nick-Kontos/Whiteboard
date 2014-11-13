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
		render('Create Account')
	}
	
	def searchLink(){
		//render placeholder
		render('Search Account')
	}
	
	
}
