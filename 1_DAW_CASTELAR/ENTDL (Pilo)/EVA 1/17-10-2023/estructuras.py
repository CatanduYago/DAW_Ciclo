def esPar(n):
    if n%2==0: 
        flag=1   #es par
    elif n%2!=0:
        flag=0 #es impar
    return flag

n=int(input("Dame un número: "))
while esPar(n)==0:
    n=int(input("Dame un número: "))
print(f"El número {n} es par")