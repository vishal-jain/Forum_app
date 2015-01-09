class Assignmnt.Models.Student extends Backbone.Model
  paramRoot: 'student'

  defaults:
    name: null
    address: null
  
class Assignmnt.Collections.StudentsCollection extends Backbone.Collection
  model: Assignmnt.Models.Student
  url: '/students'