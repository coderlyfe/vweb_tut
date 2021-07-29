module main

import vweb

const(
	port = 9000
)

struct App {
	vweb.Context
mut:
	cnt int
}

fn main(){
	println("vweb running")
	vweb.run<App>(port)
}

pub fn (mut app App) init_once() {
	//app.serve_static('/assets/main.css', 'main.css')
	app.handle_static('assets', false)
	
	//app.serve_static('/main.css', 'assets/main.css', 'text/css')
}

['/show_json']
pub fn (mut app App) show_json() vweb.Result {
	return app.json('[ { "user" : "bob", "pass" : 123 }, { "user" : "jim", "pass" : 12345 }, { "user" : "tom", "pass" : 543 } ]')
}


pub fn (mut app App) index() vweb.Result {
	return app.text('hello world')
}