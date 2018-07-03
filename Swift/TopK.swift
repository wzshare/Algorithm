//
//  TopK.swift
//  testSwift
//
//  Created by wangzhe on 2018/7/2.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import Foundation

class TopK {
    
    func heapify(_ heap: inout Array<Int>, _ index: Int, _ length: Int) {
        let left = index * 2 + 1
        let right = index * 2 + 2
        var min = index
        
        if left < length && heap[min] > heap[left] {
            min = left
        }
        if right < length && heap[min] > heap[right] {
            min = right
        }
        if min != index {
            heap.swapAt(index, min)
            heapify(&heap, min, length)
        }
    }
    
    func buildHeap(_ array: inout [Int]) {
        let length = array.count
        for index in stride(from: length / 2 - 1, through: 0, by: -1) {
            heapify(&array, index, length)
        }
    }
    
    func heapSort(_ heap: [Int]) -> [Int] {
        let k = heap.count
        var array = heap
        
        for item in (0..<k).reversed() {
            array.swapAt(0, item)
            heapify(&array, 0, item)
        }
        return array
    }
    
    func topK(_ array: [Int], _ k: Int) -> [Int] {
        var heap: [Int] = Array(array[0..<k])
        buildHeap(&heap)
        for index in k..<array.count {
            if array[index] > heap[0] {
                heap[0] = array[index]
                heapify(&heap, 0, k)
            }
        }
        return heapSort(heap)
    }
}


