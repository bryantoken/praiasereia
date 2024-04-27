class MoradorsController < ApplicationController
  before_action :set_morador, only: %i[ show edit update destroy ]

def index
  @moradors = Morador.paginate(page: params[:page], per_page: 9).order(DATA_CADASTRO: :desc)
end

  def new
    @morador = Morador.new
  end
  
def create
  @morador = Morador.new(morador_params)

  respond_to do |format|
    if @morador.save
      format.html { redirect_to moradors_path, notice: 'Morador cadastrado com sucesso.' }
      format.json { render :show, status: :created, location: @morador }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @morador.errors, status: :unprocessable_entity }
    end
  end
end

def update
    respond_to do |format|
      if @morador.update(morador_params)
        format.html { redirect_to morador_url(@morador), notice: "Morador was successfully updated." }
        format.json { render :show, status: :ok, location: @morador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @morador.errors, status: :unprocessable_entity }
      end
    end
    # @morador = Morador.find(params[:id])
    # if @morador.update(params[:morador].permit(:cpf, :nome, :celular, :bloco, :apartamento))
    #   redirect_to @morador
    # else
    #   render 'edit'
    # end

  end

  def show
  end

def destroy
  @morador = Morador.find(params[:id])
  @morador.destroy
  redirect_to moradors_path, notice: 'Morador deletado com sucesso.'
end

  def edit
    @morador = Morador.find(params[:id])
  end



  private
  def set_morador
    @morador = Morador.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Morador não encontrado."
    redirect_to moradors_path
  end

  def morador_params
    params.require(:morador).permit(:cpf, :nome, :celular, :bloco, :apartamento)
  end
end
