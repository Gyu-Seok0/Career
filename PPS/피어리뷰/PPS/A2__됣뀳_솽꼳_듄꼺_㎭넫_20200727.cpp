//
//  main.cpp
//  A2_송지현_20200727
//
//  Created by 송지현 on 2020/08/03.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int x,y;
    int result[5]={0};
    char input[600][600];
    int type=0;
    
    cin >> x >> y;
    for(int i=0; i<5*x+1; i++){
        for(int j=0; j<5*y+1; j++){
            cin >> input[i][j];
        }
    }
    
    for(int i=0; i<y; i++){
        for(int j=1; j<5*x+1; j++){
            if(j%5==0){
                result[type]++;
                type =0;
                continue;
            }
            if(input[j][i*5+1]=='*'){
                type++;
            }
        }
    }
    
    for(int i=0; i<5; i++){
        cout << result[i] << " ";
    }
    return 0;
}
