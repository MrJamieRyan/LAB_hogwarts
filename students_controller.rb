require('sinatra')
require('sinatra/contrib/all')
require ('pry')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index

get '/students/?' do
@students = Student.all()
erb(:index)
end



# new

get '/students/new' do
  @houses = House.all
  erb(:new)
end

# show

get '/students/:id/?' do
@student = Student.find(params[:id])
erb(:show)
end


# edit

get '/students/:id/edit' do
  @houses = House.all
  @student = Student.find(params[:id])
  erb(:edit)
end

# update

post '/students/:id/update' do
  Student.new(params).update
  erb(:update)
end

# create

post '/students/?' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

# destroy

post '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete
  erb(:delete)
end
