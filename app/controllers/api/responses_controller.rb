class Api::ResponsesController < Api::ApplicationController
  before_action :set_response, only: %i[show edit update destroy]

  # GET /responses
  def index
    @responses = Response.all
  end

  # GET /responses/1
  def show; end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit; end

  # POST /responses
  def create
    @response = current_user.responses.new(response_params)

    if @response.save
      redirect_to :show, status: :created, location: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /responses/1
  def update
    if @response.update(response_params)
      render :show, status: :ok, location: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # DELETE /responses/1
  def destroy
    @response.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_response
    @response = Response.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def response_params
    params.require(:response).permit(:post_id, :description, :link)
  end
end
