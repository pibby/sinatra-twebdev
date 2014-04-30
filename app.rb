require 'bundler/setup'
require 'sinatra'
require 'slim'
require 'dotenv'
require 'twitter-text'
require 'dalli'
include Twitter::Autolink
Dotenv.load
set :slim, :pretty => true

$topics = ["#rwd", "#webdev", "#webperf", "#a11y", "#frontend", "#webdesign", "#css", "#ux", "#gruntjs", "#ruby", "#tmux", "#vim"]

ENV["TZ"]="US/Central"

def client
  require 'twitter'
  @client ||= Twitter::REST::Client.new(
    consumer_key:    ENV['TWITTER_KEY'],
    consumer_secret: ENV['TWITTER_SECRET']
  )
end

def search(hash)
	@tweets = client.search("#{hash} -rt", :lang => "en", :count => 15, :result_type => "recent").take(15)

	if @tweets != nil
		# Cache tweets
		begin
			dc = Dalli::Client.new(ENV['MEMCACHE_SERVERS'], :username => ENV['MEMCACHE_USERNAME'], :password => ENV['MEMCACHE_PASSWORD'], :expires_in => 300) # 5 minutes
			if dc.get("tweetlist-#{hash}") == nil
				dc.set("tweetlist-#{hash}", @tweets)
			end
			tweetlist = dc.get("tweetlist-#{hash}")
		rescue Dalli::RingError
			puts "Unable to cache Twitter API call."
			tweetlist = @tweets
		end
	end

	return tweetlist
end

get '/' do
	slim :index
end

get '/popular' do
	slim :popular
end