def roll
  rand(1..20)
end

rolls = []
7.times do
  rolls.push(roll)
end

rolls.delete_at(rolls.index(rolls.min))
rolls.delete_at(rolls.index(rolls.max))

puts rolls