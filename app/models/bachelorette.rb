class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def contestants_average_age
    contestants.average(:age)
  end

  def contestants_unique_hometowns
    contestants.distinct.pluck(:hometown).join(", ")
  end
end
