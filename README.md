This is a _very_ poor first pass at me implementing a comprehensive factorisation program in SAGE (https://www.sagemath.org/).

This program will accept a positive integer input n and return two numbers as output x and y, that together multiply to give n

In order, the program will:
    - first run a simple check on if the input n is divisible by any of the first 2000 primes
    - perform Pollards-Rho algorithm for divisors (https://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm) if the first check fails

Further extentions to add, with attatched perception of difficulty coloured as in Judo Kyu grades, include:
    - Adding an intermediate sieve of erastothenes (https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes), as this is more efficient than Pollards-Rho on smaller inputs :yellow_square:
    - Extending to potentially an implementation of a general number field sieve (GNFS) (https://en.wikipedia.org/wiki/General_number_field_sieve) :blue_square:
    - Detecting n-smooth numbers :orange_square:
        - Implementing Pollards p-1 algorithm (https://en.wikipedia.org/wiki/Pollard%27s_p_%E2%88%92_1_algorithm) with this knowledge :green_square:
    - Implementing Lenestra elliptic-curve factorisation :brown_square: