package whiteboard

class Assignment {
	
	String title
	String text
	String doclink
	String docpath
	Date dateCreated
	Date datedue
	User creator
	int totalpoints
	boolean viewable
	boolean gradeCompleted
	Integer max
	Integer min
	Integer avg
	Integer med
	static belongsTo = [course:Course]
	
	static constraints = {
		max nullable: true
		min nullable: true
		avg nullable: true
		med nullable: true
		gradeCompleted default: false
		doclink nullable: true
		docpath nullable: true
	}

}
