class Publisher < ApplicationRecord
  # relations
  has_many :books

  # validations
  validates :name, :phone, :address, presence: true
end
