require 'UUID'

class Source
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = UUID.new.generate
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self
  end
end
