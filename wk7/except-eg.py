# Depending if we initialise `x` will make it run successfully or not

x = 1
try:
  print(x)
except NameError:
  print("Variable x is not defined")
except:
  print("Something else went wrong")