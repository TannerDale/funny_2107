requrie './lib/joke'

RSpec.describe Joke do
  context 'initialize' do
    joke = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    it 'exist' do
      expect(joke).to be_a(Joke)
    end

    it 'has an id' do
      expect(joke.id).to eq(22)
    end

    it 'has a set up' do
      expect(joke.setup).to eq("Why did the strawberry cross the road?")
    end

    it 'has a punchline' do
      expect(joke.punchline).to eq("Because his mother was in a jam.")
    end
  end
end
