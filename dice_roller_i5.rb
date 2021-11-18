class DiceRoller
  def initialize(num_of_rolls, expected_rolls_value)
    @num_of_rolls = num_of_rolls
    @expected_rolls_value = expected_rolls_value
    @rolls = []
  end

  def main

    loop do
      @rolls = []
      @num_of_rolls.times do
        @rolls.push(roll)
      end

      if (1..7).include?(roll(1..30)) && roll(1..30) == 1
        remove_rolled_number(@rolls.min)
        remove_rolled_number(@rolls.min)
      else
        remove_rolled_number(@rolls.min)
        remove_rolled_number(@rolls.max)
      end

      
      break if @rolls.sum >= @expected_rolls_value
    end

    @rolls.push(roll)

    puts @rolls
  end

  private

  def remove_rolled_number(number)
    @rolls.delete_at(@rolls.index(number))
  end

  def roll(range=1..20)
    rand(range)
  end
end

dice_roller = DiceRoller.new(7, 55)
dice_roller.main