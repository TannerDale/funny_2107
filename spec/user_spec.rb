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
      user.learn(joke_1)

      expect(user.jokes).to eq([joke_1])

      user.learn(joke_2)

      expect(user.jokes).to eq([joke_1, joke_2])
    end
  end

  # iteration 3
  context 'telling and finding jokes' do
    user_1 = User.new("Sal")
    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")

    user_1.learn(joke_1)
    user_1.learn(joke_2)

    it 'can tell a joke to a user to learn' do
      user_2 = User.new("Ali")

      user_1.tell(user_2, joke_1)
      expect(user_2.jokes).to eq([joke_1])

      user_1.tell(user_2, joke_2)
      expect(user_2.jokes).to eq([joke_1, joke_2])
    end

    it 'can find a joke by id' do
      user_2 = User.new("Ali")
      user_1.tell(user_2, joke_1)
      user_1.tell(user_2, joke_2)

      expect(user_2.joke_by_id(22)).to eq(joke_1)
      expect(user_2.joke_by_id(13)).to eq(joke_2)
    end
  end
end
