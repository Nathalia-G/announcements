class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
    @user = params[:user_id_i]
  end

  def unviewed
    #@announcements = Announcement.includes(:user)
    @user = params[:user_id_i]
    @announcements = Announcement.where.not(id: View.select("announcement_id").where(user_id: @user))
  end
  
  def announcement_view
    @view = View.new(announcement_view_params)
    puts "_________________________________"
      puts @view.user_id
      puts @view.announcement_id
    puts "_________________________________"
      if @view.save
        flash[:success] = "You mark this post as seen!"
        redirect_to unviewed_path(:user_id_i => current_user)
      else
        
      end
  end

  def my_posts
    @user = params[:user_id_i]
    @announcements = Announcement.where("user_id = ?", @user)
  end

  def create
   
    @announcement = Announcement.new(announcement_params)
    @announcement.date = DateTime.now + 1.minutes

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

    def announcement_view_params
      params.require(:seen).permit(:user_id, :announcement_id)
    end
    def announcement_params
      params.require(:announcement).permit(:content, :user_id, :date)
    end
end
