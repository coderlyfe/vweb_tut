module main

import vweb
import rand

const(
	port = 9000
)

struct App {
	vweb.Context
}
fn main(){
	println("running on $port")
	vweb.run<App>(port)
}

pub fn (mut app App) init_once() {

}

pub fn (mut app App) init() {
}

pub fn(mut app App) index() vweb.Result{
	names := ['bob', 'tom', 'jane']
	app.enable_chunked_transfer(40)
	return $vweb.html()
}

pub fn(mut app App) show() vweb.Result {
	return $vweb.html()
}

['/book/:bookname']
pub fn (mut app App) book(bookname string) vweb.Result {
	id := rand.intn(50)
	return app.json('{ "id": $id, "bookname": "$bookname" }')
}

[post]
pub fn (mut app App) post() vweb.Result {
	book_n := app.form['book_name']
	return app.text("the books name is: $book_n")
}