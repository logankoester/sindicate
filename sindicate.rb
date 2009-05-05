require 'open-uri'
require 'rubygems'
require 'sinatra'
require 'rack-flash'
require 'feed-normalizer'
require 'twitter'
require 'json'

configure do
end

enable :sessions
use Rack::Flash

before do
  request.env['PATH_INFO'] = '/' if request.env['PATH_INFO'].empty?
  
	@site = {
		:title => "Sindicate RB",
		:subtitle => "A Sinatra-based RSS aggregator",
		:about => "Thanks for checking out Sindicate.",
		:copyright => "&copy; 2009 Logan Koester"
	}
	
	@demo = YAML::load_file('demo.yml')
	require 'pp'
	pp @demo
	
end

get '/' do
	erb :index
end

get '/guide' do
	erb :guide
end
