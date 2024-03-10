//
//  main.swift
//  ChekerBoardTest
//
//  Created by Khusrav Safiev on 3/10/24.
//

import Foundation

print("Hello, World!")

func array2D (rows: Int, colums:Int) -> [[String]] {
    
    var strArray = [[String]] ()
    
    for _ in 0..<rows {
        var  row = [String] ()
        
        for _ in 0..<colums {
            row.append("#")
            print(row)
        }
        strArray.append(row)
    }
    return strArray
}

var chekerBoard = array2D(rows: 8, colums: 8)
print(chekerBoard)

func printBoard (chekerBoard: [[String]]) {
    for row in chekerBoard {
        print(row)
    }
    
}

printBoard(chekerBoard: chekerBoard)
