class Rating
  attr_accessor :score, :viewer, :title
  @@all = []

  def initialize(score, title)
    @score = score
    @title = title
    Movie.new(title)
    @@all << self
  end

  def self.all
    @@all
  end

end
