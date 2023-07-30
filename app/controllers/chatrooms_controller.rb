class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(user: current_user).or(Chatroom.where(profile: current_user.profile)).order(created_at: :desc)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @profile = Profile.find(params[:chatroom][:profile_id])
    @chatroom = Chatroom.new(user: current_user, profile: @profile)

    if @chatroom.save
      redirect_to @chatroom, notice: 'Chatroom was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def chatroom_params
  #   params.require(:chatroom).permit(:user_id, :profile_id)
  # end
end
