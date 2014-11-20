package whiteboard

class Announcement {
	
	String title
	String text
	String doclink
	User creator
	Boolean viewable
	static belongsTo = [course:Course]
	
	static constraints = {
		doclink nullable: true
	}
}
