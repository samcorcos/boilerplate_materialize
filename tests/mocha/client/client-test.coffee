if !(typeof MochaWeb == 'undefined')
  MochaWeb.testOnly ->

    describe 'Client', ->
      it 'should be true', ->
        chai.expect(5).to.equal(5)
        return
      return

    return # return for MochaWeb
