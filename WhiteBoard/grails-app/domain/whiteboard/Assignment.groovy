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
	static belongsTo = [course:Course]
	
	static constraints = {
		doclink nullable: true
		docpath nullable: true
	}

}
