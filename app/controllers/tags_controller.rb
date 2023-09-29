class TagsController < ApplicationController

  def index
    @tags = Tag.distinct.pluck(:name)
    @post = Post.new
    @tag = Tag.find_by(params[:id])
    @posts = @tag.posts
  end

  def show
    @tag = Tag.find_by(name: params[:name])
    @posts = @tag.posts
    @post = Post.new
  end

  def create
    @tag = Tag.new(tag_params)
    # @posts = @tag.posts
    if @tag.save
      redirect_to posts_path
    else
      render :new, unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :post_id)
  end
end
