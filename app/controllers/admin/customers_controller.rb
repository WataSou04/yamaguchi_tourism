class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update
      redirect_to admin_cusotmer_path(@customer.id)
    else
      render :edit
    end
  end
  
  private
  
  def cusotmer_params
    params.require(:cusotmer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :is_active)
  end
end
