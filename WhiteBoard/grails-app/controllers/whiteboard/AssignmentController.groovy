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
		render(template: '/templates/createAssignmentForm')
	}
	def courseLink(){
		def coursename = params.coursename
		if(coursename)
			render('Assignment for ' + coursename)
		else
			render('error')
	}
	def allLink(){
		render(template: '/templates/viewAssignments')
	}
	def createAssignment(){
		//option 1 parse through inputstream
		def file = params.fileUpload
		//file.inputStream
		//doc for inputstream is at http://groovy.codehaus.org/groovy-jdk/java/io/InputStream.html

		//option 2 parse through using csv reader
		//file.transferTo(new File('newFile.csv'))
		//def csv = new CSVReader(new File('newFile.csv').newReader())
		//doc for csv reader is at http://www.liquibase.org/javadoc/liquibase/util/csv/opencsv/CSVReader.html

		//first check if all parameters are not null
		if(params.InputCourse && params.InputTitle && params.InputDescription && params.InputPointsWorth && params.InputDueDate){
			try{
				def newAssign = new Assignment(title: params.InputTitle, text: params.InputDescription, datedue: params.InputDueDate, totalpoints: params.InputPointsWorth)
				if(params.InputVisable){
					newAssign.viewable = true
				}else{
					newAssign.viewable = false
				}
				newAssign.addTo(Course.findByCoursecode(params.InputCourse))
				newAssign.save(failOnError: true)
				render('Successfully created ')
			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}
		}else {
			render('Error please complete all fields')
		}
	}
}
