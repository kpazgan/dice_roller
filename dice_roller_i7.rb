def roll(range=1..20)
  rand(range)
end

loop do
  k30_r2 = 0
  k30_r1 = roll(1..30)
  if (1..7).include?(k30_r1)
    k30_r2 = roll(1..30)
  end

  loop do
    @rolls = []
    7.times do
      @rolls.push(roll)
    end

    if(k30_r2 == 1)
      @rolls.delete_at(@rolls.index(@rolls.min))
      @rolls.delete_at(@rolls.index(@rolls.min))
    else
      @rolls.delete_at(@rolls.index(@rolls.min))
      @rolls.delete_at(@rolls.index(@rolls.max))
    end

    
    break if @rolls.sum >= 55
  end

  if (24..30).include?(k30_r2)
    @rolls.push(25)
  else
    @rolls.push(roll)
  end


  puts "Your randomly generated set: #{@rolls.join(' ')}. Are you happy?"
  break if gets.chomp == 'YES!'
end