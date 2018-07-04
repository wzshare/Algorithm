//
//  QuickSort.swift
//  testSwift
//
//  Created by wangzhe on 2018/7/3.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import Foundation

class QuickSort {
    func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int{
        let flag = array[low]
        var l = low, h = high
        while l < h {
            while array[h] > flag {
                h -= 1
            }
            array[l] = array[h]
            while array[l] < flag && l < h{
                l += 1
            }
            array[h] = array[l]
        }
        array[l] = flag
        return l
    }
    
    func qSort(_ array: inout [Int], _ low: Int, _ high: Int) {
        if low < high {
            let index = partition(&array, low, high)
            qSort(&array, low, index - 1)
            qSort(&array, index + 1, high)
        }
    }
    
    func quickSort(_ array: [Int]) -> [Int] {
        var arr = array
        qSort(&arr, 0, arr.count - 1)
        return arr
    }
    
    func topK(_ array: inout [Int], _ k: Int) -> [Int] {
        var low = 0, high = array.count - 1, size = array.count
        var index = partition(&array, low, high)
        while index != size - k {
            if index < size - k {
                low = index + 1
                index = partition(&array, low, high)
            } else {
                high = size - k
                index = partition(&array, low, high)
            }
        }
        return Array(array[(size - k)..<size]).sorted(by: >)
    }
}
