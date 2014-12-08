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
	def sidebar(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(template: '/sidebars/sidebar', model: [sidebarlinks: links, controllertype: 'Announcement', currentUserRole: currentRole])
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

		}else if (getAccountType()=='ROLE_TA'){
			def c = Course.createCriteria()
			result = c.list {
				students{
					idEq(springSecurityService.currentUser.id)
				}
			}
					
		}
		else if (getAccountType()=='ROLE_SITEMANAGER'){
			result = Course.findAllByTeacher(springSecurityService.currentUser)
					
		}

		return result
	}
	
	
	def retrieveTAClasses(){
		
		def result
		def c = Course.createCriteria()
		result = c.list {
			TAs{
				idEq(springSecurityService.currentUser.id)
			}
		}
		return result
	}
	
	
	def getAccountType(){
		def roleList = UserRole.findAllByUser(springSecurityService.currentUser)
		if(roleList.size>1){
			return 'ROLE_TA'
			
		}
		else{
			return roleList.get(0).role.authority
			
		}

	}
	def createLink(){
		//render placeholder
		
		def links = []
		if (getAccountType()=='ROLE_TA'){
			retrieveTAClasses().each {
				links.add(it.coursecode)
				}
			
		}else {
		
			retrieveClasses().each {
			links.add(it.coursecode)
			}
		
		}
		render(template: '/templates/createAnnouncementForm', model: [coursecodes: links, currentUserRole: getAccountType()])
	}
	def courseLink(){
		//render placeholder
		def coursename = params.coursename
		def announcelist = []
		announcelist = Announcement.findAllByCourse(Course.findByCoursecode(coursename))
		
		render(template: '/templates/viewAnnouncements', model: [announcelist: announcelist, currentUserRole: getAccountType()])
	}
	def allLink(){
		//render placeholder
		def announcelist = []
		retrieveClasses().each {
			Announcement.findAllByCourse(it).each{
				announcelist.add(it)
			}	
		}
		//there may be a more efficient way
		if(getAccountType()!='ROLE_SITEMANAGER'){
		(Announcement.findAllByCourse(Course.findByCoursecode('General'))).each{
			announcelist.add(it)
		}		}
		render(template: '/templates/viewAnnouncements', model: [announcelist: announcelist, currentUserRole: getAccountType()])
	}
	def generalLink(){
		//render placeholder
		def announcelist = []
		//there may be a more efficient way
		(Announcement.findAllByCourse(Course.findByCoursecode('General'))).each{
			announcelist.add(it)
		}
		render(template: '/templates/viewAnnouncements', model: [announcelist: announcelist, currentUserRole: getAccountType()])
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
				newAnnouncement.course = Course.findByCoursecode(params.InputCourse)
				newAnnouncement.save(failOnError: true)
				redirect controller: 'announcement', action: 'allLink'
				//newAnnouncement.delete();
				
			}catch (Exception e){
				//This need to be completed to handle various errors for adding to the database
				render(e.message)
			}
		}else {
			render('error please fill  in all fields')
		}
	}
	def editAnnouncement(){
		
		
		def deleteAnnouncementa = Announcement.findByTitle(params.announcementno)
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		render(template: '/templates/editAnnouncement', model: [text:deleteAnnouncementa.text,title:deleteAnnouncementa.title,coursecodes: links, currentUserRole: getAccountType()])
		
		deleteAnnouncementa.delete()
	}
	
	def deleteAnnouncement(){
		
		def deleteAnnouncementa = Announcement.findByTitle(params.announcementno)
		deleteAnnouncementa.delete()
		
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Announcement', currentUserRole: currentRole])
	}
}