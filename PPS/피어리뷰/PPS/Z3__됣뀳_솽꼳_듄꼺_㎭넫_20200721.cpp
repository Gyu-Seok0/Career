//
//  main.cpp
//  Z3_송지현_20200721
//
//  Created by 송지현 on 2020/07/22.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
#include <set>
using namespace std;

int main(int argc, const char * argv[]) {
    string input;
    set<string> result;
    cin >> input;
    string temp;

    for(int i=0; i<input.length(); i++){
        temp ="";
        for(int j=i; j<input.length(); j++){
            temp = temp + input[j];
            result.insert(temp);
        }

    }
    
    cout << result.size();
    return 0;
}
