class Api::PostsController < Api::ApplicationController
  load_and_authorize_resource

  # GET /posts
  def index
    @posts = Post.includes(:ad_types).all
  end

  # GET /posts/1
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    ad_type_keys = params['post']['ad_types']
    ad_types = AdType.where(key: ad_type_keys)
    @post = current_user.posts.new(post_params)
    @post.ad_types = ad_types

    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    head :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :deadline, :format)
  end
end
