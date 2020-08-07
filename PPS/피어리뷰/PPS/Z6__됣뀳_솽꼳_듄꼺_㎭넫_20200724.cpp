//
//  main.cpp
//  Z6_송지현_20200724
//
//  Created by 송지현 on 2020/07/24.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int input_num;
    cin >> input_num;
    int input[1001];
    for(int i=0; i<input_num; i++){
        cin >> input[i];
    }
    int min = 0;
    int max = 0;
    int result = 0;
    for(int i=0; i<input_num-1; i++){
        if(input[i] < input[i+1]){
            max++;
            if(result < input[max]-input[min]){
                result = input[max] - input[min];
            }
        }
        else if(input[i]>=input[i+1]){
            max = i+1;
            min = i+1;
        }
    }
    cout << result;
}
