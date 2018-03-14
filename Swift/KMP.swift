//
//  main.swift
//  testSwift
//
//  Created by wangzhe on 2018/3/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//


/*
 *  KMP算法，给定一个字符串s、一个匹配串p，判断在s中是否包含p.
 *  如果s包含p，返回匹配到的首位置；如果不包含，返回-1.
 */

import Foundation

print("KMP Search")

/*
 *  KMP算法的关键是：
 *  当匹配失败时，模式串p向右移动的位数为：失配字符所在位置 - 失配字符对应的next值。
 */
func KMPSearch(s : String, p : String) -> Int {
    var i = 0
    var j = 0
    let sLen = s.count
    let pLen = p.count
    var next = getNext(str: p)
    
    while i < sLen && j < pLen {
        let s_arr = Array(s)
        let p_arr = Array(p)
        if j == -1 || s_arr[i] == p_arr[j] {
            i += 1
            j += 1
        }
        else {
            j = next[j]
        }
    }
    
    if j == pLen {
        return i - j
    }
    else {
        return -1
    }
}

/*
 *  next数组各值的含义：
 *  代表当前字符之前的字符串中，有多大长度的相同前缀后缀。
 */
func getNext(str : String) -> Array<Int> {
    var _next = Array(repeating: 0, count: str.count)
    _next[0] = -1
    let p = Array(str)
    
    for i in 1 ... str.count - 1 {
        let j = i - 1
        var k = _next[j]
        while k != -1 && p[k] != p[j] {
            k = _next[k]
        }
        _next[i] = k + 1
    }
    return _next;
}

// MARK: - TEST
print("next: ", getNext(str: "ABCDABCE"))
//next:  [-1, 0, 0, 0, 0, 1, 2, 3]

print("KMP: ", KMPSearch(s: "ABCABEDDBBAEAEB", p: "BEDDB"))
//KMP:  4

