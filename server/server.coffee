Meteor.startup ->
  # read environment variables from Meteor.settings
  if Meteor.settings and Meteor.settings.env and _.isObject(Meteor.settings.env)
    for variableName of Meteor.settings.env
      process.env[variableName] = Meteor.settings.env[variableName]
  return
