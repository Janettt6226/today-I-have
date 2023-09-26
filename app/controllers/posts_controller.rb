class PostsController < ApplicationController
  # before_action :authenticate_user!, only: %i[destroy new create]
  before_action :set_post, only: %i[show destroy edit update]

  def index
    @posts = Post.all.reverse
    @posts_grouped_by_date = @posts.group_by { |post| post.date.to_date }
    @post = Post.new
  end

  def show; end

  # def new
  #   @post = Post.new
  # end

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
      puts 'Please sign in to add a post'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
