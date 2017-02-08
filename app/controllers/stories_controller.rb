class StoriesController < ApplicationController

  def index
    session[:current_user_id] = params[:format]
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

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to stories_path
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.sentences.each do |sentence|
      sentence.destroy
    end
    @story.destroy
    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:title, :image)
  end
end
