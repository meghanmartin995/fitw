class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    #@q = Post.ransack(params[:q])
    #@posts = @q.result(distinct: true).includes(:fonts)
    #@posts = @q.result(distinct: true).includes(:category, :tags)
    if params[:q_search].present?
      #@filter = params[:q_search]["fonts"].concat(params[:q_search]).flatten.reject(&:blank?)
      @pg_results = PgSearch.multisearch(params[:q_search])
    end
    @posts = @posts & @pg_results if @pg_results
    @pagy, @posts = pagy(Post.all, items: 15)

    @post = Post.new
    @post.fonts.build
    @vibes = Vibe.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = Post.new
    @post.fonts.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash.now[:alert] = 'Post saved!'
    else
      render :new
      flash.now[:alert] = 'Post not saved :('
    end
  end

  private

  def post_params
    params.require(:post).permit(:website, :url, :photo, :tag_id, font_ids: [], vibe_ids: [], :fonts_attributes => [:name, :font_id])
  end
end
