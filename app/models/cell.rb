class Cell
  include ActiveModel::Model

  attr_accessor :has_mine, :has_flag, :exposed
end
