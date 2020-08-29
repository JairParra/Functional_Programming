# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import time 

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


def fastfact2(n:int): 
    helper = lambda m, acc: acc if m==0 else helper(m-1,m*acc) 
    return helper(n,1)


def slowfact(n:int): 
    """
    Calculates the factorial using the definition: n! = n*(n-1)
    """
    if n <= 0: 
        return 1 
    else: 
        return n*slowfact(n-1) 
    

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


def replace_letter(word): 
    # letters to interchange 
    letters = 'abcdefghijklmnopqrstuvwxyz'
    
    # splitting and replacing functions 
    splits = lambda word: [(word[:i],word[i:]) for i in range(len(word)) if word[i:]]
    replaces = lambda split_l: {w1 + letter + w2[1:] for w1,w2 in split_l if w2 for letter in letters}
    
    # result as a sorted list 
    replace_l = sorted(replaces(splits(word))-{word})
    
    return replace_l
    


print("All replacements of UwU: \n",replace_letter("UwU") )
    
    
    
