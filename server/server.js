Meteor.startup(function() {
	// read environment variables from Meteor.settings
	if(Meteor.settings && Meteor.settings.env && _.isObject(Meteor.settings.env)) {
		for(var variableName in Meteor.settings.env) {
			process.env[variableName] = Meteor.settings.env[variableName];
		}
	}

	if (Meteor.users.find().count() === 0) {
		Accounts.createUser({
			username: "admin",
			password: "adminpassword"
		});
		Meteor.users.update( {username: "admin"}, { $set: { "roles": ["admin"] }} );
	}


});
