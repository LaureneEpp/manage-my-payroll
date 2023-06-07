class PayslipsController < ApplicationController
  before_action :set_payslip, only: %i[ show edit update destroy ]


  def index
    @payslips = Payslip.all
    @employees = Employee.all.order('last_name ASC')
  end

  def show
  end

  def new
    @payslip = Payslip.new
    @payslip.allowances.build
    @payslip.deductions.build
  end

  def create
    @payslip = Payslip.new(payslip_params)
    if @payslip.save
      redirect_to payslips_url, notice: 'payslip was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end


  def update
    if @payslip.update(payslip_params)
      redirect_to payslip_url(@payslip), notice: "Payslip was successfully updated."
    else
      # Add `status: :unprocessable_entity` here
      render :edit, status: :unprocessable_entity
    end
  end

  # def update
  #   respond_to do |format|
  #     if @payslip.update(payslip_params)
  #       format.turbo_stream
  #       format.html { redirect_to payslip_url(@payslip), notice: "payslip was successfully updated." }
  #       format.json { render :show, status: :ok, location: @payslip }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @payslip.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payslip
      @payslip = Payslip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payslip_params
      params.require(:payslip).permit(:present, :employee, :absent, :salary, :allowance_amount, :deduction_amount, :net, allowance_ids:[], deduction_ids:[] )
      # params.require(:payslip).permit(:present, :employee, :absent, :salary, :allowance_amount, :deduction_amount, :net, { allowances: [] }, { deductions: [] })
      # params.require(:payslip).permit(:present, :employee, :absent, :salary, :allowance_amount, :deduction_amount, :net, allowances_attributes: [:id, :name, :description, :amount], deductions_attributes: [:id, :name, :description, :amount] )
    end
end