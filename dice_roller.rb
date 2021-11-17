def roll
  rand(1..20)
end

rolls = []
7.times do
  rolls << roll
end

puts rolls - rolls.minmax