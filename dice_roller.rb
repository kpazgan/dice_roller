def roll(range=1..20)
  rand(range)
end

def dice_roller
    k30_roll1 = roll(1..30)
    if (1..7).include?(k30_roll1)
      @k30_roll2 = roll(1..30)
    end

    loop do
      @rolls = []
      7.times do
        @rolls << roll
      end
      if @k30_roll2 == 1
        @rolls -= @rolls.min
        @rolls -= @rolls.min
      else
        @rolls -= @rolls.minmax
      end
      break if @rolls.sum >= 55
    end

    if (24..30).include?(@k30_roll2)
      @rolls << 25
    else
      @rolls << roll
    end

    puts "Your randomly generated set: #{@rolls.join(" ")}. Are you happy?"
    is_happy = gets.chomp
    if is_happy != 'YES!'
      dice_roller
    end
end

dice_roller