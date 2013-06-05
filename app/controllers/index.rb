after do
  puts "Hello"
end

get '/' do
  # Look in app/views/index.erb
  @all_urls = Url.all
  erb :index
  # redirect 'http://www.google.com'

end

post '/' do
  content_type :json
	u = Url.where(url: params[:url]).first_or_create
  {url: u.url_short, errors: u.errors[:url][0], click_count: u.counter}.to_json
end

get '/:short_url' do
	foo = Url.find_by_url_short(params[:short_url])
  foo.counter = foo.counter + 1
  foo.save
	redirect "http://#{foo.url}"
end
