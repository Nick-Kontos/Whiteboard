package whiteboard

class GradingController {

	def springSecurityService
	def exportService

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

		render template: '/templates/viewAssignmentSubmissions', model: [submissionList: submissionList, currentUserRole: getAccountType(), assignmentId: params.assignmentId]
	}

	def downloadAssignment(){
		def coursename = params.coursename
		def assignlist = []
		assignlist = Assignment.findAllByCourse(Course.findByCoursecode(coursename))
		String fileString
		fileString = "Title, Date due, Max, Min, Avg, Med,\n"
		assignlist.each{
			fileString += it.title + ", "
			fileString += it.datedue.getDateTimeString() + ", "
			fileString += it.max + ", "
			fileString += it.min + ", "
			fileString += it.avg + ", "
			fileString += it.med + "\n"
		}
		
		File file = File.createTempFile("GradeReport",".txt")
		file.write(fileString)
		response.setHeader "Content-disposition", "attachment; filename=${file.name}.txt"
		response.contentType = 'APPLICATION/OCTET-STREAM'
		response.outputStream << file.text
		response.outputStream.flush()
	}

	def downloadSubmission(){
		def assignmentId = params.assignmentId
		def submissionList = []
		submissionList = Submission.findAllByAssignment(Assignment.findById(assignmentId))
		String fileString
		fileString = "First Name, Last Name, Date Submitted, Grade,\n"
		print submissionList
		print assignmentId
		submissionList.each{
			fileString += it.student.firstname + ", "
			fileString += it.student.lastname + ", "
			fileString += it.dateCreated.getDateTimeString() + ", "
			fileString += it.grade + "\n"
		}
		File file = File.createTempFile("GradeReport",".txt")
		file.write(fileString)
		response.setHeader "Content-disposition", "attachment; filename=${file.name}.txt"
		response.contentType = 'APPLICATION/OCTET-STREAM'
		response.outputStream << file.text
		response.outputStream.flush()
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
		def file = request.getFile('FileUpload')
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
				
					//Submission domain needs docLink and each primary key of student, course, and assignment so that everything can be connected to each other
					def newSub = new Submission(doclink:file.originalFilename, docname:fileNameOrdered, student: springSecurityService.currentUser.id, course: params.CourseId, assignment: params.AssignmentId)

					newSub.docpath = grailsApplication.config.uploadFolder + newSub.doclink
					file.transferTo(new File(newSub.docpath))

					newSub.save(failOnError: true)
					render("saved")
					//redirect(view: '/default')

				
				if(changedDateDueType < now){
					sendMail {
						to Course.findById(params.CourseId).teacher.email
						subject "Warning - Late Submission"
						body 'Submission for ' + Assignment.findById(params.AssignmentId).title + " has been submitted late for student " + springSecurityService.currentUser.firstname + " " + springSecurityService.currentUser.lastname
					}
					render("Your submission is late!")
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
