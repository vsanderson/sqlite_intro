#!/usr/bin/ruby

require 'sqlite3'

begin
    
    db = SQLite3::Database.new "test.db"
    
    id = 1
    
    #stm = db.prepare "SELECT * FROM Cars WHERE Id=?"
    #stm.bind_param 1, id
    
    #alternate way to specify where clause
    #but have to be careful with "'"
    stm = db.prepare "SELECT * FROM Cars WHERE Id='1'"
    rs = stm.execute
    
    row = rs.next
    
    puts row.join "\s"
    
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    stm.close if stm
    db.close if db
end