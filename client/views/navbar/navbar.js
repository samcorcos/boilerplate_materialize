Template.navbar.rendered = function() {
  $(".button-collapse").sideNav();
};

Template.navbar.helpers({
  isAdmin: function() {
    var rolesArray = Meteor.users.find().fetch()[0].roles;
    var temp;
    rolesArray.forEach(function(role) {
      if (role == "blogAdmin") { temp = true; }
    })
    return temp;
  }
});
