class Api::PostsController < Api::ApplicationController
  load_and_authorize_resource

  # GET /posts
  def index
    @posts = Post.includes(:ad_types).order(created_at: :desc).all
  end

  # GET /posts/1
  def show
    @post.responses.update_all(is_read: true)
  end

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

  # POST /posts/1/favorite
  def favorite
    favorite = Favorite.find_by(user: current_user, post: @post)
    if favorite
      favorite.destroy
      head :ok
    else
      current_user.favorite_posts << @post
      head :ok
    end
  end
  
  # GET /posts/favorites
  def favorites
    @posts = current_user.favorite_posts
    render :index
  end

  # GET /posts/latest_responses
  def latest_responses
    @posts = current_user.posts.includes(:responses, :ad_types, :tags).order('responses.created_at desc')
    render :index
  end

  # GET /posts/my_latest_responses
  def my_latest_responses
    @posts = Post.includes(:responses, :ad_types, :tags).where('responses.user_id = ?',
                                                               current_user.id).order('responses.created_at desc')
    render :index
  end


  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :deadline, :format)
  end
end
