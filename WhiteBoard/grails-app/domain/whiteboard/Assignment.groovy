package whiteboard

class Assignment {
	
	String title
	String text
	String docLink
	int totalpoints
	boolean viewable
	static belongsTo = [course:Course]

    static constraints = {
    }
}
