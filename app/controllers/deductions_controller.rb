class DeductionsController < ApplicationController
  before_action :set_deduction, only: %i[ show edit update destroy ]

  def index
    @deductions = Deduction.all.order('name ASC')
    @deduction = Deduction.new
  end

  def show
  end

  def new
    @deduction = Deduction.new
  end

  def edit
  end

  def create
    @deduction = Deduction.new(deduction_params)

    if @deduction.save
      redirect_to deductions_url, notice: 'deduction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @deduction.update(deduction_params)
      redirect_to deductions_path, notice: "deduction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deduction.destroy

    respond_to do |format|
      format.html { redirect_to deductions_url, notice: "deduction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_deduction
      @deduction = Deduction.find(params[:id])
    end

    def deduction_params
      params.require(:deduction).permit(:name, :description, :amount)
    end
end
