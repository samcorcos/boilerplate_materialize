Template.login.helpers
  creatingAccount: -> Session.get "creatingAccount"

Template.login.events
  'click #loginForm': -> Session.set 'creatingAccount', false
  'click #accountForm': -> Session.set 'creatingAccount', true

  'click #createAccount': (e,t) ->
    Session.set 'creatingAccount', false
    Accounts.createUser
      password: t.find('#password').value
      email: t.find('#email').value
      profile:
        name: t.find('#name').value

  'click #logout': -> Meteor.logout()
  'click #login': (e,t) ->
    Meteor.loginWithPassword t.find('#email').value, t.find('#password').value, (err) ->
      $('#password').val("")
      if err then alert("Incorrect email/password")

Template._newAccountForm.events
  'keypress #password': (e,t) ->
    if e.keyCode is 13
      Session.set 'creatingAccount', false
      Accounts.createUser
      password: t.find('#password').value
      email: t.find('#email').value
      profile:
        name: t.find('#name').value

Template._loginForm.events
  'keypress #password': (e,t) ->
    if e.keyCode is 13
      Meteor.loginWithPassword t.find('#email').value, t.find('#password').value, (err) ->
        $('#password').val("")
        if err then alert("Incorrect email/password")
