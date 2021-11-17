def roll
  rand(1..20)
end
rolls = []

loop do
  rolls = []
  7.times do
    rolls << roll
  end
  rolls = rolls - rolls.minmax
  break if rolls.sum >= 55
end

rolls << roll

puts rolls