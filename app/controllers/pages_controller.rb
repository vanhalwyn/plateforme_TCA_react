class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :consultations, :reservations]

  def home
  end

  def consultations
  end

  def reservations
    gon.form_authenticity_token = form_authenticity_token
    gon.stripe_pk = ENV['STRIPE_PUBLISHABLE_KEY']
  end
end
