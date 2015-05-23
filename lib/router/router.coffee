Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"

Router.map ->
  @route "home",
    path: "/"

  @route "about",
    path: "/about"

  @route "login",
    path: "/login"

  return
