class Dog < ApplicationRecord
  before_action :authenticate_admin, except: [:index, :show]
  belongs_to :user
end
