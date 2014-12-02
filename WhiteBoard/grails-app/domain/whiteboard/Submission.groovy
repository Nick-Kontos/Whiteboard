package whiteboard

class Submission {
	
	int grade
	String docLink
	static belongsTo = [student:User, course:Course, assignment:Assignment]

	static constraints = {
		grade nullable: true
		
	}

}
