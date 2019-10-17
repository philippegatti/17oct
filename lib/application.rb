class Application
	attr_accessor :players
	attr_accessor :game

	def initialize
		@players = name_players() #fonction permettant de créer les 2 joueurs et définir leur pion (x ou o)
		@game = create_game() # fonction lançant les parties
	end

	def create_game
		games = []
		puts "Tapez Entrer pour lancer une première partie !"
		gets.chomp
		new_game = 1
		while new_game == 1
			new_game = Game.new(@players).single_game # A la fin de chaque partie les joueurs peuvent taper un pour relancer une partie sinon on sort de la boucle et le message de fin s'affiche
		end
		puts "Merci d'avoir joué avec nous ! \n\n BONNE JOURNEE!!!"
	end
	
	def name_players
		players=[]
		system("clear")
		puts "Bienvenue dans notre jeu de morpions \n"
		puts "Veuillez entrer le nom du premier joueur"
		print "> "
		player1_name = gets.chomp
		puts "#{player1_name}, voulez-vous prendre les x ou les o? "
		print "> "
		player1_pawn = gets.chomp
		while player1_pawn.downcase != "x" && player1_pawn.downcase != "o"
			puts "Veuillez choisir x ou o"
			print "> "
			player1_pawn = gets.chomp.downcase
		end
		if player1_pawn.downcase == "x" # on attribue automatiquement l'autre pion au joueur n2 pour etre sur qu'ils en ont un différent
				player2_pawn = "o"
			else 
				player2_pawn = "x"
		end
		puts "Veuillez entrer le nom du second joueur"
		print "> "
		player2_name = gets.chomp
		puts "#{player1_name} jouera donc avec les #{player1_pawn} et #{player2_name} avec les #{player2_pawn}! " #création des 2 joueurs de classe player
		players << Player.new(player1_name,player1_pawn)
		players << Player.new(player2_name,player2_pawn)
		return @players = players
	end
end

