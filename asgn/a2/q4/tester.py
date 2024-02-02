def f(n, k):
    if n == 0 and k == 0:
        return 1
    elif n > 0 and k == 0:
        return 0
    elif n == 0 and k > 0:
        return 0
    else:
        return (n - 1) * f(n - 1, k) + f(n - 1, k - 1)

def main():
    n = int(input("Enter a value for n: "))
    k = int(input("Enter a value for k: "))
    result = f(n, k)
    print(f"f({n}, {k}) = {result}")

if __name__ == "__main__":
    main()