package whiteboard

class Submission {
	
	Integer grade
	String docLink
	String docpath
	Date dateCreated
	String comment
	static belongsTo = [student:User, course:Course, assignment:Assignment]

	static constraints = {
		grade nullable: true
		comment nullable: true
	}

}
