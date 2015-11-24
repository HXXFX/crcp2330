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

asm_filename = ARGV[0]

	unless arg_readable?(asm_filename)
		abort(" #{asm_filename} not found or is unreadable")
	end
		
	puts " The contents of #{asm_filename}"

#asm_file = File.open(asm_filename)
#puts asm_file.read #read give the content of the file

File.open(asm_filename) do |asm_file|
	asm_basename = File.basename(asm_filename, '.asm') #basename only keep basename delete .
	path = File.split(asm_filename)[0] #split [0] get the path other then file name
	hack_filename = "#{path}/#{asm_basename}.hack" 
	File.open(hack_filename, 'w') do |hack_file|
	assembler = Assembler.new(asm_file, hack_file)
	assembler.assemble!
	end
end












