class SearchSerializer
  include JSONAPI::Serializer

  attributes :destination, :forcast, :total_books, :books
  set_id nil
  set_type :books

end
