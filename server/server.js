Meteor.startup(function() {
	// read environment variables from Meteor.settings
	if(Meteor.settings && Meteor.settings.env && _.isObject(Meteor.settings.env)) {
		for(var variableName in Meteor.settings.env) {
			process.env[variableName] = Meteor.settings.env[variableName];
		}
	}

	Blog.config({
		adminRole: 'blogAdmin',
		authorRole: 'blogAuthor'
	});

	if (Meteor.users.find().count() === 0) {
		Accounts.createUser({
			username: "admin",
			password: "adminpassword"
		});

		Accounts.createUser({
			username: "author",
			password: "authorpassword"
		});
		Meteor.users.update( {username: "admin"}, { $set: { "roles": ["blogAdmin", "blogAuthor"] }} );
		Meteor.users.update( {username: "author"}, { $set: { "roles": ["blogAuthor"] }} );
	}



});
