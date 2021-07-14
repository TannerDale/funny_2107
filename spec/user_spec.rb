require './lib/joke'
require './lib/user'

RSpec.describe User do
  context 'initialize' do
    user = User.new("Sal")

    it 'exists' do
      expect(user).to be_a(User)
    end

    it 'has a name' do
      expect(user.name).to eq("Sal")
    end

    it 'has no jokes by default' do
      expect(user.jokes).to eq([])
    end
  end

  context 'joke adding' do
    user = User.new("Sal")
    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")

    it 'can learn a joke' do
      user.learn_joke(joke_1)

      expect(user.jokes).to eq([joke_1])

      user.learn_joke(joke_2)

      expect(user.jokes).to eq([joke_1, joke_2])
    end
  end
end
