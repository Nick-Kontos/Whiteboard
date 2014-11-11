package whiteboard

import grails.plugin.springsecurity.*

class SidebarTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def springSecurityService
	
	//this def will make the sidebar be rendered (this is called from the the main layout)
	def sidebar={attrs, body ->
		String type="user";
			//now pass the correct links to the navbar template
			out << render(template:"/sidebars/sidebar", model:[type:type]);
	}
	def isAnnouncement={attrs, body ->
		if(pageScope.controllerName == "Announcement"){
			//now pass the correct links to the navbar template
			
			out << body();
		}	
	}
	def isGrade={attrs, body ->
		if(grailsApplication.getArtefactByLogicalPropertyName('Controller', pageScope.controllerName) == "Grade"){
			//now pass the correct links to the navbar template
			out << body();
		}	
		
	}
	def isCourse={attrs, body ->
		if(grailsApplication.getArtefactByLogicalPropertyName('Controller', pageScope.controllerName) == "Course"){
			//now pass the correct links to the navbar template
			out << body();
		}	
		
	}
	def isAssignment={attrs, body ->
		if(grailsApplication.getArtefactByLogicalPropertyName('Controller', pageScope.controllerName) == "Announcement"){
			//now pass the correct links to the navbar template
			out << body();
		}	
		
	}
	def isAccount={attrs, body ->
		if(grailsApplication.getArtefactByLogicalPropertyName('Controller', pageScope.controllerName) == "Announcement"){
			//now pass the correct links to the navbar template
			out << body();
		}	
		
	}
	
}
