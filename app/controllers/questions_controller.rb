class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @question = @profile.questions.new(content: params[:content])
    @question.user = current_user
    if @question.save
      redirect_to profile_path(@profile), notice: 'Question was successfully submitted.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:content, :user_id, :profile_id)
  end
end
