class Code

	DEST = {  #dest hash table dictionary
		nil   =>    '', #if nil return ""
		'M'   => '001', #if M return "001"
		'D'   => '010',
		'MD'  => '011',
		'A'   => '100',
		'AM'  => '101',
		'AD'  => '110',
		'AMD' => '111'

	}

	def dest(value)
		DEST[value]
	end

	def comp(value)

	end

	def jump(value)

	end

end #end Code class