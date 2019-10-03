 require 'sinatra'
 require 'sqlite3'
 
 before {
 @db = SQLite3::Database.open "test.db"
 @db.results_as_hash = true
    @db.execute "CREATE TABLE IF NOT EXISTS Cars(Id INTEGER PRIMARY KEY autoincrement, 
        Name TEXT, Price INT)"
   @cars = @db.execute "SELECT * FROM Cars LIMIT 5"
 }        
        
get '/' do
    @db.results_as_hash=true
    @cars = @db.execute "SELECT * FROM Cars LIMIT 5"
    erb :index
end        

post '/insert' do 
  model = params['model']
  price = params['price'].to_i
 
  @db.execute "insert into cars (name, price) VALUES('#{model}','#{price}')"
  
  @cars2 = @db.execute "SELECT * FROM Cars"
  
  erb :cars 
  
end 