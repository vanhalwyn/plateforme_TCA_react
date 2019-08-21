class Api::CreneauxController < ApplicationController
  skip_after_action :verify_authorized, only: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    p params[:date]
    # Fetch DB
    # In DB store appointments
    # render the list of free time slots

    render json: { :timeslots => [10, 11, 13, 14, 15]}



    # render json: { :things => [
    #   {
    #     :name => 'some-thing',
    #     :guid => '0415674d-a0e8-4748-af68-a5f53a05c453'
    #   },
    #   {
    #     :name => 'some-thing-else',
    #     :guid => '0415674d-a0e8-4748-af68-a5f53a05c454'
    #   }
    # ] }.to_json
  end
end
