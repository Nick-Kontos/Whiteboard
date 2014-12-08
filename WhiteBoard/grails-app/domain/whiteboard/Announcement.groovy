package whiteboard

class Announcement {
	
	String title
	String text
	String docname
	String docpath
	String doclink
	Date dateCreated
	User creator
	Boolean viewable
	static belongsTo = [course:Course]
	
	static constraints = {
		doclink nullable: true
		docname nullable: true
		docpath nullable: true
	}
}
