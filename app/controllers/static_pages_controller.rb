class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @micropost  = current_user.microposts.build　#入力欄を作るため
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
