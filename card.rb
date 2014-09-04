class Card
  def initialize(face)
    @suit = face.values
    @rank = face.keys
    @face = face
  end

  def suit
    @suit.join
  end

  def rank
    @rank.join
  end

  def face
    @face
  end

  def value
    if rank == "A"
      "A"
    elsif rank.match(/[JQK]/)
      10
    else
      rank.to_i
    end
  end
end
