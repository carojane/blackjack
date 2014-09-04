class Hand
  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def cards
    @cards
  end

  def draw
    cards << @deck.draw
  end

  def value
    value = 0
    aces = []
    cards.each do |card|
      indvcard = Card.new(card)
      card_value = indvcard.value
        if card_value == "A"
          aces << "A"
        else
          value += card_value
        end
    end
    if aces != []
      if aces.length == 1
        if value <= 10
          value += 11
        else
          value += 1
        end
      elsif aces.length == 2
        if value <= 9
          value += 12
        else
          value += 2
        end
      elsif aces.length == 3
        if value <= 8
          value += 13
        else
          value += 3
        end
      else
        if value <= 7
          value += 14
        else
          value += 4
        end
      end
    end
    value
  end
end
