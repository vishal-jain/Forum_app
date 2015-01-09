Assignmnt.Views.Students ||= {}

class Assignmnt.Views.Students.IndexView extends Backbone.View
  template: JST["backbone/templates/students/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');
    
    @options.students.bind('reset', this.addAll);
   
  addAll: () ->
    @options.students.each(this.addOne)
  
  addOne: (student) ->
    view = new Assignmnt.Views.Students.StudentView({model : student})
    this.$("tbody").append(view.render().el)
       
  render: ->
    $(this.el).html(this.template(students: this.options.students.toJSON() ))
    @addAll()
    
    return this