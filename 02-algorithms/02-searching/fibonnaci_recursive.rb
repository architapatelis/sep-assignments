
 def fib_recursive(n)
   if (n == 0)
     # #1
     return 0
   elsif (n == 1)
     # #2
     return 1
   else
     # #3
     return fib_recursive(n-1) + fib_recursive(n-2)
   end
 end
