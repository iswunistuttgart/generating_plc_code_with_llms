import numpy as np

def pass_at_k(n, c, k):
    """
    : param n : total number of samples
    : param c : number of correct samples
    : param k : k in pass@k
    """
    if n - c < k :
        return 1.0
    return 1.0 - np.prod(1.0 - k / np.arange(n - c + 1 , n + 1 ) )

if __name__ == '__main__':
    list = [0,11,28,8,0,0]
    for a in list:
        b = []
        for i in range(1,4):
            k = pass_at_k(60,a,i)
            b.append(k)
        print(b)

    print('-----------------------')
    list = [4,22,35,3,0,0]
    for a in list:
        b = []
        for i in range(1,4):
            k = pass_at_k(60,a,i)
            b.append(k)
        print(b)