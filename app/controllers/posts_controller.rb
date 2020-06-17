class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :free, :show, :show_modal ]
  impressionist actions: [:show_modal], unique: [:session_hash]

  def index
    @q = Post.ransack(params[:q])
    if params[:q_search].present?
      @pg_results = PgSearch.multisearch(params[:q_search])

    elsif params[:search]
      @filter = params[:search]["tag"].reject(&:blank?)
      @pagy, @posts = pagy(Post.all.global_search("#{@filter}"))

    elsif params[:q]

      @posts = @q.result.includes(:fonts, :tags).page(params[:page]).to_a.uniq
    else
    @posts = @posts & @pg_results if @pg_results
    @pagy, @posts = pagy(Post.all, items: 33)

      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def new
    is_admin!
    @post = Post.new
    @post.fonts.build
  end

  def show
    @post = Post.with_attached_photo.find(params[:id])
    @related_posts = @post.find_related_tags
    respond_to do |format|
      format.html
      format.js
    end
  end

  def free
    if params[:search]
      @filter = params[:search]["tag"].reject(&:blank?)
      @pagy, @posts = pagy(Post.is_free.global_search("#{@filter}"))
    else
    @posts = @posts & @pg_results if @pg_results
    @pagy, @posts = pagy(Post.is_free, items: 33)

      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def squarespace
    @pagy, @posts = pagy(Post.is_free, items: 33)
  end

  def google
    @pagy, @posts = pagy(Post.is_free, items: 33)
  end

  def show_modal
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    is_admin!
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:alert] = 'Post saved!'
    else
      render :new
      flash[:alert] = 'Post not saved :('
    end
  end

  private

  def post_params
    params.require(:post).permit(:website, :url, :photo, tag_list: [], font_ids: [], vibe_ids: [], :fonts_attributes => [:name, :font_id])
  end
end
