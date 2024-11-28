class TweetsController < ApplicationController

  def create

    

    if authenticate_user
      

      @tweet = authenticate_user.tweets.new(tweet_params)

      render json: {
        tweet: {
          username: @tweet.user.username,
          message: @tweet.message
        }
      }
    else
      render json: { success: false }
    end
  end


  def destroy
    @tweet = Tweet.find_by(id: params[:id])

    if @tweet && authenticate_user
      if @tweet.destroy
        render json: { success: true }
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end


  def index
    @tweets = Tweet.all.order(created_at: :desc)
    render 'tweets/index.jbuilder'
  end


  def index_by_user
    user = User.find_by(username: params[:username])

    if user
      @tweets = user.tweets
      render 'tweets/index.jbuilder'
    else
      render json: { success: false }
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:user_id, :message)
    end

    def authenticate_user
      token = cookies.signed[:twitter_session_token]
      session = Session.find_by(token: token)
      if session
        user = session.user
      end
    end
end



# https://github.com/nickstauffer21/bewd-twitter/blob/main/app/controllers/tweets_controller.rb