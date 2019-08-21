class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :consultations, :reservations]

  def home
  end

  def consultations
  end

  def reservations
  end
end
