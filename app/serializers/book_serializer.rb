class BookSerializer
  include JSONAPI::Serializer

  belongs_to :author
  belongs_to :publisher

  attributes :title, :description, :isbn, :created_at, :author, :publisher

  attribute :description do |object|
    object.description.truncate(100, separator: '...')
  end

  attribute :author do |object|
    {
      fullname: object.author.name,
      email: object.author.email,
      birthdate: object.author.birthdate_formatted
    }
  end

  attribute :publisher do |object|
    {
      name: object.publisher&.name,
      address: object.publisher&.address
    }
  end

  attribute :created_at do |object|
    object.created_at.strftime('%d/%m/%Y')
  end
end
