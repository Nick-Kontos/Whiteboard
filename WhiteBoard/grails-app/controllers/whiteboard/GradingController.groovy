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
		render(template: '/templates/viewSubmission', model: [assignlist: assignlist, currentUserRole: getAccountType()])		
		//I am fixing here now try to render all the sub
		//render('All Gradesss')
	}

	def saveAssignment(){
		def file = params.FileUpload
		//file uploading has to be implemented here

		//If the due date is correct save it to submission domain


			try{
				//Submission domain needs docLink and each primary key of student, course, and assignment so that everything can be connected to each other				
				def newSub = new Submission(docLink:file.originalFilename, student: params.StudentId[1], course: params.CourseId, assignment: params.AssignmentId)
				//print newSub
				//newAssign.doclink = file.originalFilename
				           		
           		//response.setContentType("APPLICATION/OCTET-STREAM")
            	//response.setHeader("Content-Disposition", "Attachment;Filename=\"${it.doclink}\"")				
				
				//newAssign.course = Course.findByCoursecode(params.InputCourse)
				newSub.save(failOnError: true)
				render("saved")
				//redirect(view: '/default')
			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}	
	}




}
