import time

def Q1(val,N):
    return (val*val + 1) % N
def Q2(val,N):
    return (val*val + val) % N
def Q3(val,N):
    return (val*val + 2*val+1) % N
def Q4(val,N):
    return (val*val + val + 1) % N
def Q5(val,N):
    return (val*val)%N
def C1(val,N):
    return (val*val*val + 1) % N
def C2(val,N):
    return (val*val*val + 3*val*val + 3*val  + 1) % N
def C3(val,N):
    return (val*val*val + val) % N
def QU1(val,N):
    return (5*val**4 + 4*val**3 + 3*val**2 + 2*val + 1) % N
def QUI1(val,N):
    return (val**5 + 5*val**3 + 5*val**2 + 1) %N

functions = [Q1,Q2,Q3,Q4,Q5,C1,C2,C3,QU1,QUI1]

def pollard_rho(N:int, mode=0, initval = 1, timelim = 2, debugproc = False, debugreturn = False):
    A_n =  [initval]
    A_2n = [initval]
    diffs = [0]
    t = 1
    listperiod = 1
    STARTTIMETRUE = STARTTIME = time.time()

    period = Infinity

    while t < N:
        if mode == len(functions):
            if debugreturn == True:
                print(f"Termination at iteration {t}, in mode {mode-1} no factor of {N} found")
            return N
        
        if t == (N-1):
            return N
        
        if A_n[-1] in A_n[:-1]:
            if ( ANL - A_n[:-1].index(A_n[-1]) ) < period:
                period = ( ANL - A_n[:-1].index(A_n[-1]) )
        
        val = functions[mode](A_n[-1],N)
        
        A_n.append(val)

        if t % 2 == 0:
            A_2n.append(val)
            diffs.append(val - A_n[len(A_2n)-1])

        ANL  = len(A_n)
        A2NL = len(A_2n)
        
        D = diffs[-1]

        CURRENTTIME = time.time()
        if CURRENTTIME - STARTTIME > timelim:
            if debugreturn ==True:            
                print(f"Exceeded time limit in mode {mode}, {functions[mode]}, time is {CURRENTTIME-STARTTIME}")            
            mode = mode+1
            STARTTIME = CURRENTTIME
        
        if debugproc == True:
            #print(f"MODE = {mode} t={t:05d}, A_n   = {A_n},\n{' '*18}A_2n  = {A_2n},\n{' '*18}diffs = {diffs},\n{' '*18}D = {D:06d}, GCD(D,N) = {GCD(D,N)},\n{' '*18}period = {period}")
            print(f"MODE = {mode} t={t:05d},\n{' '*18}D = {D:06d}, GCD(D,N) = {GCD(D,N)},\n{' '*18}period = {period}")

        if D==0 and t==1:
            t = t+1
            continue
        elif D == 0 and t!=1:
            mode = mode + 1 
            A_n = [initval]
            A_2n = [initval]
            diffs = [0]
            period = Infinity
            t = 1
        elif GCD(D,N) == 1:
            t = t + 1
            continue
        else:
            t = t + 1
            if debugreturn == True:
                remsizeA = floor(log(GCD(D,N),10)) + 3
                remsizeB = floor(log(Integer(N / GCD(D,N)),10)) + 3
                print(f"t = {t:05d},N = {N} \n{' '*12}= {GCD(D,N):0{remsizeA}d} * {Integer(N / GCD(D,N)):0{remsizeB}d}, in mode {mode}")
                return [GCD(D,N), Integer(N/GCD(D,N)), mode, period, CURRENTTIME-STARTTIMETRUE] 
            else:
                return [GCD(D,N), Integer(N/GCD(D,N))]
            continue


