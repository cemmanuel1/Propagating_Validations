get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :create
end

post '/events/create' do
  @event = Event.create(params[:event])
  if @event.valid?
    redirect "/events/#{@event.id}/show"
  else
    erb :create
  end
end
