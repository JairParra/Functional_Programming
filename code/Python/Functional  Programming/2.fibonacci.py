# -*- coding: utf-8 -*-
"""
Created on Fri Aug 28 20:26:28 2020

fibonacci.py 
desc: Three different implementations of fibonacci. 
@author: jairp
"""

###############################################################################

### 1. Imports ### 

import time 

###############################################################################

### 2. Code  ### 

""" 
NOTE: 
    - The first definition is O(n^2) slow ! 
    - Using tail recursion, we can make this linear time
"""
def fib(n:int): 
    """
    Calculates a fibonacci number using the definition
    """
    # Base cases 
    if n == 0: 
        return 0 
    elif n == 1: 
        return 1 
    else: 
        # Recursive step 
        return fib(n-1) + fib(n-2) 
    
def fastfib(n:int): 
    """
    Calculates fibonacci uysing tail recursion 
    """ 
    def helper(m,a,b): 
        """ 
        Subfunction with extra parameters, actually carries the logic. 
        """
        if m == 0: 
            return a  # Base case 1  
        elif m == 1: 
            return b # Base case 2 
        else: 
            # Tail recursion step, note that we accumulate in the second argument 
            return helper(m-1, b, a+b) 
        
    # return actual input on subroutine 
    return helper(n,0,1)


# BONUS: Using dynamic programming 
def dynamicfib(n:int): 
    """
    Calculates the fibonacci using dynamic programming 
    """
    # Create a lookup dictionary 
    fibs = {} 
    
    # Hardcode base cases
    fibs[0] = 0 
    fibs[1] = 1 
    
    # Loop through the range of input n  
    for i in range(n+1): 
        # Check whether current fibonacci has been calculated; 
        # if not, then calculate, else ignore. 
        if i not in fibs.keys(): 
            fibs[i] = fibs[i-1] + fibs[i-2] 
            
    return fibs[n]

###############################################################################

### 3. Tests ### 

# Compare speeds 
t0 = time.time_ns()
print(fib(30) )
t1 = time.time_ns() 
print("fib took {} nanoseconds".format(t1-t0)) 

# Compare speeds 
t0 = time.time_ns()
print(fastfib(30) )
t1 = time.time_ns() 
print("fastfib took {} nanoseconds".format(t1-t0)) 

# Compare speeds 
t0 = time.time_ns()
print(dynamicfib(30) )
t1 = time.time_ns() 
print("dynamicfib took {} nanoseconds".format(t1-t0)) 

