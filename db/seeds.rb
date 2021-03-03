# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publisher = Publisher.create(name: Faker::Company.name, phone: Faker::PhoneNumber.phone_number, address: Faker::Address.full_address)

5.times.each do
  author = Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65)
  )

  5.times.each do
    Book.create(
      title: Faker::Book.title,
      description: Faker::Quote.matz,
      visibility: true,
      isbn: Faker::Barcode.isbn,
      author_id: author.id,
      publisher_id: publisher.id
    )
  end
end
