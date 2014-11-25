package whiteboard

class Announcement {
	
	String title
	String text
	String doclink
	Date dateCreated
	User creator
	Boolean viewable
	static belongsTo = [course:Course]
	
	static constraints = {
		doclink nullable: true
	}
}
