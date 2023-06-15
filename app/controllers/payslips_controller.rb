class PayslipsController < ApplicationController
  before_action :set_payslip, only: %i[ show edit update increase_present_days increase_absent_days decrease_present_days decrease_absent_days]

  def index
    @payslips = Payslip.all
    @employees = Employee.all.order('last_name ASC')
  end

  def show
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

  def increase_present_days
    @payslip.update(present: @payslip.present + 1)
    redirect_to @payslip
  end

  def decrease_present_days
    @payslip.update(present: @payslip.present - 1)
    redirect_to @payslip
  end

  def increase_absent_days
    @payslip.update(absent: @payslip.absent + 1)
    redirect_to @payslip
  end

  def decrease_absent_days
    @payslip.update(absent: @payslip.absent - 1)
    redirect_to @payslip
  end



  private
    def set_payslip
      @payslip = Payslip.find(params[:id])
    end

    def payslip_params
      params.require(:payslip).permit(:present, :employee, :absent, :salary, :allowance_amount, :deduction_amount, :net, allowance_ids:[], deduction_ids:[] )
    end
end