class Game < ApplicationRecord
#  attr_accessor :cells
  serialize :mines, Array
  serialize :cells, JSON

  after_create :populate
  after_find :populate
  before_save :evaluate
  
  def squares
    self.rows*self.cols
  end

  def initialize(attributes={})
    super
    populate
  end

  def json_api
    JSONAPI::Serializer.serialize(self)
  end

  def non_exposed
    self.cells.select {|c| !c.symbolize_keys![:exposed]}
  end

  def exposed
    self.cells - self.non_exposed
  end

  def evaluate
    self.status = "lose" if( self.exposed.any?{ |c| c[:has_mine]} )
    self.status = "win" if (self.mine_count == self.non_exposed.count)
  end

  def mine_count
    (self.squares*0.33).to_i
  end

private
  def populate
    mine_count = self.mine_count
    if self.mines.empty?
      occurrences = []
      (i = rand(self.squares); occurrences << i unless occurrences.include?(i) ) while ( occurrences.count <  mine_count)
      self.mines = occurrences
    end
    self.cells = []
    self.squares.times do |t|
      self.cells << {:has_mine => self.mines.include?(t), has_flag: false, exposed: false }
    end
  end

end


class GameSerializer
  include JSONAPI::Serializer

  attributes :mines, :status, :rows, :cols, :created_at, :updated_at
end

