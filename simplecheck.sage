load("data.sage")

def simplecheck(N:int, timelim = 2, debugproc = False, debugreturn = False):
    for P in primes:
        if N%P==0:
            if debugproc == True:
                print(f"{P}")
            return [P,N/P]
    if debugreturn == True:
        print("No factor in first 1000 primes")
    return N
        
