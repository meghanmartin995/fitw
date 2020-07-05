class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :free, :show, :show_modal, :squarespace, :google ]
  impressionist actions: [:show_modal], unique: [:session_hash]

  def index
    if params[:q_search].present?
      @pg_results = PgSearch.multisearch(params[:q_search])

    elsif params[:search]
      @filter = params[:search]["tag"].reject(&:blank?)
      @pagy, @posts = pagy(Post.order(created_at: :desc).includes(:fonts).global_search("#{@filter}"))

    else
      @posts = @posts & @pg_results if @pg_results
      @pagy, @posts = pagy(Post.order(created_at: :desc).includes(:fonts), items: 20)

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
      @pagy, @posts = pagy(Post.is_free.order(created_at: :desc).includes(:fonts), items: 33)

    respond_to do |format|
      format.html
      format.js
    end
    end
  end

  def squarespace
    if params[:search]
      @filter = params[:search]["tag"].reject(&:blank?)
      @pagy, @posts = pagy(Post.is_squarespace.global_search("#{@filter}"))
    else
      @pagy, @posts = pagy(Post.is_squarespace.order(created_at: :desc).includes(:fonts), items: 33)

    respond_to do |format|
      format.html
      format.js
    end
    end
  end

  def google
    if params[:search]
      @filter = params[:search]["tag"].reject(&:blank?)
      @pagy, @posts = pagy(Post.is_google.global_search("#{@filter}"))
    else
      @pagy, @posts = pagy(Post.is_google.order(created_at: :desc).includes(:fonts), items: 33)

    respond_to do |format|
      format.html
      format.js
    end
    end
  end

  def show_modal
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
    if @post.previous.nil?
      @previous_post = @post
    else
      @previous_post = @post.previous
    end
    if @post.next.nil?
      @next_post = @post
    else
      @next_post = @post.next
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
    params.require(:post).permit(:website, :url, :photo, tag_list: [], font_ids: [], vibe_ids: [], :fonts_attributes => [:name, :designer, :source, :free_commercial, :free_personal, :google, :squarespace, :adobe, :font_id])
  end
end
