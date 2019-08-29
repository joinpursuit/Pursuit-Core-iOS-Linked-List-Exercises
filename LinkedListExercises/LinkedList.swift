//
//  LinkedList.swift
//  LinkedListExercises
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

public class Node<T> {
    var key: T
    var next: Node?
    init(key: T) {
        self.key = key
    }
    
    
}

public class LinkedList<T: Equatable> {
    var head: Node<T>?
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }

    var count: Int {
        
        var count = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        
        return count
    }
    
    func append(element newKey: T) {
        if head == nil {
            head = Node(key: newKey)
            return
        }
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    func getNode (at index: Int) -> Node<T>? {
        guard index >= 0 else {return nil}
        var counter = 0
        var currentNode = head
        while counter < index {
            currentNode = currentNode?.next
            counter += 1
        }
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.key == targetKey {return true}
            currentNode = currentNode?.next
        }
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
        var currentNode = head
        var currentNodeTwo = otherList.head
        
        while currentNode != nil && currentNodeTwo != nil && currentNode?.key == currentNodeTwo?.key {
            currentNode = currentNode?.next
            currentNodeTwo = currentNodeTwo?.next
        }
        
        return currentNode == nil && currentNodeTwo == nil
       
    }
    
    func insert(newValue: T, at index: Int) {
        
        let newNode = Node(key: newValue)
        guard let nodeBefore = getNode(at: index - 1) else {
            if index == 0 {
                newNode.next = head
                head = newNode
            } else {
                append(element: newValue)
            }
            return
        }
        
        newNode.next = nodeBefore.next
        nodeBefore.next = newNode
    }
    
    func toArr() -> [T] {
        var arr = Array<T>()
        var currentNode = head
        while currentNode != nil {
            guard let key = currentNode?.key else {break}
            arr.append(key)
            currentNode = currentNode?.next
        }
        return arr
        
    }
    
    func reversed() -> LinkedList<T> {
        var currentNode = head
        let newLink = LinkedList<T>()
        while currentNode != nil {
            newLink.insert(newValue: currentNode!.key, at: 0)
            currentNode = currentNode?.next
        }
        return newLink
        
    }
    
    func removeAll() {}
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {}
    
    static func mergeSortedLists<T>(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        return LinkedList<T>()
    }
    
    


}

