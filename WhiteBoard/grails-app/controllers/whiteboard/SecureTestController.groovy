package whiteboard

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.*
class SecureTestController {
	
	@Secured(['ROLE_SITEMANAGER'])
    def index() {

	}
	
	def getAccountType(){
		UserRole.findAllByUser(springSecurityService.currentUser).get(0).role.authority
	}

	// This has to be changed. 
}
