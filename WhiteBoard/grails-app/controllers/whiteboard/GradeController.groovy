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
		def assignlist = []
		retrieveClasses().each {
			Submission.findAllByCourse(it).each{
				assignlist.add(it)
			}		
		}
		render(template: '/templates/viewGrades', model: [assignlist: assignlist, currentUserRole: getAccountType()])
	}
	def saveGrades(){

		def grades = params.int('InputGrades')
		def comment = params.InputComment
		def id = params.SubmissionId

		if(params.InputGrades ){

			try{

				def update = Submission.get(id)
				update.grade = grades
				update.comment = comment
				update.save()

				render('save')
			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}
		}else {
			render('Error please complete all fields')
		}
		
	}

}
