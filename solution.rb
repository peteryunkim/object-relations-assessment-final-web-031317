# Please copy/paste all three classes into this file to submit your solution!

class Viewer
  attr_accessor :first_name, :last_name
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  # def initialize(full_name) #if wanting to start with full_name
  #   @full_name = full_name
  #   @@all << self
  # end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name) #returns instance
    all.find do |person|
      person.full_name == name
    end
  end

  # def self.find_by_name(name) #returns name
  #   all.find do |person|
  #     person.full_name == name
  #   end.full_name
  # end

  def create_rating(score, title)
    new_rating = Rating.new(score, title)
    new_rating.viewer = self
    new_rating
  end

end



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
