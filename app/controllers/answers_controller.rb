class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_filter :fetch_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(user_answer_params)
    if @answer.save
      redirect_to question_answers_path(params[:question_id])
    else
      render 'new'
    end
  end
  

  def index
   
    @answer = Answer.all
  end
  

  def show
  end
  
  def edit
  end

  def delete
   
  end


  private
  def user_answer_params
    params.require(:answer).permit(:answer)
  end

  def fetch_question
    @question = Question.find(params[:question_id])
  end
end

