class AnswersController < ApplicationController

  def create
    question = Question.find(params[:answer][:question_id])
    question.answers.create(answer_params)
    session[:current_user_email] = answer_params[:email]
    redirect_to question
    # Answer.create(answer_params)
  end

  private

  def answer_params
    params.require(:answer).permit(:email, :body)
  end

end
