# -*- coding: utf-8 -*-
"""
Created on Sun Sep  6 12:20:35 2020

streams.py

@author: jairp
"""


###############################################################################

### 1. Imports ### 

###############################################################################

### 2. streams  ### 

"""
Streams can also be thought as generators, they can be infinite sequences!
In Python: 
    - "yield" keyword produces the next element in the generator, 
    - execution gets stopped , and will only continue until next call 
"""

def to_stream(l:list): 
    for elem in l: 
        yield elem 

### TEST ### 
list1 = [1,2,3]
s1 = to_stream(list1)

print(next(s1)) # 1
print(next(s1)) # 2 
print(next(s1)) # 3 
print(next(s1)) # Stop iteration error
### TEST ### 


def ones_gen(): 
    """
    Produces an infinite stream of ones
    """
    while True: 
        yield 1 
        
### TEST ### 
ones = ones_gen() # initialize generator
ones_list = [next(ones) for i in range(10)]
print(ones_list)
### TEST ### 


def nums_from_n_gen(n:int): 
    """
    Produces stream of numbers from n 
    """
    while True: 
        yield n 
        n += 1  
        
### TEST ### 
nums_12 = nums_from_n_gen(12) 
nums_12_list = [next(nums_12) for i in range(20)] 
print(nums_12_list)

# we can even generate all natural numbers! 
nats = nums_from_n_gen(0)
### TEST ### 


def fib_stream(): 
    """
    Generates an infinite stream of fibonacci numbers 
    """
    a = 0 
    b = 1 
    yield a 
    while True: 
        yield b
        a, b = b, (a+b)
    
### TEST ### 
fibs = fib_stream()  # initialize stream 
fibnums = [next(fibs) for i in range(10)] # create a sample list  
print(fibnums)
### TEST ###  


def stream_map(fun, stream): 
    """
    map function applied to streams 
    """
    
    
