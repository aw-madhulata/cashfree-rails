class CashfreeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def generate_cashfree_token
    cashfree = Cashfree::Cashfree.new FREECASH_APPID, FREECASH_APPSECRET, FREECASH_API_VERSION, CASHFREE_URL, CASHFREE_RETURN_URL
    order_id = params[:id]
    amount = params[:amount]
    email = params[:email]
    mobile = params[:mobile]
    customer_id = params[:customer_id] # optional
    data = cashfree.generate_order order_id, amount, email, mobile, customer_id 
    render :json => data and return
  end 

  def cashfree_paid 
    order_id = params[:order_id]
    cashfree = Cashfree::Cashfree.new FREECASH_APPID, FREECASH_APPSECRET, FREECASH_API_VERSION, CASHFREE_URL, CASHFREE_RETURN_URL 
    paid_amount = cashfree.validate_payment order_id 
    # TODO please confirm of paid_amount is equal to order.amount 
    if paid_amount
      # TODO provide memeber ship
      redirect_to "/thank_you"
    else
      # error
      redirect_to "/error"
    end 
    
  end 
end
