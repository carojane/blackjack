class Deck
  def initialize
    suits = ['♠', '♣', '♥', '♦']
    ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
    @cards = []
    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new({rank=>suit})
        @cards << card.face
      end
    end
    @cards
  end

  def shuffle
    @cards = cards.shuffle
  end

  def cards
    @cards
  end

  def draw
    card = @cards.pop
  end
end
