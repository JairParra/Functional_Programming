# -*- coding: utf-8 -*-
"""
factorial.py 

desc: This script demonstrates multiple implementations of the fast factorial function, 
        along with usage examples. 
        
@author: jairp
"""
###############################################################################

# 1. Imports 
import time 

###############################################################################

# 2. Functions 

""" 
NOTE: 
    - Tail Recursion: There should be only one recursive call and it should be 
      outermost! 
"""

# Clear version 
def fastfact(n:int): 
    """
    Calculates the fast factorial function of an argument 
    using only recursion. 
    @args: 
        - n: Input integer
    """
    # define a helper function 
    def helper(m, acc): 
        """
        Uses an accumulator to perform the actual recursion. 
        @args: 
            - acc: acumulator variable 
        """
        if m == 0: 
            # Base case --> m is an acumulator 
            return acc
        else: 
            # Make progress towards target, accumulate in 
            return helper(m-1,m*acc)
        
    return helper(n,1) 

# Short version (do not write code like this!! )
def fastfact2(n:int): 
    helper = lambda m, acc: acc if m==0 else helper(m-1,m*acc) 
    return helper(n,1)

# Definition 
def slowfact(n:int): 
    """
    Calculates the factorial using the definition: n! = n*(n-1)
    """
    if n <= 0: 
        return 1 
    else: 
        return n*slowfact(n-1) 
    
###############################################################################

# 3. Speed tests 
    

# TEST 
print("Using slowfact")
for i in range(6): 
    print("{}!".format(i) , "=", slowfact(i))

print("Using fastfact")
for i in range(6): 
    print("{}!".format(i) , "=", fastfact(i))

# Compare speeds 
t0 = time.time_ns()
slowfact(1000) 
t1 = time.time_ns() 
print("slowfact took {} miliseconds".format(t1-t0)) 

# Compare speeds 
t0 = time.time_ns()
fastfact(1000) 
t1 = time.time_ns() 
print("fasctfact took {} miliseconds".format(t1-t0)) 



    
