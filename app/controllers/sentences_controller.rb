class SentencesController < ApplicationController

  def index
    @story = Story.find(params[:story_id])
    @sentences = @story.sentences.all
    @user = User.find(session[:current_user_id])
  end

  def new
    @sentence = Sentence.new
    @story = Story.find(params[:story_id])
    @user = User.find(session[:current_user_id])
    number = rand($image_array.length)
    @image = $image_array[number]
    @sentences = @story.sentences.all
  end

  def create
    @story = Story.find(params[:story_id])
    @sentence = Sentence.new(sentence_params)
    puts(sentence_params)
    if @sentence.save
      redirect_to story_sentences_path(@story)
    else
      flash[:error] = "Try Again"
      render :new
    end
  end

  def edit
    @story = Story.find(params[:story_id])
    @user = User.find(session[:current_user_id])
    @sentence = Sentence.find(params[:id])
    @image = @sentence.image
  end

  def update
    @story = Story.find(params[:story_id])
    @sentence = Sentence.find(params[:id])
    if @sentence.update(sentence_params)
      redirect_to story_sentences_path(@story)
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    @sentence = Sentence.find(params[:id])
    @sentence.destroy
    redirect_to story_sentences_path(@story)
  end


  private
  def sentence_params
    params.require(:sentence).permit(:text, :image, :user_id, :story_id)
  end
end
