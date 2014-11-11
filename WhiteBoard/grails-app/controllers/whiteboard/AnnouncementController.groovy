package whiteboard

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.*

class AnnouncementController {
	
	def springSecurityService
	
    def index() { 
		def links = ["All", "General"]
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		render(view: '/default', model: [sidebarlinks: links])
	}
	
	def retrieveClasses(){
		def c = Course.createCriteria()
		def result = c.get {
			students{
				idEq(springSecurityService.currentUser.id)
			}
		}
		return result
	}
}
