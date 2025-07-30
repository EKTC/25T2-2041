nums = [1, 2, 3, 4, 5]

# List comprehension
squares = [x**2 for x in nums]
print(f"sqr: {squares}")

# Lambda
add = lambda a : a + 10
print(f"lambda add: {add(5)}")

# Enumerate 
for index, val in enumerate(nums):
    print(f"{index} : {val}")