package whiteboard

class AssignmentController {

  	def springSecurityService

	def index() {
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Assignment', currentUserRole: currentRole])
	}

	def retrieveClasses(){
		def result
		if(getAccountType() == 'ROLE_STUDENT'){
			def c = Course.createCriteria()
			result = c.get {
				students{
					idEq(springSecurityService.currentUser.id)
				}
			}
		}else if(getAccountType() == 'ROLE_TEACHER'){
			result = Course.findByTeacher(springSecurityService.currentUser)
		}
		return result
	}
	def getAccountType(){
		UserRole.findAllByUser(springSecurityService.currentUser).get(0).role.authority
	}
	def createLink(){
		//render placeholder
		render('Create Assignment')
	}
	def courseLink(){
		//render placeholder
		def coursename = params.coursename
		if(coursename)
			render('Assignment for ' + coursename)
		else
			render('error')
	}
	def allLink(){
		//render placeholder
		render('All Assignments')
	}
	
}
