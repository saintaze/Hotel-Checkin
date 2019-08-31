class Room
  attr_reader :occupants  

  def initialize(capacity = rand(2..5))
    @capacity = capacity
    @occupants = []
  end

  def full?
    @capacity == @occupants.size
  end

  def available_space?
    @capacity - @occupants.size
  end

  def add_occupant(name)
    if available_space? > 0
      @occupants << name.capitalize
      true
    else
      false
    end
  end
end
