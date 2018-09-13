class Cell
  include ActiveModel::Model

  attr_accessor :has_mine, :has_flag, :exposed
end

class CellSerializer
  include JSONAPI::Serializer

  attribute :exposed
  attribute :has_mine
  attribute :has_flag
end

