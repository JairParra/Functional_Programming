# -*- coding: utf-8 -*-
"""
Created on Sun Sep  6 10:52:46 2020

Higher order functions 

@author: jairp
"""

###############################################################################

### 1. Imports ### 

###############################################################################

### 2. zip  ### 

# let's build our own append/concat function 
def zipper(l1,l2): 
    """
    Takes two lists of same lenght and returns a list of paired objects. 
    @args: 
        -l1, l2: two lists of same length
    @returns: 
        - zipped: a list containing tuples of pairwise paired elements from l1 and l2
    """
    assert len(l1) == len(l2) 
    return [(l1[i],l2[i]) for i in range(len(l1))]


### TEST ###
abc = [letter for letter in "abcdefghijklmnopqrstuvwxyz"] 
nums = [i+1 for i in range(len(abc))] 
paired = zipper(abc, nums) 

# We can iterate through both at the same time
for tup in paired: 
    letter = tup[0] 
    num = tup[1] 
    print("letter: ", letter , " num: ", num) 
    
    
# We can iterate through both at the same time
for tup in zip(abc, nums): 
    letter = tup[0] 
    num = tup[1] 
    print("letter: ", letter , " num: ", num) 
### TEST ### 

###############################################################################

### 3. map  ### 

def mapper(fun, l:list): 
    """
    Applies a function to every element in the list 
    """
    return [fun(elem) for elem in l] 


### TESTS ### 
square = lambda x: x**2
pairs = [2,4,6,8,10] 
print("squred list: ", mapper(square, pairs))

squares = [x for x in mapper(square, pairs)]
### TESTS ### 


###############################################################################

### 4. filter  ### 

def filter_fun(test, l:list): 
    """
    @args: 
        - test: a function returning a boolean output
        - l: a list 
    @returns: 
        - filtered list of elements 
    """
    return [elem for elem in l if test(elem)] 




### TESTS ### 
even = lambda x: x % 2 == 0
nums = [1,2,3,4,5,6,6,7,8,8,9] 

print("nums: ", nums)
print("even numbers: ", filter_fun(even, nums) )


# Note: python returns an iterable! 
print([x for x in filter(lambda x: x< 6, pairs)])
### TESTS ### 


### BONUS: masking ## 
mask = lambda f, l: [f(x) for x in l] 
print(mask(even, nums))

###############################################################################

### 5. fold_left  ### 


# Note: the function below is pretty slow since slicing is actually costly. 
def fold_left(fun, acc, l:list): 
    """
    @args: 
        - fun: lambda x, y = fun(x,y)  
    @returns: 
        - fold_left f acc [x1,x2,...,xn] = (f (f (f a x1) x2) ... xn)
    """
    if len(l)==0: 
        return acc 
    else: 
        x = l[0] 
        return fold_left(fun, fun(acc, x), l[1:])
    
    
# a more pythonic way: 
def fold_left2(fun, acc, l:list): 
    """
    @args: 
        - fun: lambda x, y = fun(x,y)  
    @returns: 
        - fold_left f acc [x1,x2,...,xn] = (f (f (f a x1) x2) ... xn)
    """
    [acc := fun(acc, x) for x in l] 
    return acc
        
### TESTS ### 
add = lambda x,y: x + y  # simple function adding two numbers 
list5 = [1,2,3,4,5] 
print(fold_left(add, 0, list5)) # 15 
print(fold_left2(add, 0, list5)) # 15 
### TESTS ### 







