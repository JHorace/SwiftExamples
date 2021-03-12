//
//  main.swift
//  SwiftExamples
//
//  Created by James Sumihiro on 3/7/21.
//

import Foundation
import SwiftUtils


//  Finds each pair of integers in an array whose sum is equal to target
func twoSum<T: SignedInteger>(_ nums: [T], _ target: T) -> [[T]]?
{
    var result: [[T]] = [];
    
    //  Copy and sort the array to allow binary search
    var sorted_nums = nums;
    sorted_nums.sort();
    
    //  Keep track of previously used numbers to avoid duplicates
    var num_set = Set<T>();
    
    for (index, num) in sorted_nums.enumerated()
    {
        if(!num_set.contains(num))
        {
            num_set.insert(num);
            
            let compliment = binarySearch(nums.suffix(nums.endIndex - index),
                                          target - num);
            
            if(compliment != nil)
            {
                result.append([num, target - num]);
            }
        }
    }
    
    if(result.isEmpty)
    {
        return nil;
    }
    else
    {
        return result;
    }

}

