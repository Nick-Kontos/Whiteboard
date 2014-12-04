package whiteboard

class Submission {
	
	int grade
	String docLink
	String docpath
	Date dateCreated
	static belongsTo = [student:User, course:Course, assignment:Assignment]

	static constraints = {
		grade nullable: true
		
	}

}
