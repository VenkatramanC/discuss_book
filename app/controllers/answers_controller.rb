class AnswersController < ApplicationController
  
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(user_answer_params)
    if @answer.save
      redirect_to answer_path(@answer)
    else
      render 'new'
    end
  end
  

  def show
    @answer =Answer.all
  end
  
  def edit
  end

  def delete
  end


  private
  def user_answer_params
    params.require(:answer).permit(:answer)
  end

end
