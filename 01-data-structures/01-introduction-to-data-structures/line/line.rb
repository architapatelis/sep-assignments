# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    return members.delete(person)
  end

  def front
    return members[0]
  end

  def middle
    middle_index = (members.length/2).ceil
    return members[middle_index]
  end

  def back
    return members[members.length - 1]
  end

  def search(person)
    members.each do |member|
      if person == member
        return member
      end
    end
    return nil
  end


  private

  def index(person)
    return members.index(person)
  end

end
