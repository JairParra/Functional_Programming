# -*- coding: utf-8 -*-
"""
Created on Sat Aug 29 09:45:02 2020

@author: jairp
"""

###############################################################################

### 1. Imports ### 

###############################################################################

### 2. Code ### 

# helper functions 
even = lambda x: x % 2 == 0 
odd = lambda x: x % 2 == 1 

def exp(n:int, exp:int): 
    """ 
    Performs exponentiation using the definition. 
    We ignore case in which exponent is negative for simplicity. 
    """ 
    for i in range(1,exp): 
        n = n*n 
        
    return n 


def rpe_exp(x:int, m:int): 
    """ 
    Calculates exponential using Russian Peasant Exponentiation algorithm. 
    @args: 
        - x: base integer 
        - m: power 
    """ 
    if x == 0: 
        return 0 
    elif x == 0: 
        return 1 
    else: 
        if odd(m): 
            # if power is odd, recurse on even power 
            # x^(m+1) = x*x^{m}  // m is even now 
            return x * rpe_exp(x,m-1) 
        else: 
            # if power is even, can calculate only on one part, then return the product! 
            # note we only need half the calls in this case 
            temp = rpe_exp(x,m/2) 
            return temp*temp 
        
        
def fast_rpe_exp(x:int, m:int): 
    """
    Calculates exponential using the rpe algorithm , but using Tail-recursion
    """ 
    def helper(x, m, acc): 
        """
        @args: 
            - x: base 
            - m: power 
            - acc: accumulator variable 
        """
        if x == 0: 
            return 0 
        elif m == 0: 
            return 1 
        else: 
            if odd(m): 
                # We accumulate the result in acc instead of keeping in the heap 
                return helper(x, m-1, acc*x) 
            else: 
                # half power by hald, and accumulate! 
                return helper(x, m/2, acc*acc) 
            
    return helper(x, m, 1) 

        
# BONUS: Partial sum 

def partial_sum(lo, hi): 
    """
    Sums all integers from lo to high 
    Note: Not tail recursive! 
    """
    if lo > hi: 
        return 0 
    else: 
        return lo + partial_sum(lo+1, hi) 

    
def fast_partial_sum(lo,hi): 
    """
    Tail-recursive version of the above 
    """ 
    def helper(lo, hi, acc): 
        """
        @args: 
            - lo: lower limit 
            - hi: higher limit 
            - acc: accumulator 
        """
        if lo > hi: 
            return acc 
        else: 
            # increase lower limit, and accumulate result in acc 
            return helper(lo+1, hi, acc_lo) 
        
    return helper(lo, hi, 0)

###############################################################################

### 3. Tests ### 

