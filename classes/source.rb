require 'UUID'
require_relative './source'

class Source
  attr_accessor :items, :item, :id

  def initialize(name, items)
    @id = UUID.new.generate
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self
  end
end
