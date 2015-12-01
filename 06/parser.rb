require_relative 'code'

class Parser

	def initialize (assembly_instructions)
		@assembly_instructions = assembly_instructions
		#p @assembly_instructions
		@machine_instructions = []
	end

	def parse
		@assembly_instructions.each do |instruction|
			if command_type(instruction) == :a_command #sybole: represent values with meaning 
				@machine_instructions << assemble_a_command(instruction)
			elsif command_type(instruction) == :c_command 
				@machine_instructions << assemble_c_command(instruction)
			end
		end
		@machine_instructions
	end

	def assemble_a_command(instruction)
		command = "0"
		command << constant(instruction[1..-1]) #-1 is last element of the array
	end

	def constant(value)
		"%015b" % value #format string translat the instruction to 15 dig bi number
	end

	def assemble_c_command(instruction)
		if instruction.include?"="
		all_ass_parts1 = instruction.split(%r{=\s*})
		comp_ass_part = all_ass_parts1[1]
		dest_ass_part = all_ass_parts1[0]
		jump_ass_part = all_ass_parts1[2]
		end
		
		if instruction.include?";"
		all_ass_parts2 = instruction.split(%r{;\s*})
		comp_ass_part = all_ass_parts2[0]
		dest_ass_part = all_ass_parts2[2]
		jump_ass_part = all_ass_parts2[1]
		end

		instruction = "111#{Code.comp(comp_ass_part)}#{Code.dest(dest_ass_part)}#{Code.jump(jump_ass_part)}"
	end

	def command_type(instruction)
		if instruction.start_with?("@")
			return :a_command
		else
			return :c_command		
		end	
	end

end #end Parser class