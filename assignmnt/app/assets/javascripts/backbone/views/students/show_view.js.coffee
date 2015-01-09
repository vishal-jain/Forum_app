Assignmnt.Views.Students ||= {}

class Assignmnt.Views.Students.ShowView extends Backbone.View
  template: JST["backbone/templates/students/show"]
   
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))
    return this