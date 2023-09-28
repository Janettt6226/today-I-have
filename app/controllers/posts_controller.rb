class PostsController < ApplicationController
  # before_action :authenticate_user!, only: %i[destroy new create]
  before_action :set_post, only: %i[show destroy edit update]

  def index
    @tag = Tag.find_by(name: params[:tag])
    @user = User.find_by(username: params[:user])
    if @tag
      @posts = @tag.posts
    elsif @user
      @posts = @user.posts
    else
      @posts = Post.all.reverse
    end
    @posts_grouped_by_date = @posts.group_by { |post| post.date.to_date }
    @post = Post.new
  end

  def show; end

  def create
    if user_signed_in?
      @post = Post.new(post_params)
      @tag = Tag.new
      @post.user_id = current_user.id
      @post.date = Date.today
      if @post.save!
        redirect_to posts_path
      else
        render :new, unprocessable_entity
      end
    else
      render :see_other, notice: 'Please sign in to add an update'
    end
  end

  def updates
    if user_signed_in?
      @posts = current_user.posts.order(:date).reverse
    else
      render :see_other, notice: 'Please sign in to see your updates'
    end
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
