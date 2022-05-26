class Api::UsersController < Api::ApplicationController
  before_action :set_user, only: %i[show update destroy verify_email complete_signup]
  before_action :authenticate_user!, except: %i[index show verify_email complete_signup]

  # GET /users
  def index
    @users = User.registered
  end

  # GET /users/1
  def show; end

  def profile
    @user = current_user
    render :show
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user == current_user && @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user == current_user && @user.destroy
      render :destroy, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def verify_email
    if @user.registration_code == params[:code]
      @user.registration_state = 'email_verified'
      @user.save!
      head :ok
    else
      render json: { error: "Неверный код" }, status: :bad_request
    end
  end

  def complete_signup
    if @user.registration_state == "complete"
      return render json: { error: "Пользователь уже зарегистрирован" }, status: :bad_request
    end
    sign_in :user, @user 
    token, payload = Warden::JWTAuth::UserEncoder.new.call(@user, :user, nil)
    response.set_header('Authorization', "Bearer #{token}")
    if @user.registration_state == "draft"
      return render json: { error: "Емейл еще не подтвержден" }, status: :bad_request
    end

    if @user.update(complete_user_params.merge(registration_state: :complete))
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :telegram, :avatar, :course, :edu_program, :instagram, :link, :about)
  end

  def complete_user_params
    params.require(:user).permit(:first_name, :last_name, :password, :telegram)
  end
end
