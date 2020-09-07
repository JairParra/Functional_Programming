# -*- coding: utf-8 -*-
"""
Created on Sat Sep  5 15:53:58 2020

@author: jairp
"""

###############################################################################

### 1. Imports ### 

###############################################################################

### 2. Pattern matching ### 

### 2.1 Pattern matching a tuple 

def add_tup(tup): 
    """
    Will match the input tuple and return the result. 
    """ 
    if isinstance(tup, tuple) and len(tup)==2 : 
        m, n = tup 
        if m == 0: 
            return n 
        elif n == 0 : 
            return m 
        else:         
            return m+n 
    else: 
        raise TypeError("Incorrect value type")
        
###############################################################################

### 3. List functions ### 

## 3.1 Zipper 

# we can append at the beginning of a list in O(1) time
ex_list = [] 
ex_list.append("fd") 

# however inserting at the beginning is costly! O(n) 
ex_list.insert(0,"noooo")

"""
NOTE: 
    In Python, lists are implemented as arrays. Therefore appending to, or 
    popping to the end of the list, as well as element setting and retrieval 
    are all O(1) worst case. 
"""
 
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


def zipper_fun(l1,l2): 
    """
    Takes two lists of same lenght and returns a list of paired objects. 
    @args: 
        -l1, l2: two lists of same length
    @returns: 
        - zipped: a list containing tuples of pairwise paired elements from l1 and l2
    """
    assert len(l1) == len(l2) 
    
    # Verify that lists are not empty 
    if len(l2) > 0: 
        x, y = l1.pop() 
        return  zipper_fun(l1[:-1], l2[:-1]) + [(l1[-1],l2[-1])]
    else:
        return [] # base case 
    

### TESTS ### 
list1 = [0,1,2,3] 
list2 = ['a','b','c','d'] 

print("list1: ", list1) 
print("list2: ", list2) 

print("zipper: ", zipper(list1,list2))
print("zipper_fun: ", zipper_fun(list1,list2))
### TESTS ### 


### 3.2 Reversing a list 

# Naive way
def reverse_list(l:list): 
    """
    @args: 
        - l: a list
    @returns: 
        - reversed list 
    """
    rev_list = [] 
    for i in range(len(l)): 
        rev_list.append(l[-(i+1)])
    
    return rev_list 


# functional way  
def rev_list_fun(l:list): 
    """
    @args: 
        - l: a list
    @returns: 
        - reversed list 
    """
    def helper(l:list, acc:list): 
        if len(l) == 0: 
            return acc  # base case 
        else: 
            return helper(l.pop(), acc.append(l))
        
    return helper(l,[])


list3 = [1,2,3,4,5] 

print(reverse_list(list3))
print(rev_list_fun(list3))

            
        
        
        
        
        
        
        
        
        
        
        
        
        
        