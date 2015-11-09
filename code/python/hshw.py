# Homework hs

def update(n):
    if (n % 2 == 0):
        n = n // 2
        return(n)
        print(n)
    else:
        n = 3*n + 1
        return(n)
        print(n)

def update2(n):
    x = 1
    while (n != 1):
        n = update(n)
        print(n)
        x = x + 1
    print(x)

def hs(n):
    if (n != 1):
        print(n)
        update2(n)
        print("None")
    else:
        print("1")
        print("1")
        return("None")

