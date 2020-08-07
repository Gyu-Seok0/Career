//
//  main.cpp
//  B1_송지현_20200729
//
//  Created by 송지현 on 2020/08/03.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
#include <cstring>
#include <algorithm>
using namespace std;

string sum(string x, string y){
    int num;
    int carry = 0;
    string result;
    
    reverse(x.begin(), x.end());
    reverse(y.begin(), y.end());
    
    while (x.length() < y.length()) {
        x += '0';
    }
    while (x.length() > y.length()) {
        y += '0';
    }
    
    for (int i = 0; i < x.length(); ++i) {
        num = (x[i] - '0' + y[i] - '0' + carry) % 10;
        result += to_string(num);
        carry = (x[i] - '0' + y[i] - '0' + carry) / 10;
    }
    if (carry != 0) {
        result += to_string(carry);
    }
    
    reverse(result.begin(), result.end());
    
    return result;
}

string fibo(int input){
    string result;
    string num1, num2;
    
    num1 = '0';
    num2 = '1';
    
    if (input == 0) {
        result = "0";
    }
    if (input == 1) {
        result = "1";
    }
    for (int i = 2; i <= input; ++i) {
        result = sum(num1, num2);
        num1 = num2;
        num2 = result;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    int n;
    string result;
    cin >> n;

    result = fibo(n);
    
    cout << result;

    return 0;
}
