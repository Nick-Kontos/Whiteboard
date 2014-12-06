import whiteboard.Role
import whiteboard.User
import whiteboard.UserRole
import whiteboard.Course

class BootStrap {

	
	def init = { servletContext ->
		
		def siteManagerRole = new Role(authority: 'ROLE_SITEMANAGER').save(flush: true)
		def studentRole = new Role(authority: 'ROLE_STUDENT').save(flush: true)
		def teacherRole = new Role(authority: 'ROLE_TEACHER').save(flush: true)
		def TARole = new Role(authority: 'ROLE_TA').save(flush: true)

		def siteManager = new User(username: 'admin', password: 'password', email: '123@email.com', firstname: 'John', lastname: 'Smith')
		siteManager.save(flush: true)
		
		def student1 = new User(username: 's1', password: '1', email: 's1@email.com', firstname: 'John', lastname: 'Smith')
		student1.save(flush: true)
		
		def teacher1 = new User(username: 't1', password: '1', email: 't1@email.com', firstname: 'John', lastname: 'Smith')
		teacher1.save(flush: true)
		
		def TA1 = new User(username: 'TA1', password: '1', email: 'ta1@email.com', firstname: 'John', lastname: 'Smith')
		TA1.save(flush: true)

		UserRole.create(siteManager, siteManagerRole, true)
		UserRole.create(student1, studentRole, true)
		UserRole.create(teacher1, teacherRole, true)
		UserRole.create(TA1, TARole, true)
		UserRole.create(TA1, studentRole, true)
		
		def cse308 = new Course(coursename: 'Software Engineering', coursecode: 'CSE308', description: 'BLANK', teacher: teacher1)
		cse308.addToTAs(TA1)
		cse308.addToStudents(student1)
		cse308.save(flush: true)
		
		def generalcourse = new Course(coursename: 'General', coursecode: 'General', description: 'BLANK', teacher: siteManager)
		if(!generalcourse.save(flush:true)){
			println generalcourse.errors
		}
		
		

		/*
		Announcement for each class will be genereated here as a mock data
		*/
		//def announcement = new announcement()
		
	}
	def destroy = {
	}
}
