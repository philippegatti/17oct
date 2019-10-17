class Game
	attr_accessor :players
	attr_accessor :board
		@@player1_victories = 0 #on initie des variables de classe pour les compteurs afin de conserver l'information après chaque single_game
		@@player2_victories = 0
		@@dawn = 0


	def initialize (players)
		@players = players #on récupère les players créés par Application
		@board = Board.new #création d'un nouveau tableau
	end

	def player_turn(player1)
		menu(player1)
		action = gets.chomp.to_i - 1
		while @board.tick_case(@board.boardcase[action],player1.pawn) == false #on verifie que la case choisie est bien libre
			system("clear")
			puts "Cette case n'est pas dispnible"
			puts "Veuillez choisir une case libre"
			@board.show_state
			menu(player1)
			action = gets.chomp.to_i - 1
		end
		@board.tick_case(@board.boardcase[action],player1.pawn) # une attribue le symbole du joueur à la case qu'il vient de jouer
		system("clear")
		@board.show_state # on affiche le plateau à jour
	end

	def menu(player)
		puts "#{player.name}, que voulez vous jouer?\n\n"
		for i in 1..@board.boardcase.size
			if @board.boardcase[i-1].is_free? # on affiche uniquement les cases libres comme option de jeu
				print "Tapez #{i} pour jouer la case " # par simpliciter un utilise un indexe numéroté plutot que les noms des cases pour jouer
				print @board.boardcase[i-1].position[0]
				print @board.boardcase[i-1].position[1]
				puts ""
			end
		end
	end

	def single_game
		system("clear")
		@board.show_state
		while is_ongoing? # tant que la partie est en cours les joueurs continuent à jouer successivement
			player_turn(@players[0])
			if is_ongoing?
				player_turn(@players[1])
			end
		end
		puts "La partie est finie"
		if @board.player_win(@players[0].pawn)
			@@player1_victories += 1
			puts "#{@players[0].name} a gagné cette partie, bravo!!!\n\n"
		elsif @board.player_win(@players[1].pawn)
			@@player2_victories += 1
			puts "#{@players[1].name} a gagné cette partie, bravo!!!\n\n"
		else 
			puts "Match nul... try again!\n\n"
			@@dawn += 1
		end
		if @@player2_victories > @@player1_victories
			puts "#{@players[1].name} mène avec #{@@player2_victories} victoire(s) contre seulement #{@@player1_victories} pour #{@players[0].name} et #{@@dawn} match(s) nul(s=."
		elsif @@player1_victories > @@player2_victories
			puts "#{@players[0].name} mène avec #{@@player1_victories} victoire(s) contre seulement #{@@player2_victories} pour #{@players[1].name} et #{@@dawn} match(s) nul(s)."
		else 
			puts "Egalité totale entre les 2 joueurs : #{@@player1_victories}victoire(s) partout et #{@@dawn} match(s) nul(s)"
		end
		puts "Tapez 1 pour rejouer une partie"
			new_game = gets.chomp.to_i
		return new_game # renvoie du choix d'une nouvelle partie vers la boucle dans Application
	end

	def is_ongoing? # la partie est en cours tant qu'un joueur n'a pas gagné et qu'il reste des cases vides sur la grille
		@board.is_full? == false && @board.player_win(@players[0].pawn) == false && @board.player_win(@players[1].pawn) == false
	end

end


