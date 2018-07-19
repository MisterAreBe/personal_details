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

post '/fav_nums' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  mail_info = params[:mail_info]
  state = params[:state]
  zipcode = params[:zipcode]
  fav_num1 = params[:fav_num1.to_s]
  fav_num2 = params[:fav_num2.to_s]
  fav_num3 = params[:fav_num3.to_s]
  redirect '/display?first_name=' + first_name + '&last_name=' + last_name + '&mail_info=' + mail_info + '&state=' + state + '&zipcode=' + zipcode + '&fav_num1=' + fav_num1 + '&fav_num2=' + fav_num2 + '&fav_num3=' + fav_num3
end

get '/display' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  mail_info = params[:mail_info]
  state = params[:state]
  zipcode = params[:zipcode]
  fav_num1 = params[:fav_num1]
  fav_num2 = params[:fav_num2]
  fav_num3 = params[:fav_num3]
  sum = fav_num1.to_i + fav_num2.to_i + fav_num3.to_i
  erb :display, :layout => :layout, :locals => {first_name: first_name, last_name: last_name, mail_info: mail_info, state: state, zipcode: zipcode, sum: sum}
end