puts "Rock, paper or scissor"
w = l = t = j = 0 # inline instanciation
# instanciate choice outside the loop otherwise it is recreate each turn
choice = %i(paper rock scissor) # use a literal symbols array to define choices

loop do # use do...end instead of {} for multilines
  if j == 10
    puts "wins : #{w}\nlosses : #{l}\ndraw:    #{t}"
    if w > l
      puts "You won the game"
    elsif w < l
      puts "You lost!"
    else
      puts "The game is a draw"
    end

    gets
    break
  end

  human = nil
  until choice.include?(human) # use of until and choice.include? to loop since human make a valid choice
    puts "Do your choice (paper, rock, scissor) :"
    human = gets.chomp.downcase.to_sym # String#to_sym convert string in symbol
  end

  com = choice.sample # use of Array#sample to make a random choice between all
  puts "You chose #{human}, computer choose #{com}"
  # use a simple if..else to check result which is more readable
  if (com == human)
    t += 1
    puts "---->draw"
  elsif (com == :scissor && human == :paper) || # details all com's wins is more expressif
        (com == :paper && human == :rock)    ||
        (com == :rock && human == :scissor)
    l += 1
    puts "---->Computer wins"
  else
    w += 1
    puts "---->You win"
  end

  j+=1 # the end of turn is here, so increment here
end
