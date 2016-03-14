class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:add_to_favorites]

  def add_to_favorites
    @user = current_user
    @article = Article.find params[:article_id]
    response = {'in_favorites': false}
    if @user.favorited? @article
      @user.remove_from_favorite! @article
    else
      @user.add_to_favorite! @article
      response['in_favorites'] = true
    end
    render :json => response
  end
end
