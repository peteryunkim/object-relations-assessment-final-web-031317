class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title) #returns instances
    all.find do |mov|
      mov.title == title
    end
  end

  def ratings    # returns numbers
    Rating.all.map do |rating|
      if rating.title == self.title
        rating.score
      end
    end
  end

  # def ratings # returns instances
  #   Rating.all.select do |rating|
  #     rating.title == self.title
  #   end
  # end

  def viewers #returns people
    people = Rating.all.map do |rating|
      if rating.title == self.title
        rating.viewer
      end
    end
      people.map do |peo|
        peo.full_name
      end.uniq
  end

  # def viewers ## returns instances
  #   Rating.all.map do |rating|
  #     if rating.title == self.title
  #       rating.viewer
  #     end
  #   end

  def average_rating
    ratings.inject(0.0) {|sum, num| sum +=num} / ratings.length
  end


end
