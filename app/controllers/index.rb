get '/' do
  # Look in app/views/index.erb
  erb :index
  # redirect 'http://www.google.com'

end

post '/' do
	Url.create(url: params[:url])
end

get '/:short_url' do
	foo = Url.find_by_url_short(params[:short_url])
	redirect "#{foo.url}"
end
