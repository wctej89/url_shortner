after do
  puts "Hello"
end

get '/' do
  # Look in app/views/index.erb
  if(session[:id])
    @current_user = User.find(session[:id])
  end
  @all_urls = Url.all
  erb :index
  # redirect 'http://www.google.com'

end

post '/signin' do
  user = User.find_by_username(params[:username])
  if user.match_pass(params[:password])
    session[:id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

post '/' do
  content_type :json
	url = Url.where(url: params[:url]).first_or_create
  if session[:id]
    url.user_id = session[:id]
    url.save
  end
  {url: url.url_short, errors: url.errors[:url][0], click_count: url.counter}.to_json
end



get '/signup' do
  erb :signup
end

post '/signup' do
  User.create(username: params[:username], password_hash: params[:password])
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/:short_url' do
  foo = Url.find_by_url_short(params[:short_url])
  foo.counter = foo.counter + 1
  foo.save
  redirect "http://#{foo.url}"
end
