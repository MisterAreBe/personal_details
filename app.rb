require 'sinatra'

get '/' do
  erb :index, :layout => :layout
end

post '/names' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  redirect '/personal?first_name=' + first_name + '&last_name=' + last_name
end

get '/personal' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  erb :personal, :layout => :layout, :locals => {first_name: first_name, last_name: last_name}
end

post '/location' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  mail_info = params[:mail_info]
  state = params[:state]
  zipcode = params[:zipcode]
  redirect '/lucky?first_name=' + first_name + '&last_name=' + last_name + '&mail_info=' + mail_info + '&state=' + state + '&zipcode=' + zipcode
end

get '/lucky' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  mail_info = params[:mail_info]
  state = params[:state]
  zipcode = params[:zipcode]
  erb :lucky, :layout => :layout, :locals => {first_name: first_name, last_name: last_name, mail_info: mail_info, state: state, zipcode: zipcode}
end
