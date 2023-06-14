class PayslipsController < ApplicationController
  before_action :set_payslip, only: %i[ show edit update destroy ]
  # before_save :update_total_amount, if: :allowance_amount_changed?, only: [:update]

  def index
    @payslips = Payslip.all
    @employees = Employee.all.order('last_name ASC')
  end

  def show
    # @payslip_allowances = @payslip.allowances
    @allowances = Allowance.where(payslip_id: @payslip)
    @deductions = Deduction.where(payslip_id: @payslip)
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
      @payslip.update(allowance_amount: @payslip.calculate_allowances_amount, deduction_amount: @payslip.calculate_deductions_amount)
      redirect_to payslip_url(@payslip), notice: "Payslip was successfully updated."
    else
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
    end
end