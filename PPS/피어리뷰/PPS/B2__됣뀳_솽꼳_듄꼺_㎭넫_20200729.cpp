//
//  main.cpp
//  B2_송지현_20200729
//
//  Created by 송지현 on 2020/08/03.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int count;
    cin >> count;
    string input;
    for(int i=0; i<count; i++){
        cin >> input;
        cout << "String #" << i+1 << "\n";
        for(int j=0; j<input.length(); j++){
            cout << (char)((input[j]-'A'+1)%26+'A');
        }
        cout << "\n\n";
    }
    return 0;
}
