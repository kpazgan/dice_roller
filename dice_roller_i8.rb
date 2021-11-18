class DiceRoller

  def initialize(num_of_rolls, expected_rolls_value)
    @num_of_rolls = num_of_rolls
    @expected_rolls_value = expected_rolls_value
  end

  def main

    loop do
      self.results = []
      # num_of_rolls.times { results.push(roll) }
      roller(7)

      if (1..7).include?(roll(30)) && roll(30) == 1
        2.times { remove_rolled_number(results.min) }
      else
        remove_rolled_number(results.min)
        remove_rolled_number(results.max)
      end

      
      break if results.sum >= expected_rolls_value
    end

    results.push(roll)

    puts "Your randomly generated set: #{results.join(' ')}. Are you happy?"
  if gets.chomp != 'YES!'
    self.main
  else
    return
  end
  end

  private

  attr_accessor :num_of_rolls, :expected_rolls_value, :results

  def remove_rolled_number(number)
    results.delete_at(results.index(number))
  end

  def roll(max=20)
    rand(1..max)
  end

  def roller(rolls, max_range=20, iterator=1)
    if iterator >= rolls
      return
    else
      results.push(roll(max_range))
      iterator += 1
      self.roller(rolls, max_range, iterator)
    end
  end
end

dice_roller = DiceRoller.new(7, 55)
dice_roller.main