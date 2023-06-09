class PayslipAllowancesController < ApplicationController
  before_action :set_payslip_allowance, only: [:destroy]
  # before_action :set_allowance, only: [:destroy]
  # before_action :set_payslip, only: [:destroy]

  def destroy
    # @payslip = Payslip.find(params[:payslip_id])
    # @allowance = Allowance.find(params[:allowance_id])
    @payslip_allowance.destroy
  
    respond_to do |format|
      format.html { redirect_to payslip_path(@payslip), notice: "Allowance was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  # def set_allowance 
  #   @allowance = Allowance.find(params[:allowance_id])
  # end

  # def set_payslip
  #   @payslip = Payslip.find(params[:payslip_id])
  # end

  def set_payslip_allowance
    @payslip_allowance = PayslipAllowance.find(params[:id])
  end

  def payslip_allowance_params
    params.require(:payslip_allowance).permit(:payslip_id, :allowance_id)
  end
end
