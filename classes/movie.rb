require_relative '../item'

class Movie < Item
  attr_accessor :silet

  def initialize(silet: false)
    super(publish_date)
    @silet = silet
  end

  def can_be_archived?
    # something
  end
end
