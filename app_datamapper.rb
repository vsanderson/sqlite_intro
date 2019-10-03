 require 'sinatra'
 require 'sqlite3'
 require 'data_mapper'
 
 
 DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.db")
 
class Car
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, :required => true
  property :price, Integer, :required => true
  
end
 
DataMapper.finalize.auto_upgrade!
       
        
get '/' do
   @cars = Car.all :order => :id.desc
   @title = 'All Cars'
    erb :indexd
end        

post '/insert' do 
  model = params['model']
  price = params['price'].to_i
 
  @C = Car.new
  @C.name = model
  @C.price = price
  @C.save
  
  @cars2 = Car.all :order => :id.desc 
  
  erb :carsd 
  
end 