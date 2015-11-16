# Expect the path and name to an .asm file.
# Open that .asm file
# Print the contents of that .asm file to the console (use puts)

# Tip: Ruby File I/O
# Tip: ARGV

file = File.open("add/Add.asm", "r")
contents = file.read
puts contents
