class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @post.fonts.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:website, :url, :photo, font_ids: [], :fonts_attributes => [:name, :font_id])
  end
end
