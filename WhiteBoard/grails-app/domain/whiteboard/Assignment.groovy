package whiteboard

class Assignment {
	
	String title
	String text
	String doclink
	Date datedue
	int totalpoints
	boolean viewable
	static belongsTo = [course:Course]
	
	static constraints = {
		doclink blank: true
	}

}
