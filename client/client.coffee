Template.registerHelper "isAdmin", ->
  if Meteor.user()?.profile.roles.indexOf("admin") > -1 then true else false

Template.registerHelper "userEmail", ->
  if Meteor.user()? then Meteor.user().emails[0].address
