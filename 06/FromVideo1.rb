#! /usr/bin/env ruby

#if there is one argument 
#	and the argument ends in .asm
#	then we good

#Any non nil value == ture
#nil and false == false

def arg_valid?
	ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1
end

def arg_readable?(path)
	File.readable?(path)	
end

	unless arg_valid?
	 	abort(" Do this way MOTHERF*CKER-> ruby ThisFileName.rb GoodShit.asm")
	end

AsmFileName = ARGV[0]

	unless arg_readable?(AsmFileName)
		abort(" #{AsmFileName} not found or is unreadable")
	end
		
	puts " The contents of #{AsmFileName}"

AsmFile = File.open(AsmFileName)
puts AsmFile.read #read give the content of the file