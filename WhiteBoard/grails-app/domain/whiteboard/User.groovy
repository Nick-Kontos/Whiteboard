package whiteboard

class User {

   transient springSecurityService

   String username
   String password
   String email
   String firstname
   String lastname
   boolean enabled = true
   boolean accountExpired
   boolean accountLocked
   boolean passwordExpired

   static constraints = {
      username blank: false, unique: true
      password blank: false
	  email unique: true
   }

   static mapping = {
      password column: '`password`'
   }

   Set<Role> getAuthorities() {
      UserRole.findAllByUser(this).collect { it.role } as Set
   }

   def beforeInsert() {
      encodePassword()
   }

   def beforeUpdate() {
      if (isDirty('password')) {
         encodePassword()
      }
   }

   protected void encodePassword() {
      password = springSecurityService.encodePassword(password)
   }
}
