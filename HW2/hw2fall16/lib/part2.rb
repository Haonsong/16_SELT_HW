class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # YOUR CODE HERE
  player1 = game[0][1].upcase
  player2 = game[1][1].upcase
  raise NoSuchStrategyError unless ['R','P','S'].include? player1
  raise NoSuchStrategyError unless ['R','P','S'].include? player2
  
  strategy_table = Hash['R'=> 0,'P'=> 1,'S' => 2]
  
  result = strategy_table[player1]-strategy_table[player2]
  
  # -1, +2,  => player2 
  # +1, -2, 0  => player1
  if ([-1,+2].include? result) then 
    #putc game[1][1]
    return game[1]
  else 
    return game[0]
  end
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
  raise WrongNumberOfPlayersError unless tournament.length == 2
  if tournament[0].class == String
    return tournament
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]),rps_tournament_winner(tournament[1])])
  end

end

#feel free to add your own helper functions as needed
