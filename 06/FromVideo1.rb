#! /usr/bin/env ruby

#if there is one argument 
#	and the argument ends in .asm
#	then we good

#Any non nil value == ture
#nil and false == false

class Assembler
	def initialize(asm_file, hack_file) #constrctor
	@asm_file = asm_file #member variable
	@hack_file = hack_file 

	@asm_instructions = instructions_from_file
	p @asm_instructions
	#@parser = Parser.new(@asm_instructions)
	end

	def assemble! #method
		#puts @asm_file.read #read give the content of the file
		
		# hack_instructions = parser.assemble
		# @hack_file << hack_instructions
	end

	def instructions_from_file
		lines = @asm_file.readlines #readlines puts each line into an array
		lines.each do |line|
			line.gsub! /\/\/.*/, ''  #gsub! ignore line start witn //
			line.strip! #strip! ignore end line char /n
		end
		lines.delete("") #delete the empty boxes in the array
		return lines
	end

end#end Assembler class

def arg_valid?
	ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1
end

def arg_readable?(path)
	File.readable?(path)	
end

def hack_filename(asm_filename)
	asm_basename = File.basename(asm_filename, '.asm') #basename only keep basename delete .
	path = File.split(asm_filename)[0] #split [0] get the path other then file name
	"#{path}/#{asm_basename}.hack" 
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
	File.open(hack_filename(asm_filename), 'w') do |hack_file|
	assembler = Assembler.new(asm_file, hack_file)
	assembler.assemble!
	end
end
