class PublisherSerializer
  include JSONAPI::Serializer

  attributes :name, :address, :phone
end
