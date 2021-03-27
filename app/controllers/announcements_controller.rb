class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
    @user = params[:user_id]
  end

  def unviewed
    @announcements = Announcement.all
  end
  

  def my_posts
    @user = params[:user_id]
    @announcements = Announcement.where("user_id = ?", @user)
  end

  def create
 
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "Your new announcement is post!"
      redirect_to my_posts_path(:user_id => current_user)
    else
      render 'new', :user_id => params[:user_id]
    end
  end

   def destroy
    Announcement.find(params[:id]).destroy
    flash[:success] = "Announcement deleted"
    redirect_to my_posts_path
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content, :user_id, :date)
    end
end
