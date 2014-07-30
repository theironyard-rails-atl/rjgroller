# Q: Write a script to read list of lines from a file and print one at random

def sample_line(fname)
  File.readlines(fname).sample.strip
end
