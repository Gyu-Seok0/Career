//
//  main.cpp
//  A4_송지현_20200727
//
//  Created by 송지현 on 2020/07/27.
//  Copyright © 2020 송지현. All rights reserved.
//

#include <iostream>
using namespace std;

class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int size = nums.size();
        if(size == 0) return 0;
        int count = 1;
        int num = nums[0];
        
        for(int i=1; i<size; i++){
            if(num != nums[i]){
                nums[count] = num = nums[i];
                count++;
            }
        }
        return count;
    }
};
