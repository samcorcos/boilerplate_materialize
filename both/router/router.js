Router.configure({
	templateNameConverter: "upperCamelCase",
	routeControllerNameConverter: "upperCamelCase",
	layoutTemplate: "layout",
	notFoundTemplate: "notFound",
	loadingTemplate: "loading"
});

if(Meteor.isClient) {
	Router.onBeforeAction(function() {
		// loading indicator here
		if(!this.ready()) {
			$("body").addClass("wait");
		} else {
			$("body").removeClass("wait");
			this.next();
		}
	});
}

Router.map(function () {
	this.route("home", {path: "/", controller: "HomeController"});
	this.route("about", {path: "/about", controller: "AboutController"});
});
