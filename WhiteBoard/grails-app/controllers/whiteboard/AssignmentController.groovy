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
	
	def sidebar(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(template: '/sidebars/sidebar', model: [sidebarlinks: links, controllertype: 'Assignment', currentUserRole: currentRole])
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
			result = Course.findByTeacher(springSecurityService.currentUser)
		}
		return result
	}
	def getAccountType(){
		UserRole.findAllByUser(springSecurityService.currentUser).get(0).role.authority
	}
	def createLink(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		render(template: '/templates/createAssignmentForm', model: [coursecodes: links, currentUserRole: getAccountType()])
	}
	def courseLink(){
		def coursename = params.coursename
		def assignlist = []
		assignlist = Assignment.findAllByCourse(Course.findByCoursecode(coursename))
		render(template: '/templates/viewAssignments', model: [assignlist: assignlist, currentUserRole: getAccountType()])
	}
	def allLink(){
		def assignlist = []
		retrieveClasses().each {
			Assignment.findAllByCourse(it).each{
				assignlist.add(it)
			}		
		}
		render(template: '/templates/viewAssignments', model: [assignlist: assignlist, currentUserRole: getAccountType()])
	}
	def createAssignment(){
		//option 1 parse through inputstream
		//def file = params.FileUpload
		def file = params.FileUpload

		//print file
		//file.inputStream
		//doc for inputstream is at http://groovy.codehaus.org/groovy-jdk/java/io/InputStream.html

		//option 2 parse through using csv reader
		//file.transferTo(new File('newFile.csv'))
		//def csv = new CSVReader(new File('newFile.csv').newReader())
		//doc for csv reader is at http://www.liquibase.org/javadoc/liquibase/util/csv/opencsv/CSVReader.html

		//first check if all parameters are not null


		if(params.InputCourse && params.InputTitle && params.InputDescription && params.InputPointsWorth && params.InputDueDate){
			try{
				
				def newAssign = new Assignment(title: params.InputTitle, text: params.InputDescription, datedue: params.InputDueDate, totalpoints: params.InputPointsWorth, creator: springSecurityService.currentUser, doclink:file.originalFilename)
				//newAssign.doclink = file.originalFilename

				if(params.InputVisable){
					newAssign.viewable = true
				}else{
					newAssign.viewable = false
				}
				newAssign.course = Course.findByCoursecode(params.InputCourse)
				newAssign.save(failOnError: true)
				redirect(view: 'default')
			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}
		}else {
			render('Error please complete all fields')
		}
	}
}
