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
		
		def coursename = params.coursename
		def assignlist = []
		assignlist = Submission.findAllByCourse(Course.findByCoursecode(coursename))
		render(template: '/templates/viewSubmission', model: [assignlist: assignlist, currentUserRole: getAccountType()])			
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
		def file = request.getFile('FileUpload')
		def dateDue = params.DateDue
		Date now = new Date()
		//change dateDue type from String to Date
		def changedDateDueType = Date.parse("yyyy-MM-dd hh:mm:ss.s", dateDue)
		
			try{
				if(file.empty){
					flash.message = "File cannot be empty"
				}
				else{
					if(changedDateDueType > now){
						//Submission domain needs docLink and each primary key of student, course, and assignment so that everything can be connected to each other				
						def newSub = new Submission(docLink:file.originalFilename, student: params.StudentId[1], course: params.CourseId, assignment: params.AssignmentId)

		            	newSub.docpath = grailsApplication.config.uploadFolder + newSub.docLink
		            	file.transferTo(new File(newSub.docpath))	

						newSub.save(failOnError: true)
						render("saved")
						//redirect(view: '/default')						

					}
					else{
						//sendMail {     
						//		  to "ben-jun@hotmail.com"     
						//		  subject "Hello Fred"     
						//		  body 'How are you?' 
						//		 }
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
