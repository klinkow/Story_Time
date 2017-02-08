class SentencesController < ApplicationController

  def index
    @story = Story.find(params[:story_id])
    @sentences = @story.sentences.all

  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
