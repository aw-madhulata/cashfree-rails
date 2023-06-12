class HomeController < ApplicationController
  def index
    @order_id = 786
    @amount = 786.00
    @email = "aw@madhulata.org"
    @mobile = "+919999034312"
  end
  
  def thank_you
  end 
  
  def error
  end 
end
