package whiteboard

import grails.plugin.springsecurity.annotation.Secured

class SecureTestController {
	
	@Secured(['ROLE_SITEMANAGER'])
    def index() {
		render 'Success'
	}
}