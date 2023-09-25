class PostsController < ApplicationController
  before_action :set_post, only: %i[destroy edit update]
  def index
    @posts = Post.all
    @posts_grouped_by_date = @posts.group_by { |post| post.date.to_date }
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.sign_in?
      @post = Post.new(post_params)
      @tag = Tag.new
      if @post.save
        redirect_to post_path(@post)
      else
        render :new, unprocessable_entity
      end
    else
      puts 'Please sign in to add a post'
    end
  end

  def edit; end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
