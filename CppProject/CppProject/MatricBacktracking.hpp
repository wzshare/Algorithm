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

int Array[5][5] = {
    {0, 0, 0, 0, 0},
    {0, 1, 2, 3, 0},
    {0, 4, 5, 6, 0},
    {0, 7, 8, 9, 0},
    {0, 0, 0, 0, 0}
};

int longestPath(int m, int n, int length) {
    int left, right, up, down;
    if (Array[m][n] > Array[m - 1][n]
        && Array[m][n] > Array[m + 1][n]
        && Array[m][n] > Array[m][n - 1]
        && Array[m][n] > Array[m][n + 1]) {
        return length;
    }
    left = longestPath(m, n - 1, length + 1);
    right = longestPath(m, n + 1, length + 1);
    up = longestPath(m - 1, n, length + 1);
    down = longestPath(m + 1, n, length + 1);
    return fmax(fmax(fmax(left, right), up), down);
}

int printLongestPath() {
    return longestPath(1, 1, 1);
}
