class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to profile_path(@profile), notice: 'Answer was successfully created.'
    else
      redirect_to profile_path(@profile), alert: 'Failed to create answer.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :profile_id)
  end
end
