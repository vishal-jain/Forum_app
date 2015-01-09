Assignmnt.Views.Students ||= {}

class Assignmnt.Views.Students.StudentView extends Backbone.View
  template: JST["backbone/templates/students/student"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @options.model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))    
    return this