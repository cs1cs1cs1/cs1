# TYPE CHECKING DEMO

def foo(n):
    return n + 3

print(foo(6))

# print is a "procedure" that affects the world by printing on console
print("Happy Birthday Boole!")

print(None)

{}
x=5
# { (x,5) }
print(x)
# { (x,5) }
x=6
# { (x,6) }
print(x)
# { (x,6) }
y=7
# { (x,6), (y,7) }
print(y)
# { (x,6), (y,7) }
print(x)
