package whiteboard

class GradeController {

	def springSecurityService

	def index() {
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(view: '/default', model: [sidebarlinks: links, controllertype: 'Grade', currentUserRole: currentRole])
	}
	
	def sidebar(){
		def links = []
		retrieveClasses().each {
			links.add(it.coursecode)
		}
		def currentRole = getAccountType()
		render(template: '/sidebars/sidebar', model: [sidebarlinks: links, controllertype: 'Grade', currentUserRole: currentRole])
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

		def assignlist = []
		assignlist = Submission.findAllByCourse(Course.findByCoursecode(coursename))
		render(template: '/templates/viewGrades', model: [assignlist: assignlist, currentUserRole: getAccountType()])
	}
	def allLink(){
		def assignlist = []
		retrieveClasses().each {
			Submission.findAllByCourse(it).each{
				assignlist.add(it)
			}		
		}
		render(template: '/templates/viewGrades', model: [assignlist: assignlist, currentUserRole: getAccountType()])
	}
	def saveGrades(){

		def grades = params.int('InputGrades')
		print grades
		//def comment = params.InputComment
		def id = params.SubmissionId
		print id
	
		if(params.InputGrades ){

			try{

				def update = Submission.get(id)
				print update
				update.grade = grades
				//update.comment = comment
				update.save()

				render('save')
			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}
		}else {
			render('Error please complete all fields')
		}
		
	}
	def saveComments(){

		
		def comment = params.InputComment
		def id = params.SubmissionId

		print id
		if(params.InputGrades ){

			try{

				def update = Submission.get(id)
				
				update.comment = comment
				update.save()

				render('save')
			}catch(Exception e){
				//this need to be completed to handle different errors
				render(e.message)
			}
		}else {
			render('Error please complete all fields')
		}
		
	}


	def finalizeGrade(){
		def finalize = params.FinalizeGrades
		def id = params.AssignmentId


		//Get Average
		def query = Submission.where {
			assignment.id == id
		}.projections{
				avg('grade')
			}		
		def avgResults = query.find()
		//Get Max
		def query2 = Submission.where {
			assignment.id == id
		}.projections{
				max('grade')
			} 		
		def maxResults = query2.find()
		//Get Min
		def query3 = Submission.where {
			assignment.id == id
		}.projections{
				min('grade')
			} 		
		def minResults = query3.find()
		

		if(params.FinalizeGrades){
		try{

			def update = Assignment.get(id)
			update.gradeCompleted = true
			update.avg = avgResults
			update.max = maxResults
			update.min = minResults
			update.save()

			render('save')

		}catch(Exception e){

			render(e.message)

		}
	}else{
		render('Error')
		}

	}
}