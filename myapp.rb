require 'sinatra'
require "sinatra/content_for"
require 'pony'

require 'pry'

configure :development do
  set :email_options, {
    :via => :smtp,
    :via_options => {
	    :address              => 'smtp.gmail.com',
	    :port                 => '587',
	    :enable_starttls_auto => true,
	    :user_name            => '',
	    :password             => '',
	    :authentication       => :plain, 
	    :domain               => "" 
  	}
  }

Pony.options = settings.email_options

end


get '/' do
  	erb :index
end

get '/features' do
    erb :features
end

get '/pricing' do
    erb :pricing
end

get '/contactus' do
    erb :contactus
end

get '/aboutus' do
    erb :aboutus
end


post '/send_message' do
	Pony.mail :to => "aviandri@dilacak.com",
            :from => params[:email],
            :subject => "New Message from, #{params[:name]}!",
            :body => erb(:message_template, :layout => false)
end






