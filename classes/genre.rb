require 'UUID'

class Genre
  attr_accessor :name

  def initialize(name, items)
    @id = UUID.new.generate
    @name = name
    @items = items
  end

  def add_item
    # method add item
  end
end
