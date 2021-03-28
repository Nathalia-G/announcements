class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
    @user = params[:user_id_i]
  end

  def unviewed
    @announcements = Announcement.all
  end
  

  def my_posts
    @user = params[:user_id_i]
    @announcements = Announcement.where("user_id = ?", @user)
  end

  def create
   
    @announcement = Announcement.new(announcement_params)
    @announcement.date = DateTime.now + 1.minutes
     puts "_________________________________"
      puts @announcement.user_id
      puts "_________________________________"
    if @announcement.save
      flash[:success] = "Your new announcement is post!"
      redirect_to my_posts_path(:user_id_i => current_user)
    else
      render 'new', :user_id_i => params[:user_id_i]
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
