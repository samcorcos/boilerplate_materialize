Template.registerHelper "isAdmin", ->
  if Meteor.user()?.profile.roles.indexOf("admin") > -1 then true else false
