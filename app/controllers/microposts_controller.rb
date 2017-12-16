class MicropostsController < ApplicationController
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def index
    @microposts = Micropost.all
  end

  def Tweet
    @micropost = Micropost.tweet_count
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :avatar)
    end
end
