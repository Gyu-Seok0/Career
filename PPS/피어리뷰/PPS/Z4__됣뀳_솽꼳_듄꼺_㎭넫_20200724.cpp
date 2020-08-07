//
//  main.cpp
//  Z4_송지현_20200724
//
//  Created by 송지현 on 2020/07/24.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
#include <algorithm>
using namespace std;

int main(int argc, const char * argv[]) {
    string num1, num2;
    cin >> num1 >> num2;
    int input1[10000];
    int input2[10000];
    int result[10000];
    int carry = 0;
    for(int i=0; i<num1.length(); i++){
        char tmp =num1[num1.length()-i-1];
        input1[i] = atoi(&tmp);
    }
    for(int i=0; i<num2.length(); i++){
        char tmp =num2[num2.length()-i-1];
        input2[i] = atoi(&tmp);
    }
    
    for(int i=0; i<max(num1.length(), num2.length()); i++){
        result[i]=input1[i]+input2[i]+carry;
        if(result[i]/10==1){
            result[i]=result[i]%10;
            carry = 1;
        }
        else{
            carry = 0;
        }
    }
    if(carry == 1){
        cout << 1;
    }
    for(int i=0; i<max(num1.length(), num2.length()); i++){
        cout << result[max(num1.length(), num2.length())-i-1];
    }
    return 0;
}
