//
//  MatricBacktracking.hpp
//  cppAlgorithm
//
//  Created by wangzhe on 2018/11/7.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#ifndef MatricBacktracking_hpp
#define MatricBacktracking_hpp

#include <stdio.h>
#include <math.h>

#endif /* MatricBacktracking_hpp */

class Backtrack {

    int Array[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9},
    };
    int width = 3, height = 3;
    
    int longestPath(int m, int n, int length) {
        int left = 0, right = 0, up = 0, down = 0;
        bool is_left = false, is_right = false, is_up = false, is_down = false;
        if (n > 0 && Array[m][n] < Array[m][n - 1]) {
            left = longestPath(m, n - 1, length + 1);
            is_left = true;
        }
        if (n < height - 1 && Array[m][n] < Array[m][n + 1]) {
            right = longestPath(m, n + 1, length + 1);
            is_right = true;
        }
        if (m > 0 && Array[m][n] < Array[m - 1][n]) {
            up = longestPath(m - 1, n, length + 1);
            is_up = true;
        }
        if (m < width - 1 && Array[m][n] < Array[m + 1][n]) {
            down = longestPath(m + 1, n, length + 1);
            is_down = true;
        }
        if (is_left || is_right || is_up || is_down) {
            return fmax(fmax(fmax(left, right), up), down);
        } else {
            return length;
        }
    }

public:
    int printLongestPath() {
        return longestPath(0, 0, 0);
    }
};
