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
			result = Course.findAllByTeacher(springSecurityService.currentUser)
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
			Assignment.findAllByCourse(it).each{ assignlist.add(it) }
		}
		render(template: '/templates/viewAssignments', model: [assignlist: assignlist, currentUserRole: getAccountType()])
	}
	def createAssignment(){
		//option 1 parse through inputstream
		//def file = params.FileUpload
		//def file = params.FileUpload
		print springSecurityService.currentUser
		//print file1
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

				def newAssign = new Assignment(title: params.InputTitle, text: params.InputDescription, datedue: params.InputDueDate, totalpoints: params.InputPointsWorth, creator: springSecurityService.currentUser)
				//newAssign.doclink = file.originalFilename

				//response.setContentType("APPLICATION/OCTET-STREAM")
				//response.setHeader("Content-Disposition", "Attachment;Filename=\"${it.doclink}\"")

				def file
				if(params.FileUpload)
					file = request.getFile('FileUpload')
				//submission,assignmentTitle
				if(!file.empty){
					newAssign.doclink = file.originalFilename
					newAssign.docpath = grailsApplication.config.uploadFolder + newAssign.doclink
					file.transferTo(new File(newAssign.docpath))
				}
				if(params.InputVisable){
					newAssign.viewable = true
				}else{
					newAssign.viewable = false
				}
				newAssign.course = Course.findByCoursecode(params.InputCourse)
				newAssign.save(failOnError: true)
				//redirect controller: 'assignment', action: 'allLink'
				render(template: '/templates/viewSubAssignment',model: [course:params.InputCourse, title: params.InputTitle, point: params.InputPointsWorth, text: params.InputDescription])

			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}
		}else {
			render('Error please complete all fields')
		}
	}
	def returnAssignment(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()

		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Assignment', currentUserRole: currentRole])
	}
	def download(long id){

		Assignment newAssign = Assignment.get(id)
		if( newAssign == null){
			flash.message = "Document Not Found"
			//redirect 1
		}
		else{
			response.setContentType("APPLICATION/OCTET-STREAM")
			response.setHeader("Content-Disposition", "Attachment;Filename=\"${newAssign.doclink}\"")

			def file = new File(newAssign.docpath)
			def fileInputStream = new FileInputStream(file)
			def outputStream = response.getOutputStream()

			byte[] buffer = new byte[4096];
			int len;
			while ((len = fileInputStream.read(buffer)) > 0) {
				outputStream.write(buffer, 0, len);
			}

			outputStream.flush()
			outputStream.close()
			fileInputStream.close()

		}

	}
	def editAssignment(){

		def deleteAssignment = Assignment.findById(params.assignmentno)
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		render(template: '/templates/editAssignment', model: [text:deleteAssignment.text,point: deleteAssignment.totalpoints, title:deleteAssignment.title,coursecodes: links, currentUserRole: getAccountType()])

		deleteAssignment.delete()

	}

	def deleteAssignment(){

		def deleteAssignment = Assignment.findById(params.assignmentno)

		deleteAssignment.delete()


		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()

		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Assignment', currentUserRole: currentRole])



	}

}