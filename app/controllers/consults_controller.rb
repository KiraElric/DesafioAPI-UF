class ConsultsController < ApplicationController
  before_action :set_consult, only: [:show, :update, :destroy]

  # GET /consults
  def index
    @consults = Consult.all

    render json: @consults
  end

  # GET /consults/1
  def show
    render json: @consult
  end

  # POST /consults
  def create
    @consult = Consult.new(consult_params)

    if @consult.save
      render json: @consult, status: :created, location: @consult
    else
      render json: @consult.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consults/1
  def update
    if @consult.update(consult_params)
      render json: @consult
    else
      render json: @consult.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consults/1
  def destroy
    @consult.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consult
      @consult = Consult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def consult_params
      params.require(:consult).permit(:username, :uf_value, :date_requested)
    end
end
