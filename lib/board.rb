class Board
	attr_accessor :boardcase

	def initialize
		@boardcase = create_boardcase()
	end

	def create_boardcase() #création des cases composant le plateau de jeu
		boardcase=[]
		for i in 1..3
			for j in "A".."C"
				boardcase << Boardcase.new([j,i])
			end
		end
		return @boardcase = boardcase
	end

	def tick_case(boardcase, player_pawn) #fonction permettant de mettre à jour la valeur d'une case quand un joueur joue
		if boardcase.is_free?
			boardcase.value = player_pawn
			return true
		else
			return false
		end
	end

  def show_state #affichage de l'état du plateau de jeu
  	Show.display(@boardcase)
  end

	def player_win(player_pawn) #def des 8 combinaisons permettant à un joueur de gagner
		(@boardcase[0].value == player_pawn && @boardcase[1].value == player_pawn && @boardcase[2].value == player_pawn)||(@boardcase[3].value == player_pawn && @boardcase[4].value == player_pawn && @boardcase[5].value == player_pawn)||(@boardcase[6].value == player_pawn && @boardcase[7].value == player_pawn && @boardcase[8].value == player_pawn)||(@boardcase[0].value == player_pawn && @boardcase[3].value == player_pawn && @boardcase[6].value == player_pawn)||(@boardcase[1].value == player_pawn && @boardcase[4].value == player_pawn && @boardcase[7].value == player_pawn)||(@boardcase[2].value == player_pawn && @boardcase[5].value == player_pawn && @boardcase[8].value == player_pawn)||(@boardcase[0].value == player_pawn && @boardcase[4].value == player_pawn && @boardcase[8].value == player_pawn)||(@boardcase[2].value == player_pawn && @boardcase[4].value == player_pawn && @boardcase[6].value == player_pawn)
	end

	def is_full? # verifie s'il reste des places libres sur le plateau (sinon la partie s'arrete)
		@boardcase.count{|boardcase| boardcase.value == nil} == 0
	end
end
