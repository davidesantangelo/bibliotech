class Book < ApplicationRecord
  # relations
  belongs_to :publisher, optional: true
  belongs_to :author

  # scopes
  default_scope { includes(:author).order('authors.last_name desc').order(created_at: :desc) }
  scope :visible, -> { where.not(publisher_id: nil) }

  # validations
  validates :title, :description, presence: true
  validates :isbn, presence: true, uniqueness: true
end
