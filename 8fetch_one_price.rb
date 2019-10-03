#!/usr/bin/ruby

require 'sqlite3'

begin
    
    db = SQLite3::Database.open "test.db"
      
    val = db.get_first_value "SELECT Price FROM Cars WHERE Name='Bentley'"       
    puts val
    
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end