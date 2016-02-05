class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
      if @question.save
      redirect_to questions_path
      else
      render 'new'
      end
  end

  def index
   @questions = Question.all

  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def edit
  end


  def delete
  end

 private

 def question_params
  params.require(:question).permit(:question)
 end
end
