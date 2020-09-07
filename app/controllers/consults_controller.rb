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


  def getUF
    
  end

  def usage
    if request.headers['x-cliente']==params[:name]
      @consult = Consult.where('username = ?', params[:name])
      if @consult
        consult_count = @consult.size
        render json: { user: params[:name], usage: consult_count }, status: :ok
      else
        render json: {error: "usuario no existe o no tiene data de uso"}, status: :unprocessable_entity
      end
    else
      render json: {error: "no tiene permitido solicitar datos de otros usuarios"}, status: :unauthorized
    end
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
