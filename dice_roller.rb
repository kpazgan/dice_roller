def roll(range=1..20)
  rand(range)
end

k30_roll1 = roll(1..30)
if k30_roll1 >= 1 && k30_roll1 <= 7
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

@rolls << roll

puts @rolls