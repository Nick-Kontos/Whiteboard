package whiteboard

class Submission {
	
	Integer grade
	String docname
	String doclink
	String docpath
	Date dateCreated
	String comment
	static belongsTo = [student:User, course:Course, assignment:Assignment]

	static constraints = {
		grade nullable: true
		comment nullable: true
	}

}
