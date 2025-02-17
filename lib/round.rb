class Round
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift()
    return turn
  end

  def class
    current_card.class
  end

  def number_correct
    count = 0
    @turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    return count
  end

  def number_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.card.category == category
        if turn.correct?
          count += 1
        end
      end
    end
    return count
  end

  def percent_correct
    num = number_correct * 100 / @turns.size
  end

  def percent_correct_by_category(category)
    count = 0
    category_count = 0
    @turns.each do |turn|
      if turn.card.category == category
        category_count += 1
        if turn.correct?
          count += 1
        end
      end
    end
    num = count * 100 / category_count
  end

end
