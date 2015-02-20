dropdownInit = ->
  $('.dropdown-button').dropdown
    inDuration: 300
    outDuration: 225
    constrain_width: false
    hover: false

Template.navbar.rendered = ->
  $(".button-collapse").sideNav()
  dropdownInit()

Template.navbar.events
  'click #at-signUp': (e,t) ->
    e.stopPropagation()

  'click input': (e,t) ->
    e.stopPropagation()

  'click label': (e,t) ->
    e.stopPropagation()

  'click #at-signIn': (e,t) ->
    e.stopPropagation()

  'click #logout-button': (e,t) ->
    Meteor.logout()
    Meteor.setTimeout -> # TODO this is a hack around an async issue
      dropdownInit()
    , 250
