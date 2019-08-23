class OrdersController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def create
    if user_signed_in?
      orders = Order.where(user_id: current_user.id).where(state: "en attente")

      if orders.length == 0
        @order = Order.new(user_id: current_user.id)
      elsif orders.length == 1
        @order = orders[0]
      else
        # should never happen thanks to the model validation
        orders.destroy_all
        @order = Order.new(user_id: current_user.id)
      end

      @order.date = order_params[:date].to_date
      @order.timeslot = order_params[:timeslot]
      @order.save!
    else
      redirect_to new_user_session_path
    end
  end

  private

  def order_params
    params.permit(:date, :timeslot)
  end
end

