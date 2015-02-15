Meteor.startup ->

  # Seeding with admin account
  if Meteor.users.find().count() is 0
    Accounts.createUser
      username: 'admin'
      password: 'adminpassword'
      profile:
        roles: ['admin']
