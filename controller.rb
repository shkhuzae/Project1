require 'sinatra'

#linking the controller to the database
require_relative './database.rb'


#redirects request to /students
get '/' do
    redirect to '/students'
end


#creates object of class database, selects all students, embeds the index file into
#application.erb in place of yield method
get '/students' do
   db = DBHandler.new
   @all_students = db.all
   erb :application do
      erb :index 
   end
end


#uses regualr expression to pass request to /students/graduated, 
#creates object of database class, selects only enrolled students,
#embeds index.erb into application.erb in place of yield method
get %r{/students/(enrolled|graduated)} do
   pass if request.path=~ /\/students\/graduated/
   db = DBHandler.new
   @all_students = db.enrolled('Enrolled')
   erb :application do
      erb :index 
   end
end


#same as /students/enrolled but with different parameetr for the method enrolled
#so that it only displays graduated students
get '/students/graduated' do
   db = DBHandler.new
   @all_students = db.enrolled('Graduated')
   erb :application do
      erb :index 
   end
end


#calls new.erb to create a form 
get '/students/new' do
   erb :application do
      erb :new 
   end
end


#creates a new student through the use of the params array
post '/students' do
   db = DBHandler.new
   db.create(params[:firstname],params[:lastname],params[:major],params[:email],params[:status])
   redirect to '/students'
end


#displays information for one student by getting the ID
#and selecting its record from the database then displaying that in the show.erb
get '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :show 
   end
end


#requests form for editing a student's information using their ID
#and displaying that form in edit.erb
get '/students/:id/edit' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :edit 
   end
end


#updating a student's information through the usuage of the params array
#then redirecting the user to the main page
patch '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   db.update(id, params[:firstname],params[:lastname],params[:major],params[:email], params[:status])
   redirect to '/students'
end


#Deleting a student's record from the database
#then redirecting user to the main page
get '/students/:id/delete' do
   id = params[:id].to_i
   db = DBHandler.new
   db.destroy(id)
   redirect to '/students'
end