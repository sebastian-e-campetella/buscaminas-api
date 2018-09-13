class Game < ApplicationRecord
#  attr_accessor :cells
  serialize :mines, Array
  serialize :cells, JSON

  after_create :populate
  after_find :populate
  
  def squares
    self.rows*self.cols
  end

  def initialize(attributes={})
    super
    populate
  end

private
  def populate
    mine_count = (self.squares*0.33).to_i
    if self.mines.empty?
      occurrences = []
      (i = rand(1..self.squares); occurrences << i unless occurrences.include?(i) ) while ( occurrences.count <  mine_count)
      self.mines = occurrences
    end
    self.cells = []
    self.squares.times do |t|
      self.cells << Cell.new(:has_mine => self.mines.include?(t+1), has_flag: false, exposed: false)
    end
  end

end

