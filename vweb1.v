module main

import vweb
//import vweb.assets


struct App {
	vweb.Context
}

const(
	port = 9000
)



fn main(){
	println("web server running")
	vweb.run<App>(port)
}

pub fn (mut app App) init_once() {
	app.handle_static("assets", false)
}

['/show_json']
pub fn (mut app App) show_json() vweb.Result {
	return app.json(' [{ "user" : "bob", "password" : 1234}, { "user" : "jan", "password" : 1244}, { "user" : "kim", "password" : 33334}] ')
}

['/user/:username']
pub fn (mut app App) get_user(username string) vweb.Result {
	return app.text("you username is $username")
}

['post']
pub fn (mut app App) post_name() vweb.Result {
	nm := app.form['n']
	return app.text("you name is $nm")
}

pub fn (mut app App) index() vweb.Result {
	

	s := "this is a variable"
	show := false
	words := ['dog', 'cat', 'monkey']
	return $vweb.html()
}