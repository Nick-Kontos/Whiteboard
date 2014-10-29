package whiteboard

class Assignment {
	
	String title
	String text
	String docLink
	Date dueDate
	int totalpoints
	boolean viewable
	static belongsTo = [course:Course]

    static constraints = {
    }
}
