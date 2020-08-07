//
//  main.cpp
//  Z1_송지현_20200721
//
//  Created by 송지현 on 2020/07/21.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
#include <algorithm>
using namespace std;

bool ascending(int num[8]){
    for(int i=0; i<8; i++){
        if(num[i]<num[i-1]) return false;
    }
    return true;
}

bool descending(int num[8]){
    for(int i=1; i<8; i++){
        if(num[i]>num[i-1]) return false;
    }
    return true;
}

int main(int argc, const char * argv[]) {
    int num[8] = {0};
    for(int i=0; i<8; i++){
        cin >> num[i];
    }
    if(ascending(num) == true){
        cout << "ascending";
    }
    else if(descending(num) == true){
        cout << "descending";
    }
    else{
        cout << "mixed";
    }
    return 0;
}
