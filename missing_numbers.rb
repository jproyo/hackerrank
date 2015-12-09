require 'set'

def missing
  amount_list_a = ARGF.gets.to_i
  raise "Error amount in list A" if amount_list_a < 1 or amount_list_a > 1000010
  list_a = ARGF.gets.split(" ").map(&:to_i)
  amount_list_b = ARGF.gets.to_i
  raise "Error amount in list B" if amount_list_b < 1 or amount_list_b > 1000010
  list_b = ARGF.gets.split(" ").map(&:to_i)
  raise "Error in B limit list" unless (list_b.max-list_b.min) < 101
  hash_list_a = Hash.new(0)
  list_a.each do |a|
    hash_list_a[a] += 1 if a >= 1 and a <= 10000
  end
  hash_list_b = Hash.new(0)
  list_b.each do |b|
    hash_list_b[b] += 1 if b >= 1 and b <= 10000
  end
  missings = Set.new
  hash_list_b.each_key do |k|
    missings << k unless hash_list_a.has_key?(k)
    missings << k if hash_list_a.has_key?(k) && hash_list_a[k] < hash_list_b[k]
  end
  puts missings.to_a.sort.join(" ")
end

missing
  
