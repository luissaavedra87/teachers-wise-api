# frozen_string_literal: true

class AppoinmentsController < ApplicationController
  before_action :set_appoinment, only: %i[show update destroy]

  def index
    @appoinments = Appoinment.all

    render json: @appoinments
  end

  def show
    render json: @appoinment
  end

  def create
    @appoinment = Appoinment.new(appoinment_params)

    if @appoinment.save
      render json: @appoinment, status: :created, location: @appoinment
    else
      render json: { error: 'Unable to create new appoinment, that schedule must be taken' },
      status: :unprocessable_entity
    end
  end

  def update
    if @appoinment.update(appoinment_params)
      render json: @appoinment
    else
      render json: @appoinment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appoinment.destroy
  end

  private

  def set_appoinment
    @appoinment = Appoinment.find_by!(id: params[:id])
  end

  def appoinment_params
    params.require(:appoinment).permit(:schedule, :status, :user_id, :teacher_id)
  end
end
