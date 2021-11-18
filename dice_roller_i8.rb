# def roll(range=1..20)
#   rand(range)
# end

# def dice_roller
#   k30_r2 = 0
#   k30_r1 = roll(1..30)
#   if (1..7).include?(k30_r1)
#     k30_r2 = roll(1..30)
#   end

#   loop do
#     @rolls = []
#     7.times do
#       @rolls.push(roll)
#     end

#     if(k30_r2 == 1)
#       @rolls.delete_at(@rolls.index(@rolls.min))
#       @rolls.delete_at(@rolls.index(@rolls.min))
#     else
#       @rolls.delete_at(@rolls.index(@rolls.min))
#       @rolls.delete_at(@rolls.index(@rolls.max))
#     end

    
#     break if @rolls.sum >= 55
#   end

#   if (24..30).include?(k30_r2)
#     @rolls.push(25)
#   else
#     @rolls.push(roll)
#   end


#   puts "Your randomly generated set: #{@rolls.join(' ')}. Are you happy?"
#   if gets.chomp != 'YES!'
#     dice_roller
#   else
#     return
#   end
# end

# dice_roller

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