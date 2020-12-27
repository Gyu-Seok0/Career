{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "2\n",
      "HAL\n",
      "String #1\n",
      "IBM\n",
      "\n",
      "SWERC\n",
      "String #2\n",
      "TXFSD\n",
      "\n"
     ]
    }
   ],
   "source": [
    "N = int(input())\n",
    "\n",
    "for i in range(1,N+1):\n",
    "    word = input()\n",
    "    temp = \"\"\n",
    "    for letter in word:\n",
    "        if letter == 'Z':\n",
    "            temp += 'A'\n",
    "        else:\n",
    "            temp += chr(ord(letter)+1)\n",
    "    print(\"String #{0}\".format(i))\n",
    "    print(temp)\n",
    "    print()\n",
    "            "
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
