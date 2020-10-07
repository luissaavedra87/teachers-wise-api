class AppoinmentsController < ApplicationController
  before_action :set_appoinment, only: [:show, :update, :destroy]

  # GET /appoinments
  def index
    @appoinments = Appoinment.all

    render json: @appoinments
  end

  # GET /appoinments/1
  def show
    render json: @appoinment
  end

  # POST /appoinments
  def create
    @appoinment = Appoinment.new(appoinment_params)

    if @appoinment.save
      render json: @appoinment, status: :created, location: @appoinment
    else
      render json: @appoinment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appoinments/1
  def update
    if @appoinment.update(appoinment_params)
      render json: @appoinment
    else
      render json: @appoinment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appoinments/1
  def destroy
    @appoinment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appoinment
      @appoinment = Appoinment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appoinment_params
      params.require(:appoinment).permit(:schedule, :status, :user_id, :teacher_id)
    end
end
