class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
  end

  def unviewed
  end

  def my_posts

  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "Your new announcement is post!"
      redirect_to my_posts_path
    else
      render 'new'
    end
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content, :user_id, :date)
    end
end
