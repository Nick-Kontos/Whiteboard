package whiteboard

class GradeController {

	def springSecurityService

	def index() {
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Grade', currentUserRole: currentRole])
	}
	
	def sidebar(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(template: '/sidebars/sidebar', model: [sidebarlinks: links, controllertype: 'Grade', currentUserRole: currentRole])
	}

	def retrieveClasses(){
		def result
		if(getAccountType() == 'ROLE_STUDENT'){
			def c = Course.createCriteria()
			result = c.list {
				students{
					idEq(springSecurityService.currentUser.id)
				}
			}
		}else if(getAccountType() == 'ROLE_TEACHER'){
			result = Course.findAllByTeacher(springSecurityService.currentUser)
		}
		return result
	}
	def getAccountType(){
		UserRole.findAllByUser(springSecurityService.currentUser).get(0).role.authority
	}

	def courseLink(){
		//render placeholder
		def coursename = params.coursename
		if(coursename)
			render('Grades for ' + coursename)
		else
			render('error')
	}
	def allLink(){
		//render placeholder
		render('All Grades')
	}

}
