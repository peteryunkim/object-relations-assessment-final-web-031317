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
