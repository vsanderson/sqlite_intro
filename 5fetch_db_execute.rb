#!/usr/bin/ruby

require 'sqlite3'

begin
    
    db = SQLite3::Database.open "test.db"
        
    #convenience "execute" method on db object
    rows = db.execute "SELECT * FROM Cars LIMIT 5"
        
    for row in rows do
        puts row.join "\s"
    end
            
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end