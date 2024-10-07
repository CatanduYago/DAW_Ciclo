def criba(n):
    primos = []
    no_primos = [False] * 2 + [True] * (n - 1)
    for i in range(2, n + 1):
        if no_primos[i]:
            primos.append(i)
            for j in range(i * i, n + 1, i):
                no_primos[j] = False
    return primos

primosentre = criba(1000003)
print(primosentre)
