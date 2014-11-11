package whiteboard

class AssignmentController {

    def index() { 
		def links = ["All", "General"]
		links.add("Course")
		render(view: '/default', model: [sidebarlinks: links])
	}
	
}
