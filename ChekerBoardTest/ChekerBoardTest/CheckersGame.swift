//
//  CheckersGame.swift
//  ChekerBoardTest
//
//  Created by Khusrav Safiev on 3/14/24.
//

import Foundation

class CheckersGame {
    var board: [[String]] = []
    var currentPlayer: Player = .red
    
    
    
    enum Player: String {
        case red = "Red"
        case black = "Black"
    }
    
    init() {
        initializeBoard()
        printBoard()
    }
   
    /*
     Этот код генерирует начальное распределение шашек на игровой доске для классической игры в шашки. Давайте разберем, как он работает:

     1. Двойной цикл `for`:
        - Вложенный цикл `for` используется для перебора всех клеток на игровой доске. Первый цикл `for` (`for i in 0..<8`) перебирает строки доски, а второй цикл `for` (`for j in 0..<8`) перебирает столбцы.

     2. Проверка условия `(i + j) % 2 == 1`:
        - Это условие проверяет, является ли сумма индексов строки `i` и столбца `j` нечетным числом. Таким образом, оно определяет черные клетки на доске, так как они находятся на нечетных позициях.

     3. Вложенные условия `if`:
        - Если условие `(i + j) % 2 == 1` выполняется, значит, мы находимся на черной клетке доски. Далее вложенные условия `if` проверяют, находится ли текущая клетка выше первых трех строк или ниже последних трех строк.
        - Если `i < 3`, это значит, что мы находимся в верхних трех строках доски, и мы устанавливаем красную шашку на эту клетку (`board[i][j] = "🔴"`).
        - Если `i > 4`, это значит, что мы находимся в нижних трех строках доски, и мы устанавливаем черную шашку на эту клетку (`board[i][j] = "⚫️"`).

     Таким образом, этот код создает начальное распределение шашек на игровой доске, где красные шашки находятся в верхних трех строках, а черные шашки находятся в нижних трех строках, при этом все они расположены на черных клетках доски.
     */
        func initializeBoard() {
            board = Array(repeating: Array(repeating: "⚪️ ", count: 8), count: 8)
            
            for i in 0..<8 {
                for j in 0..<8 {
                    if (i + j) % 2 == 1 {
                        if i < 3 {
                            board[i][j] = "🔴"  // Red piece
                        } else if i > 4 {
                            board[i][j] = "⚫️"  // Black piece
                        }
                    }
                }
            }
        }
    func printBoard() {
            for row in board {
                print(row.joined(separator: " "))
            }
            print("\n\(currentPlayer.rawValue)'s turn:") // ??? !
        }
    
    
    func isValidMove(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
           // Implement your logic for checking if the move is valid
           // For simplicity, let's assume any diagonal move is valid for now
           return abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 1
       }
    
    func makeMove(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) {
            if isValidMove(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol) {
                board[toRow][toCol] = board[fromRow][fromCol]
                board[fromRow][fromCol] = " "
                switchPlayer()
                printBoard()
            } else {
                print("Invalid move. Try again.")
            }
        }
    
    /*
    Эта функция `switchPlayer()` изменяет текущего игрока в игре. В начале каждой игры установлен начальный игрок (обычно первый игрок) в качестве `currentPlayer`. Когда игрок совершает ход, после того как его ход завершается, вызывается эта функция для смены текущего игрока на противоположного.

    В данной реализации игры, если `currentPlayer` был установлен на `.red`, то после вызова `switchPlayer()`, `currentPlayer` будет изменен на `.black`, и наоборот. Таким образом, эта функция помогает переключаться между игроками в игре Шашки, что позволяет каждому игроку совершать свои ходы поочередно.
    */
    func switchPlayer() {
          currentPlayer = (currentPlayer == .red) ? .black : .red // ??? !
      }
    
    func startGame() {
        print("Welcome to Checkers!")
        while !isGameFinished() {
            print("Enter your move (fromRow fromCol toRow toCol):")
            if let input = readLine(), let move = parseMove(input) {
                makeMove(fromRow: move.fromRow, fromCol: move.fromCol, toRow: move.toRow, toCol: move.toCol)
            } else {
                print("Invalid input. Please enter valid move.")
            }
        }
        print("\(currentPlayer.rawValue) wins!")
    }
    
    func isGameFinished() -> Bool {
        // Implement your logic to check if the game is finished
        // For simplicity, let's assume the game finishes when one player has no pieces left
        let piecesLeft = board.flatMap { $0 }.filter { $0 == "●" || $0 == "◉" }
        return piecesLeft.count <= 1
    }

    func parseMove(_ input: String) -> (fromRow: Int, fromCol: Int, toRow: Int, toCol: Int)? {
        let components = input.split(separator: " ").compactMap { Int($0) }
        guard components.count == 4 else { return nil }
        return (components[0], components[1], components[2], components[3])
    }
}

let game = CheckersGame()



