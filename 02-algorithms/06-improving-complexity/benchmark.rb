require 'benchmark'
require_relative 'poorly_written_ruby'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'

array1 = (1..200).to_a.shuffle!
array2 = (1..200).to_a.shuffle!
array3 = (1..200).to_a.shuffle!

array4 = (1..1000).to_a.shuffle!
array5 = (1..1000).to_a.shuffle!
array6 = (1..1000).to_a.shuffle!

Benchmark.bm(100) do |x|
  x.report('poorly written 200:')  {poorly_written_ruby(array1, array2, array3)}
  x.report('code optimizations 200:') {code_optimizations(array1, array2, array3)}
  x.report('merge sort 200:')  {merge_sort(array1, array2, array3)}
  x.report('heap sort 200:')    {heap_sort(array1, array2, array3)}
  puts "---------------------------------"
  x.report('poorly written 1k:')  {poorly_written_ruby(array4, array5, array6)}
  x.report('code optimizations 1k:') {code_optimizations(array4, array5, array6)}
  x.report('merge sort 1k:')  {merge_sort(array4, array5, array6)}
  x.report('heap sort 1k:')    {heap_sort(array4, array5, array6)}
end
