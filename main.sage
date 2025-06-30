import time
from sage.plot.scatter_plot import ScatterPlot

load("simplecheck.sage")
load("pollard-rho.sage")

def unsmoothN(a, b=-Infinity, TERMS = randint(1,5)):
    outval = 1
    if b==-Infinity:
        b = 2*a
    if a>b:
        a,b = b,a
    for i in range(TERMS):
        K = next_prime(randint(a,b))
        outval = outval * K
    print(f"numterms = {TERMS}, outval = {outval}")
    return outval

FACTORIZERS = [simplecheck,pollard_rho]

def factorise(N:int, timelim = 2, debugproc = False, debugreturn = False):
    for K in range(len(FACTORIZERS)):
        func = FACTORIZERS[K]
        if debugproc == True:
            print(f"{func}")
        output = func(N=N, timelim=timelim, debugproc=debugproc , debugreturn=debugproc)
        if output == N:
            continue
        else:
            return output
    return N


def demonstration(nums:list, gengraphs = False):
    timelims = []
    functimes = []
    factors = []
    for i in range(len(nums)):
        
        flexitime = max(floor(log(nums[i], 100)), 5)
        timelims.append(flexitime)
        print(f"completing number {i}, flexitime = {flexitime}")
        
        STARTTIME = time.time()
        K = factorise(nums[i],timelim = flexitime)
        ENDTIME = time.time()
        
        factors.append(K)
        
        functimes.append(ENDTIME-STARTTIME)
        
    for j in range(len(nums)):
        print(f"\nindex = {j}, num = {nums[j]}, factored to product of {factors[j]}, times  = {timelims[j],functimes[j]}")
    
    print(f"time to finish = {sum(functimes)}")

    if gengraphs == True:
        show(scatter_plot([[A,functimes[A]] for A in range(len(nums))], marker = 's', title="time taken for factorising nums[i]"))
        show(scatter_plot([[A,nums[A]] for A in range(len(nums))], marker = 's', title = "nums[i]"))
        show(scatter_plot([[A,timelims[A]] for A in range(len(nums))], marker = 's', title = "time limit for each iteration of factorisation functions on nums[i]"))



