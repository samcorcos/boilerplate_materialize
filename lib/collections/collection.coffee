@Collection = new Mongo.Collection 'collection'

if Meteor.isServer
  Meteor.publish 'collection', -> 
    Collection.find()

  Collection.allow
    insert: (userid, doc) ->
      true

    update: (userId, docs, fields, modifier) ->
      true

    remove: (userId, docs) ->
      true

  Collection.deny
    insert: (userId, doc) ->

    update: (userId, docs, fields, modifier) ->

    remove: (userId, docs) ->


if Meteor.isClient
  Meteor.subscribe 'collection'
