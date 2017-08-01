require_relative 'film'

class Actor
  attr_accessor :name
  attr_accessor :filmography

  def initialize(name)
    @name = name
    @filmography = []
  end

  # add actor to film cast
  # add film to actor's filmography
  def create_film_array(film)
    film.cast.push(self)
    @filmography.push(film)
  end

  def find_kevin_bacon(films=[], checked_actors = [], current_actor=self)
    if current_actor == Kevin_Bacon
      return "Already connected"
    else
      current_actor.filmography.each do |film|
        unless films.include?(film.name)
          films.push(film.name)
        end
        if film.cast.include?(Kevin_Bacon)
          if films.length < 7
            p films
          else
            puts "More than six movies are needed to connect to Kevin Bacon"
          end
        else
          checked_actors.push(current_actor)
          film.cast.each do |actor|
            if !checked_actors.include?(actor)
              actor.find_kevin_bacon(films, checked_actors, current_actor=actor)
            end
          end
        end
      end
    end
    checked_actors = []
  end
end
