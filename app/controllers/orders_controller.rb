class OrdersController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def create
    if user_signed_in?
      @order = current_order
      @order.date = order_params[:date].to_date
      @order.timeslot = order_params[:timeslot]
      @order.save!

      redirect_to paiement_path
    else
      redirect_to new_user_session_path
    end
  end

  def new_payment
    gon.stripe_pk = ENV['STRIPE_PUBLISHABLE_KEY']
    @order = current_order
    # authorize @order
    @user = current_user

    # unless @user.stripe_cus
      # customer = Stripe::Customer.create(
        # email:  @user.email
      # )
      # @user.stripe_cus = customer.id
      # @user.save
    # end

    @intent = Stripe::PaymentIntent.create({
      #customer: @user.stripe_cus,
      amount: (50 * 100).to_i,
      currency: 'eur',
      payment_method_types: ['card']
    })

    gon.stripe_intent = @intent
  end

  def create_payment
    @order = current_order

    @order.state = "payé"
    @order.save!

    appointment = Appointment.new()
    appointment.user_id  = @order.user_id
    appointment.date     = @order.date
    appointment.timeslot = @order.timeslot
    appointment.save!
  end

  private

  def order_params
    params.permit(:date, :timeslot)
  end
end

