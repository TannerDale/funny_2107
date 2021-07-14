require './lib/user'
require './lib/joke'

class OpenMic
  attr_reader :location, :date, :performers

  def initialize(args)
    @location = args[:location]
    @date = args[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    jokes = all_jokes

    jokes != jokes.uniq
  end

  def all_jokes
    @performers.map { |perfomer|
      perfomer.jokes
    }.flatten
  end
end
