class Listing
  attr_accessor :location
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def to_s
    "#{@title} - #{@location}"
  end
end