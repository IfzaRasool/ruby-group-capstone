require_relative '../item'

class Movie < Item
  attr_accessor :silent, :name, :id

  def initialize(name, publish_date silent, archived)
    super(publish_date, archived)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super() || archived
  end
end
