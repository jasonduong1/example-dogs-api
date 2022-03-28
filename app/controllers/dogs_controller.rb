class DogsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    dog = current_user.dogs.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
    )
    if dog.save
      render json: { message: "Dog successfully added" }, status: :created
    else
      render json: { errors: dog.errors.full_messages }, status: :bad_request
    end
  end
end
