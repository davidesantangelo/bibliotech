class BookListSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :isbn, :author_name

  attribute :description do |object|
    object.description.truncate(100, separator: '...')
  end

  attribute :author_name do |object|
    object.author.name
  end
end
