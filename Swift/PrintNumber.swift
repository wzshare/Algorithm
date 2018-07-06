//
//  PrintNumber.swift
//  LeetCode
//
//  Created by wangzhe on 2018/7/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import Foundation

/*
 * 《剑指Offer》面试题12
 * 输入数字n，顺序打印从1最大的n位十进制数
 */

class PrintNumber {
    func printNumber(_ n: Int) {
        let str = String(repeating: "0", count: n)
        var number = Array(str)
        helper(&number, 0)
    }
    
    func helper(_ number: inout [Character], _ index: Int) {
        if index == number.count {
            print(String(number))
            return
        }
        for i in 0..<10 {
            number[index] = Character(String(i))
            helper(&number, index + 1)
        }
    }
}
