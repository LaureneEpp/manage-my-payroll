class AllowancesController < ApplicationController
  before_action :set_allowance, only: %i[ show edit update destroy ]

  def index
    @allowances = Allowance.all.order('name ASC')
    @allowance = Allowance.new
  end

  def show
  end

  def new
    @allowance = Allowance.new
  end

  def edit
  end

  def create
    @allowance = Allowance.new(allowance_params)

    if @allowance.save
      redirect_to allowances_url, notice: 'allowance was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @allowance.update(allowance_params)
      redirect_to allowances_path, notice: "Allowance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @allowance.destroy

    respond_to do |format|
      format.html { redirect_to allowances_url, notice: "allowance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_allowance
      @allowance = Allowance.find(params[:id])
    end

    def allowance_params
      params.require(:allowance).permit(:name, :description, :amount)
    end
end
