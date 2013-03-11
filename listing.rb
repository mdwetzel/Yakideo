class Listing
  attr_accessor :location

  def initialize(title)
    @title = title
  end

  def to_s
    "#{@title} - #{@location}"
  end
end