class BookmarksController < ApplicationController
  skip_before_action :authenticate_user!

   def create
    if current_user
      @user_logged_in = true
    else
      @user_logged_in = false
    end
    @bookmark = Bookmark.new(app: App.find(params[:app_id]))
    @bookmark.user = current_user
    @app = App.find(params[:app_id])
    if @bookmark.save
      @message = "Application has been added to your favorites."
      respond_to do |format|
        format.html { redirect_to apps_path }
        format.js
      end
    else
      @message = "Application had already been added to your favorites."
      respond_to do |format|
        format.html { redirect_to apps_path }
        format.js
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to favorite_apps_path
  end

  private
end
