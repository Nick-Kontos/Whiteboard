package whiteboard

class Course {
	
	String coursename
	String coursecode
	String description
	User teacher
	static hasMany = [TAs:User, students:User]
	
    static constraints = {
		teacher blank: false
		coursename blank: false
		coursecode blank: false		
    }
}
