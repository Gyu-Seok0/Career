//
//  main.cpp
//  A1_송지현_20200727
//
//  Created by 송지현 on 2020/07/27.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int count;
    int flag=0;
    cin >> count;
    string input;
    int alpha[26]={0};
    for(int i=0; i<count; i++){
        cin >> input;
        alpha[input[0]-97]++;
    }
    for(int i=0; i<26; i++){
        if(alpha[i]>=5){
            cout << (char)(i+97);
            flag=1;
        }
    }
    if(flag == 0){
        cout << "PREDAJA";
    }
}
