this.App = {};
this.Helpers = {};

Meteor.startup(function() {
	
});

Helpers.menuItemClass = function(routeName) {
	if(!Router.current()) {
		return "";
	}

	if(!Router.routes[routeName]) {
		return "";
	}

	var currentPath = Router.routes[Router.current().route.getName()].handler.path;
	var routePath = Router.routes[routeName].handler.path;

	if(routePath === "/") {
		return currentPath == routePath ? "active" : "";
	}

	return currentPath.indexOf(routePath) === 0 ? "active" : "";
};

Helpers.secondsToTime = function(seconds, timeFormat) {
	return secondsToTime(seconds, timeFormat);
};

Helpers.formatDate = function(date, dateFormat) {
	if(!date) {
		return "";
	}

	var f = dateFormat || "MM/DD/YYYY";
	return moment(date).format(f);
};

Helpers.integerToYesNo = function(i) {
	return i ? "Yes" : "No";
};

Helpers.integerToTrueFalse = function(i) {
	return i ? "True" : "False";
};

_.each(Helpers, function (helper, key) {
	Handlebars.registerHelper(key, helper)
});

