//
//  main.cpp
//  B3_송지현_20200730
//
//  Created by 송지현 on 2020/08/04.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    string input;
    
    while(1){
        bool result = true;
        bool vow = false;
        bool vow_check = false;
        int count = 0;
        cin >> input;
        if(input == "end") {
            break;
        }
        for(int i=0; i<input.length(); i++){
            if(i!=0){
                if(input[i-1]==input[i] && input[i]!='o' && input[i]!='e'){
                    result = false;
                    //cout << "3"; //test
                    break;
                }
            }
            if(input[i]=='a' || input[i]=='e' ||input[i]=='i' ||input[i]=='o' ||input[i]=='u'){
                if(vow==false){
                    count = 0;
                }
                vow = true;
                vow_check = true;
                ++count;
            }
            else{
                if(vow == true){
                    count = 0;
                }
                vow = false;
                ++count;
            }
            if(count == 3){
                result = false;
                //cout << "2"; //test
                break;
            }
            if(result == false){
                break;
            }
        }
        if(vow_check == false){
            //cout << "1"; //test
            result = false;
        }
        if(result == true){
            cout << "<" << input << "> is acceptable.\n";
        }
        else{
            cout << "<" << input << "> is not acceptable.\n";
        }
        result = true;
    }
    return 0;
}
