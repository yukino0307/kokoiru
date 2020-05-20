class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @post = Post.all
    #@post = Post.all.recent(9)
  end

  def new
    @post = Post.new
    3.times {@post.images.build}
    @post.build_spot
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to users_path
    else
      flash[:error] = @post.errors.full_messages
      redirect_to action: "new"
    end
  end

  #def edit
  #  redirect_to post_path unless current_user.id == @post.user_id
  #  count = @post.images.count
  #  (3 - count).times {@post.images.build}
  #end
#
  #def update
  #  render action: "edit" unless @post.valid?
  #  if @post.user_id == current_user.id
  #    @post.update(post_params)
  #    redirect_to post_path(@post)
  #  end
  #end

  def show
    #@post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy 
      redirect_to users_path
    end
  end

  private

  def post_params
      params.require(:post).permit(
        :title,
        :explanation,
        images_attributes: [:id, :image],
        spot_attributes: [:address]
      ).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
