class CustomerUsersController < ApplicationController
  def show
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end
    @follow_status = client.friendship?('kikunantoka', 'hogehoge')
  end
end
