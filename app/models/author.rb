class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end

  def birthdate_formatted
    birthdate.strftime("#{birthdate.day.ordinalize} of %B %Y")
  end
end
