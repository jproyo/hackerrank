#!/bin/ruby
# Head ends here
def  stringSimilarity(a)
  split_substrings(a).inject(0) { |sum, w| sum + count_similar(a,w) }
end

def count_similar(orig,word)
  sum = 0
  word.chars.each_with_index do |c,i|
    break if orig[i].nil? or orig[i] != c
    sum += 1 if !orig[i].nil? && orig[i] == c
  end
  sum
end

def split_substrings(a)
  orig_str = a.dup
  subs = []
  unless orig_str.empty?
    begin
      subs << orig_str
      orig_str = orig_str[1..-1]
    end while !orig_str.empty?
  end
  subs
end

# Tail starts here

num= gets.strip.to_i
while num>0 do
  a=gets.strip
  puts stringSimilarity(a)
  num-=1
end
