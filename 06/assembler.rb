# Expect the path and name to an .asm file.
# Open that .asm file
# Print the contents of that .asm file to the console (use puts)

# Tip: Ruby File I/O
# Tip: ARGV

begin
input_file = File.open(ARGV[0], "r")
rescue => e
put e
end

asm_lines = []
input_file.readlines.each do |line|
	asm_lines << line
end

def dont_read_this?(line)
	line.include?("//") || line.empty?
end

asm_instructions = []
asm_lines.each do |line|
	line.strip!
	asm_instructions << line unless dont_read_this? line
end





def name_output_file outputfile
	outputfile.delete()

end

puts asm_instructions
output_file_name = "#{ARGV[0]}.jack"
output_file = File.open(output_file_name, "w")
output_file.puts asm_instructions
output_file.close