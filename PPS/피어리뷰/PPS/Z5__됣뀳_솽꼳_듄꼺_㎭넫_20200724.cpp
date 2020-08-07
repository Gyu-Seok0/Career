//
//  main.cpp
//  Z5_송지현_20200724
//
//  Created by 송지현 on 2020/07/24.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int num[10];
    int remain[10];
    int count =0;
    
    for(int i=0; i<10; i++){
        cin >> num[i];
    }
    for(int i=0; i<10; i++){
        remain[i] = num[i]%42;
    }
    int j=0;
    for(int i=0; i<10; i++){
        for(j=i+1; j<10; j++){
            if(remain[i] == remain[j]){
                break;
            }
        }
        if(j == 10){
            count++;
        }
    }
    cout << count;
    return 0;
}
