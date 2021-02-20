class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    if params[:retweet].present?
      @tweet.tweet_id = params[:retweet]
    end

    @tweets = Tweet.all.reverse

  end

  def show
    @tweet = Tweet.find(params[:id])
  end


  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = session[:user_id]
    if @tweet.save
      redirect_to i_tweets_path
    else
      redirect_to i_tweets_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id, :retweets, :tweet_id)
  end
end
