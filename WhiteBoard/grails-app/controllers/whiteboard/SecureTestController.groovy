package whiteboard

import grails.plugin.springsecurity.annotation.Secured

class SecureTestController {
	
	@Secured(['ROLE_ADMIN'])
    def index() {
		render Success
	}
}
