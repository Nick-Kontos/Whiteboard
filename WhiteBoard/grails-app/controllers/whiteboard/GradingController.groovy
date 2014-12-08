package whiteboard

class GradingController {

	def springSecurityService

	def index() {
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Grading', currentUserRole: currentRole])
	}

	def sidebar(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(template: '/sidebars/sidebar', model: [sidebarlinks: links, controllertype: 'Grading', currentUserRole: currentRole])
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
		Date d = new Date()
		def assignlist = []
		assignlist = Assignment.findAllByCourse(Course.findByCoursecode(coursename))
		render(template: '/templates/viewSubmission', model: [assignlist: assignlist, currentUserRole: getAccountType(), currentDateTime: d, coursecode: coursename])
	}

	def assignmentGrades(){
		def submissionList = Submission.findAllByAssignment(Assignment.findById(params.assignmentId))

		render template: '/templates/viewAssignmentSubmissions', model: [submissionList: submissionList, currentUserRole: getAccountType()]
	}
	
	def downloadAssignment(){
		def coursename = params.coursename
	}
	
	def downloadSubmission(){
		
	}

	def allLink(){
		def assignlist = []
		retrieveClasses().each {
			Submission.findAllByCourse(it).each{ assignlist.add(it) }
		}
		render(template: '/templates/viewSubmission', model: [assignlist: assignlist, currentUserRole: getAccountType()])
		//I am fixing here now try to render all the sub
		//render('All Gradesss')
	}

	def saveAssignment(){
		def file = request.getFile(params.FileUpload)
		def dateDue = params.DateDue
		Date now = new Date()
		print springSecurityService.currentUser.id
		//def student = params.StudentId
		//print student
		//change dateDue type from String to Date
		def changedDateDueType = Date.parse("yyyy-MM-dd hh:mm:ss.s", dateDue)

		def fileNameOrdered = springSecurityService.currentUser.id + "_" + springSecurityService.currentUser.firstname + "_" + springSecurityService.currentUser.lastname + "_" + params.CourseCode + "_" + params.AssignmentName + "_" + file.originalFilename
		//print fileNameOrdered
		try{
			if(file.empty){
				flash.message = "File cannot be empty"
			}
			else{
				if(changedDateDueType > now){
					//Submission domain needs docLink and each primary key of student, course, and assignment so that everything can be connected to each other
					def newSub = new Submission(doclink:file.originalFilename, docname:fileNameOrdered, student: springSecurityService.currentUser.id, course: params.CourseId, assignment: params.AssignmentId)

					newSub.docpath = grailsApplication.config.uploadFolder + newSub.docLink
					file.transferTo(new File(newSub.docpath))

					newSub.save(failOnError: true)
					render("saved")
					//redirect(view: '/default')

				}
				else{
					sendMail {
						to "ben-jun@hotmail.com"
						subject "Hello Fred"
						body 'How are you?'
					}
					render("failed cuz of due date is late and mail has been sent")
				}

			}
		}catch(Exception e){
			//this need to be completed to handle different errors
			render(e.message)
		}
	}
	def download(long id){

		Submission newSub = Submission.get(id)
		//print newSub
		if( newSub == null){
			flash.message = "Document Not Found"
			//redirect
		}
		else{
			response.setContentType("APPLICATION/OCTET-STREAM")
			response.setHeader("Content-Disposition", "Attachment;Filename=\"${newSub.docLink}\"")

			def file = new File(newSub.docpath)
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




}
