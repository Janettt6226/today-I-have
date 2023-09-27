class TagsController < ApplicationController

  def index
    @tags = Tag.distinct.pluck(:name)
    @post = Post.new
  end

  def show
    @tag = Tag.find_by(name: params[:name])
    @posts = @tag.posts
    @post = Post.new
  end
end
