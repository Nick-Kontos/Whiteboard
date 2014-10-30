import whiteboard.Role
import whiteboard.User
import whiteboard.UserRole

class BootStrap {

	
	def init = { servletContext ->
		
		def siteManagerRole = new Role(authority: 'ROLE_SITEMANAGER').save(flush: true)
		def studentRole = new Role(authority: 'ROLE_STUDENT').save(flush: true)
		def teacherRole = new Role(authority: 'ROLE_TEACHER').save(flush: true)
		def TARole = new Role(authority: 'ROLE_TA').save(flush: true)

		def siteManager = new User(username: 'admin', password: 'password', email: '123@email.com', firstname: 'John', lastname: 'Smith')
		siteManager.save(failOnError: true)

		UserRole.create(siteManager, siteManagerRole, true)

		assert User.count() == 1
		assert Role.count() == 4
		assert UserRole.count() == 1
	}
	def destroy = {
	}
}
