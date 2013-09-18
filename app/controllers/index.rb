enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do 
  erb :sign_up
end 

get '/logged_in' do 
#   if session[:user].nil?
#     redirect '/'
#   else 
#     erb :logged_in
#   end 
# end 
  if session[:user]  
    erb :logged_in
  else
    redirect '/'
  end
end 

get '/sign_out' do 
  session.clear                 
  # session[:user] = nil   this way also works
  redirect '/'
end 


post '/sign_up' do 
  # if params[:password] == params[:password_copy]
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_copy])
    if user.valid?
      session[:user] = user.email
      redirect '/logged_in'
    else 
      erb :sign_up_again
    end 
end 

post '/' do

 user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    puts user 
    if user  
    # if user.password_digest == params[:password]  
      session[:user] = user.email 
      erb :logged_in
    else
      erb :sax_guy
    end
 
end





