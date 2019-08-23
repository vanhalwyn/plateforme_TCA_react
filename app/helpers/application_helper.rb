module ApplicationHelper
  def current_order
    orders = Order.where(user_id: current_user.id).where(state: "en attente")

    if orders.length == 0
      order = Order.new(user_id: current_user.id)
    elsif orders.length == 1
      order = orders[0]
    else
      # should never happen thanks to the model validation
      orders.destroy_all
      order = Order.new(user_id: current_user.id)
    end
  end
end
