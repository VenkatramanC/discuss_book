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
    @answer = @question.answers.all
  end
  

  def show
  end
  
  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer = @answer.update_attributes(user_answer_params)
    redirect_to question_answers_path 



  #   respond_to do |format|
  #     if @user.update(user_params)
  #      format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #     else
  #     format.html { render action: "edit" }
  #    end
  # end

  end

  def destroy
   @answer = Answer.find(params[:id])
   @answer.destroy
   redirect_to question_answers_path 
  end


  private
  def user_answer_params
    params.require(:answer).permit(:answer)
  end

  def fetch_question
    @question = Question.find(params[:question_id])
  end


end

