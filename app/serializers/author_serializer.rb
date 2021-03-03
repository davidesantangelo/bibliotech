class AuthorSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :birthdate, :books_count

  attribute :name do |object|
    object.name
  end

  attribute :books_count do |object|
    object.books.size
  end
end
