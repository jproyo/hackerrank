def quicksort
  size = ARGF.gets
  raise "Error Arg. Size need to be provided" if size.nil?
  arr_str = ARGF.gets
  raise "Error Arg. Size need to be provided" if arr_str.nil?
  arr = arr_str.split(" ").map(&:to_i)
  quicksort_alg(arr,0,size.to_i-1)
end

def quicksort_alg(a, lo, hi)
  return if a.size <=1
  if lo < hi
    p = partition(a, lo, hi)
    puts a.join(" ")
    quicksort_alg(a, lo, p - 1)
    quicksort_alg(a, p + 1, hi)
  end
end

def partition(a, lo, hi)
  pivot = a[hi]
  i = lo
  for j in lo..hi
    if a[j] < pivot
      a[i], a[j] = a[j], a[i]
      i = i + 1
    end
  end
  a[i], a[hi] = a[hi], a[i]
  return i
end

quicksort
