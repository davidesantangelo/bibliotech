class AuthorSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :birthdate

  attribute :name do |object|
    object.name
  end
end
