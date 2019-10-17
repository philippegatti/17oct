class Show
	def self.display(board) #mise en forme du board
		boardcase = board
		puts "\n"*3
		puts " "*13+"    A      B      C    \n"
		print " "*10+"1  |"
		for i in 0..2
			if boardcase[i].value == nil
				print "|     |"
			else 
				print "|  #{boardcase[i].value}  |"
			end
		end
		puts "|"
		print " "*10+"2  |"
		for i in 3..5
			if boardcase[i].value == nil
				print "|     |"
			else 
				print "|  #{boardcase[i].value}  |"
			end
		end
		puts "|"
		print " "*10+"3  |"
		for i in 6..8
			if boardcase[i].value == nil
				print "|     |"
			else 
				print "|  #{boardcase[i].value}  |"
			end
		end
		puts "|"
		puts "\n"*3
	end
end
