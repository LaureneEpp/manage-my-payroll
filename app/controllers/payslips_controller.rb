class PayslipsController < ApplicationController
  before_action :set_payslip, only: %i[ show edit update increase_present_days increase_absent_days decrease_present_days decrease_absent_days dowload generate_payslip]
  require "prawn"

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
  
  def generate_payslip
    pdf = Prawn::Document.new
    pdf.text "Payslip for #{@payslip.employee.fullname}", size: 24, style: :bold, align: :center
    pdf.move_down 100

    pdf.text "EMPLOYEE'S INFORMATION", size: 16
    pdf.move_down 10
    pdf.text "<b>Employee Name:</b> #{@payslip.employee.fullname}", size: 14, inline_format: true
    pdf.text "<b>Employee Address:</b> #{@payslip.employee.city}, #{@payslip.employee.country}", size: 14, inline_format: true
    pdf.text "<b>Employee Position:</b> #{@payslip.employee.position.name.capitalize} in #{@payslip.employee.team.name.capitalize} team", size: 14, inline_format: true
    pdf.move_down 40

    pdf.text "PRESENCE INFORMATION", size: 16
    pdf.move_down 10
    pdf.text "<b>Days of presence:</b> #{@payslip.present}", size: 14, inline_format: true
    pdf.text "<b>Days of absence:</b> #{@payslip.absent}", size: 14, inline_format: true
    pdf.move_down 40

    pdf.text "EARNINGS", size: 16
    pdf.move_down 10
    pdf.text "<b>Brut salary:</b> $#{@payslip.salary}", size: 14, inline_format: true
    pdf.move_down 15
    pdf.text "List of allowances", size: 14, style: :italic
    pdf.move_down 10
    @payslip.allowances.each do |allowance|
      pdf.text "• #{allowance.name}: #{allowance.amount} pts", size: 12, inline_format: true
      pdf.move_down 10
    end
    pdf.text "<b>Total allowances amount:</b> $#{@payslip.allowance_amount}", size: 14, inline_format: true
    pdf.move_down 15
    pdf.text "List of deductions", size: 14, style: :italic
    pdf.move_down 10
    @payslip.deductions.each do |deduction|
      pdf.text "• #{deduction.name}: #{deduction.amount} pts", size: 12
      pdf.move_down 10
    end
    pdf.text "<b>Total deductions amount:</b> $#{@payslip.deduction_amount}", size: 14, inline_format: true
    pdf.move_down 40

    pdf.text "Net Pay: $#{@payslip.net}", style: :bold, size: 18, align: :right

    send_data(pdf.render,
      filename: "Payslip_#{@payslip.employee.last_name}.pdf",
            type: 'application/pdf', 
            disposition: 'inline',
            page_size: 'A4'
          )
  end

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