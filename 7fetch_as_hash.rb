#!/usr/bin/ruby

require 'sqlite3'

begin
    
    db = SQLite3::Database.open "test.db"
    db.results_as_hash = true
        
    ary = db.execute "SELECT * FROM Cars LIMIT 20"    
        
    ary.each do |row|
        printf "%s %s %s\n", row['Id'], row['Name'], row['Price']
    end
             
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end