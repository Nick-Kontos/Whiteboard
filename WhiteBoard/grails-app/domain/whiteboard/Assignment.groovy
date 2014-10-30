package whiteboard

class Assignment {
	
	String title
	String text
	String docLink
	Date datedue
	Date lastsubmission
	int totalpoints
	boolean viewable
	static belongsTo = [course:Course]

}
