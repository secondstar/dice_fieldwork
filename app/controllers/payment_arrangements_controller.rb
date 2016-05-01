class PaymentArrangementsController < ApplicationController
  before_filter :load_parent, only: [:new, :create, :index]

  def new
    @arrangement = @parent.payment_arrangements.new
  end

  def edit
    @arrangement = PaymentArrangement.find(params[:id])
  end
  
  def create
    @arrangements = @parent.payment_arrangements.all
    @arrangement = @parent.payment_arrangements.create(payment_arrangements_params)
  end
  
  def update
    @arrangement = PaymentArrangement.find(params[:id])

    @arrangement.update_attributes(payment_arrangements_params)    
  end
  
  private

  def load_parent
    klass = [Account, ServiceAgreement].detect { |c| params["#{c.name.underscore}_id"]}
    @parent  = klass.find(params["#{klass.name.underscore}_id"])
  end
  
  def payment_arrangements_params
    params.require(:payment_arrangement).permit(:initial_charge_amount, :recurring_charge_amount, :customer_initials, :service_agreement_id, :payment_frequency, :start_date, :payment_method_description)
  end
end
