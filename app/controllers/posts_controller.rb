class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    #@q = Post.ransack(params[:q])
    #@posts = @q.result(distinct: true).includes(:fonts)
    #@posts = @q.result(distinct: true).includes(:category, :tags)
    if params[:q_search].present?
      @pg_results = PgSearch.multisearch(params[:q_search])
    end
    @pagy, @posts = pagy(Post.all, items: 15)
    #@posts = @posts & @pg_results if @pg_results
    @post = Post.new
    @post.fonts.build
    @vibes = Vibe.all
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
    params.require(:post).permit(:website, :url, :photo, font_ids: [], vibe_ids: [],:fonts_attributes => [:name, :font_id])
  end
end
