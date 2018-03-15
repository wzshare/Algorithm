//
//  LRUCache.swift
//  testSwift
//
//  Created by wangzhe on 2018/3/15.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import Foundation

class Node {
    var key: Int
    var data: Int
    
    var prev: Node?
    var next: Node?
    
    init(key : Int, data : Int) {
        self.key = key
        self.data = data
    }
}

class LRUCache {
    let size = 3
    var currentSize = 0
    var head: Node = Node(key: 0, data: 0)
    var tail: Node = Node(key: 10, data: 10)
    var hashmap : [Int : Node] = [:]
    
    init() {
        head.next = tail
        tail.prev = head
    }
    
    func get(key: Int) -> Int {
        if let node = hashmap[key] {
            remove(node: node)
            insert(node: node)
            return node.data
        }
        else {
            return -1
        }
    }
    
    func put(key: Int, data: Int) {
        if let node = hashmap[key] {
            remove(node: node)
            insert(node: node)
            node.data = data
        }
        else {
            if currentSize > size {
                if let key = tail.prev?.key {
                    hashmap[key] = nil
                }
                remove(node: tail.prev)
            }
            else {
                let node: Node = Node(key: key, data: data)
                hashmap[key] = node
                insert(node: node)
            }
        }
    }
    
    func remove(node: Node!) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        currentSize -= 1
    }
    
    func insert(node: Node!) {
        node.next = head.next
        head.next = node
        node.prev = head
        node.next?.prev = node
        currentSize += 1
    }
}
