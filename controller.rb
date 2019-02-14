require 'sinatra'
require_relative './database.rb'

get '/' do
    redirect to '/students'
end

get '/students' do
   db = DBHandler.new
   @all_students = db.all
   erb :application do
      erb :index 
   end
end

get '/students/new' do
   erb :application do
      erb :new 
   end
end

post '/students' do
   db = DBHandler.new
   db.create(params[:firstname],params[:lastname],params[:major],params[:email],params[:status])
   redirect to '/students'
end

get '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :show 
   end
end

get '/students/:id/edit' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :edit 
   end
end

patch '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   db.update(id, params[:firstname],params[:lastname],params[:major],params[:email], params[:status])
   redirect to '/students'
end

get '/students/:id/delete' do
   id = params[:id].to_i
   db = DBHandler.new
   db.destroy(id)
   redirect to '/students'
end