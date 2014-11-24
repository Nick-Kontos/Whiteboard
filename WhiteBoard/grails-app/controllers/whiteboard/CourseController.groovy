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
	def createCourse(){
		//option 1 parse through inputstream
		def file = params.fileUpload
		//file.inputStream
		//doc for inputstream is at http://groovy.codehaus.org/groovy-jdk/java/io/InputStream.html

		//option 2 parse through using csv reader
		//file.transferTo(new File('newFile.csv'))
		//def csv = new CSVReader(new File('newFile.csv').newReader())
		//doc for csv reader is at http://www.liquibase.org/javadoc/liquibase/util/csv/opencsv/CSVReader.html

		if(params.InputCourseCode && params.InputCourseName && params.InputDescription && params.InputInstructor && params.InputRoster){
			try{
				def newCourse = new Course(coursename: params.InputCourseName, coursecode: params.InputCourseCode, description: params.InputDescription, teacher: User.findByUsername(params.InputInstructor))
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
		}else{
			render('Input incomplete please complete all fields')
		}

	}
}
