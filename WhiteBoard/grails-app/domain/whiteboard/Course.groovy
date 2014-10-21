package whiteboard

class Course {
	
	String name
	String description
	User teacher
	static hasMany = [TAs:User, students:User]
	
    static constraints = {
		teacher(blank: false)
		name(blank: false)
		
		//must add student and teacher restraints to ensure proper roles
    }
}
