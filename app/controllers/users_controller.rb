class UsersController < ApplicationController

  def index
    @post = Post.where(user_id: current_user.id).order("created_at DESC")
    #@post = Post.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
  end

  #def index
  #  return nil if params[:keyword] == ""
  #  @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
  #end
#
  #def edit
  #end
#
  #def update
  #  if current_user.update(user_params)
  #    redirect_to root_path
  #  else
  #    render :edit
  #  end
  #end
#
  #private
#
  #def user_params
  #  params.require(:user).permit(:name, :email)
  #end

end