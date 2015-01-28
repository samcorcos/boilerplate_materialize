Meteor.startup ->
  if Meteor.users.find().count() is 0
    Accounts.createUser
      username: "admin"
      password: "adminpassword"

    Meteor.users.update
      username: "admin"
    ,
      $set:
        roles: ["admin"]
