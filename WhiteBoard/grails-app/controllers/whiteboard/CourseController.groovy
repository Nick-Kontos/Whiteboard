package whiteboard

class CourseController {

	def springSecurityService

	def index() {
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Course', currentUserRole: currentRole])
	}

	def sidebar(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(template: '/sidebars/sidebar', model: [sidebarlinks: links, controllertype: 'Course', currentUserRole: currentRole])
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
		//render placeholder
		render(template: '/templates/createCourseForm')
	}
	def courseLink(){
		//render placeholder
		def coursename = params.coursename
		if(coursename)
			render('Course view for' + coursename)

		else
			render('error')
	}
	def searchLink(){
		//render placeholder
		render('Search all courses')
	}

	def viewCourses(){
		render template: '/templates/viewCourses', model: [courseList: Course.all]
	}

	def createCourse(){
		if(params.InputCourseCode && params.InputCourseName && params.InputDescription && params.InputInstructor){
			if(Course.findByCoursecode(params.InputCourseCode) == null){
				if(User.findByUsername(params.InputInstructor) == null){
					render "Teacher does not exist"
				}
				else{
					/* Course code is unique and teacher exists */

					def file = request.getFile('fileUpload')
					if(!file.empty){
						try{
							def newCourse = new Course(coursename: params.InputCourseName, coursecode: params.InputCourseCode, description: params.InputDescription, teacher: User.findByUsername(params.InputInstructor))
							file.getInputStream().eachLine{line ->
								if(line != null){
									def lineList = line.tokenize(",")
									if((User.findByUsername(lineList.get(0))) == null){
										def newStudent = new User(username: lineList.get(0), password: "password", email: lineList.get(3), firstname: lineList.get(2), lastname: lineList.get(1))
										newStudent.save(failOnError: true)
										UserRole.create(newStudent, Role.findByAuthority('ROLE_STUDENT'), true)
										newCourse.addToStudents(newStudent)
										newCourse.save(failOnError:true)
									}
									else{
										def s = User.findByUsername(lineList.get(0))
										newCourse.addToStudents(s)
										newCourse.save(failOnError:true)
									}
								}
							}
							redirect controller: 'course', action: 'viewCourses'
						}catch(Exception e){
							render "Creating course without file did not succeed"
						}
					}else{
						/* file is empty */
						try{
							def newCourse = new Course(coursename: params.InputCourseName, coursecode: params.InputCourseCode, description: params.InputDescription, teacher: User.findByUsername(params.InputInstructor))
							params.InputRoster.tokenize(',').each {
								try{
									def s = User.findByUsername(it)
									newCourse.addToStudents(s)
								}catch(Exception e){
									render " User " + it.toString() + " does not exist " + "</br>"
								}
							}
							newCourse.save(failOnError: true)
							redirect controller: 'course', action: 'viewCourses'
						}catch(Exception e){
							render "Creating course with text box failed"
						}
					}
				}
			} /* course does not exist */
			else{
				render "Course already exists."
			}
		} /* All fields complete */
		else{
			render('Input incomplete. Please complete all fields')
		}
	}
	def appointTA(){

		//render placeholder
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}

		render(template: '/templates/appointTaForm', model: [coursecodes: links, currentUserRole: getAccountType()])
	}
	def appointTa2(){
		if(params.InputCourse &&params.InputRoster){
			params.InputRoster.tokenize(',').each {
				def s = User.findByUsername(it)
				def coursename = params.InputCourse
				def student
				def newUserRole
				newUserRole = Role.findByAuthority('ROLE_TA')
				UserRole.create(s, newUserRole, true)
				student = Course.findByCoursecode(coursename)
				student.addToTAs(s)
				student.save(flush:true)
			}


			render('Appointed the TA')
		}
	}
}


//option 1 parse through inputstream
//print params.fileUpload
/*
 def file = params.fileUpload //CommonsMultipartFile
 if(file != null){
 print file.getInputStream().eachLine{line ->
 print line
 if(line != null){
 def lineList = line.tokenize(",")
 if(User.findByUsername(lineList.get(0)) == null){
 def newStudent = new User(username: lineList.get(0), password: "password", email: lineList.get(3), firstname: lineList.get(2), lastname: lineList.get(1))
 try{
 newStudent.save(failOnError: true)
 UserRole.create(newStudent, Role.findByAuthority('ROLE_STUDENT'), true)
 }catch(Exception e){
 render "Could not create student account."
 }
 }
 }
 }
 }
 */
//if(params.InputCourseCode && params.InputCourseName && params.InputDescription && params.InputInstructor && params.InputRoster){

/*
 params.InputRoster.tokenize(',').each {
 def s = User.findByUsername(it)
 newCourse.addToStudents(s)
 }
 newCourse.save(failOnError: true)
 render('Successfully created ')
 }catch(Exception e){
 //This needs to be filled in
 render(e.message)
 }
 file.getInputStream().eachLine{line ->
 print line
 if(line != null){
 def lineList = line.tokenize(",")
 if(User.findByUsername(lineList.get(0)) == null){
 def newStudent = new User(username: lineList.get(0), password: "password", email: lineList.get(3), firstname: lineList.get(2), lastname: lineList.get(1))
 try{
 newStudent.save(failOnError: true)
 UserRole.create(newStudent, Role.findByAuthority('ROLE_STUDENT'), true)
 }catch(Exception e){
 render "Could not create student account."
 }
 }
 }
 }
 */
