#include "sieve.h"

#include<numeric>

namespace sieve {

const std::vector<int> primes(int n)
{
    std::vector<int> numbers(n + 1);
    std::iota(numbers.begin(), numbers.end(), 0);
    std::vector<int> result;
    for (int i = 2; i <= n; i++) {
        int p = numbers[i];
        if (p < 0) {
            continue;
        }
        result.push_back(p);
        int x = p + p;
        while (x <= n) {
            numbers[x] = -1;
            x += p;
        }
    }

    return result;
}
}  // namespace sieve
