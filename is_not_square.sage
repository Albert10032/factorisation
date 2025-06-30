
limit = 1e-9

def quad(t, N:int):
    return t*t - N

def line(t):
    return 2*t

def nearestint(n):
    dec = n - floor(n)
    if dec == 0:
        return n
    elif dec > 0.5:
        return ceil(n)
    else:
        return floor(n)


def is_N_square(N:int):
    # x^2 - N = 0, finding positive square root
    # df/dx = 2x, initval of 1
    # X_t+1 = X_t - f(X_t) / f'(X_t)
    init = N - 2
    diff = +Infinity
    while True:
        new = init - quad(init,N) / line(init)
        init = new
        diff = new*new - N
        if abs(diff) < limit:
            break
        else:
            continue

    check = nearestint(new)
    
    print(f"{N}[-+-]{init}[-+-]{new}[-+-]{diff}")
    if check*check == N:
        return True, check
    else:
        return False

