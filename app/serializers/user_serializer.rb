class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :api_key
  set_id :id
  set_type :user

end
