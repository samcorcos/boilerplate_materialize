if !(typeof MochaWeb == 'undefined')
  MochaWeb.testOnly ->

    describe 'Server', ->
      it 'should have a Meteor version defined', ->
        chai.assert Meteor.release
        return
      return

    return # return for MochaWeb
