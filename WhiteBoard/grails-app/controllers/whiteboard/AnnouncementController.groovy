package whiteboard

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.*
import liquibase.util.csv.CSVReader

class AnnouncementController {

	def springSecurityService

	def index() {
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Announcement', currentUserRole: currentRole])
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
		def announcelist = Announcement.findByCourseList(retrieveClasses())
		render(template: '/templates/createAnnouncementForm', model: [announcelist: announcelist])
	}
	def courseLink(){
		//render placeholder
		def coursename = params.coursename
		if(coursename)
			render(coursename)
		//return coursename
		else
			render('error')
	}
	def allLink(){
		//render placeholder
		
		render(template: '/templates/viewAnnouncements')
	}
	def generalLink(){
		//render placeholder
		render(template: '/templates/viewAnnouncements')
	}
	def createAnnouncement(){
		//option 1 parse through inputstream
		def file = params.fileUpload
		//file.inputStream
		//doc for inputstream is at http://groovy.codehaus.org/groovy-jdk/java/io/InputStream.html

		//option 2 parse through using csv reader
		//file.transferTo(new File('newFile.csv'))
		//def csv = new CSVReader(new File('newFile.csv').newReader())
		//doc for csv reader is at http://www.liquibase.org/javadoc/liquibase/util/csv/opencsv/CSVReader.html

		//first check if all parameters are not null
		if(params.InputCourse && params.InputTitle && params.InputText){
			try{
				def newAnnouncement = new Announcement(title: params.InputTitle, text: params.InputText, creator: springSecurityService.currentUser)
				if(params.InputVisable){
					newAnnouncement.viewable = true
				}else{
					newAnnouncement.viewable = false
				}
				newAnnouncement.addTo(Course.findByCoursecode(params.InputCourse))
				newAnnouncement.save(failOnError: true)
				render('Successfully created ')
			}catch (Exception e){
				//This need to be completed to handle various errors for adding to the database
				render(e.message)
			}
		}else {
			render('error please fill  in all fields')
		}
	}
}
