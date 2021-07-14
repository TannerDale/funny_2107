require './lib/user'
require './lib/joke'
require './lib/open_mic'

RSpec.describe OpenMic do
  context 'initialize' do
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    it 'exists' do
      expect(open_mic).to be_a(OpenMic)
    end

    it 'has a location' do
      expect(open_mic.location).to eq("Comedy Works")
    end

    it 'has a date' do
      expect(open_mic.date).to eq("11-20-18")
    end

    it 'has no performers by default' do
      expect(open_mic.performers).to eq([])
    end
  end

  context 'adding performers' do
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    user_1 = User.new("Sal")
    user_2 = User.new("Ali")

    it 'can welcome and add performers' do
      open_mic.welcome(user_1)
      open_mic.welcome(user_2)

      expect(open_mic.performers).to eq([user_1, user_2])
    end
  end

  context 'jokes' do
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    user_1 = User.new("Sal")
    user_2 = User.new("Ali")

    open_mic.welcome(user_1)
    open_mic.welcome(user_2)

    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")


    it 'can recognize repeated jokes' do
      user_2.learn(joke_1)
      user_2.learn(joke_2)

      expect(open_mic.repeated_jokes?).to be(false)

      user_1.learn(joke_1)

      expect(open_mic.repeated_jokes?).to be(true)
    end

    it 'knows all jokes' do
      user_2.learn(joke_1)
      user_2.learn(joke_2)
      user_1.learn(joke_1)

      expect(open_mic.all_jokes).to eq([joke_1, joke_2, joke_1])
    end
  end
end
