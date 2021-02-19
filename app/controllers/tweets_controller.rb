class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    if params[:retweet].present?
      @tweet.tweet_id = params[:retweet]
    end

    @tweets = Tweet.all.reverse

# ///////////////////paginacion tweets/////////////////////
    @count = 0
    @inicio = 0
    @fin = 5
    if params[:mas_tweets]
      @inicio += 5
      @fin += 5
    elsif params[:menos_tweets]
      @inicio -= 5
      @fin -= 5
      redirect_to i_tweets_path
    end
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
    params.require(:tweet).permit(:content, :user_id, :retweets)
  end
end
