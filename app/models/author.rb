class Author < ApplicationRecord
  # relations
  has_many :books, dependent: :destroy

  # validations
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_associated :books

  def name
    "#{first_name} #{last_name}"
  end

  def birthdate_formatted
    birthdate.strftime("#{birthdate.day.ordinalize} of %B %Y")
  end
end
