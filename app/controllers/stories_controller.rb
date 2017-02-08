class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end
  def new
    @story = Story.new
  end
  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      flash[:error] = "Try Again"
      render :new
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :image)
  end
end
