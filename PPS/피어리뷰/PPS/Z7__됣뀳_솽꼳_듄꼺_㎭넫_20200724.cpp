//
//  main.cpp
//  Z7_송지현_20200724
//
//  Created by 송지현 on 2020/07/24.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    cin.tie(NULL);
    cout.tie(NULL);
    ios_base :: sync_with_stdio(false);
    int num1, num2;
    int count;
    cin >> count;
    for(int i=1; i<=count; i++){
        cin >> num1 >> num2;
        cout << num1+num2 << "\n";
    }
    return 0;
}
