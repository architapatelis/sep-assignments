class Film
  attr_accessor :name
  attr_accessor :cast

  def initialize(name)
    @name = name
    @cast = []
  end
end
