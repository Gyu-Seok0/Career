{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# 피보나치\n",
    "재귀함수를 사용하는 것이 훨씬 간단하지만, 시간복잡도가 상당하다.\n",
    "따라서 아래와 같이 for문을 통해 문제를 해결했다."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "def fibo(n):\n",
    "    if n==1 or n==2:\n",
    "        return 1\n",
    "    return fibo(n-1) + fibo(n-2)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "55\n"
     ]
    }
   ],
   "source": [
    "import sys\n",
    "n = int(sys.stdin.readline())\n",
    "check = [0 for i in range(n+1)]\n",
    "for i in range(n+1):\n",
    "    if i==1 or i==2:\n",
    "        check[i] = 1\n",
    "    elif i>2:\n",
    "        check[i] = check[i-1] + check[i-2]\n",
    "ans = check[n]\n",
    "print(ans)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.6"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
