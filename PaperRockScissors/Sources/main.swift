import Foundation

var userMoves: [String] = []
var rockCount = 0
var paperCount = 0
var scissorsCount = 0
var winsFirstWay = 0
var winsSecondWay = 0
var continuePlaying = true


print("Welcome to Rock-Paper-Scissors!")

while continuePlaying {
    var userPlayed = ""
    
    repeat {
        print("Choose rock, paper, or scissors (or type 'exit' to quit):")
        if let input = readLine()?.lowercased() {
            userPlayed = input
        } else {
            continue
        }
        
        if userPlayed == "exit" {
            print("Thanks for playing!")
            continuePlaying = false
            break
        }
    } while userPlayed != "rock" && userPlayed != "paper" && userPlayed != "scissors"
    
    if !continuePlaying { break }
    
    userMoves.append(userPlayed)
    
    // Update counts for latest move only
    switch userPlayed {
    case "rock": rockCount += 1
    case "paper": paperCount += 1
    case "scissors": scissorsCount += 1
    default: break
    }
    
    // Decide computer strategy
    if winsSecondWay > winsFirstWay {
        print("Computer chooses to play based on previous user's choice  \(winsSecondWay) \(winsFirstWay)")
        computerPlaysSecondWay(userMoves: userMoves, wins: &winsSecondWay)
    } else if winsFirstWay > winsSecondWay {
        print("Computer chooses to play with averages   \(winsFirstWay) \(winsSecondWay)")
        computerPlays(userMoves: userMoves, rockCount: rockCount, paperCount: paperCount, scissorsCount: scissorsCount, wins: &winsFirstWay)
    } else {
        print("Computer has not learned the player yet")
        let choices = ["firstWay", "secondWay"]
        if let randomChoice = choices.randomElement() {
            if randomChoice == "firstWay" {
                print("Computer chooses to play with averages   \(winsFirstWay) \(winsSecondWay) ")
                computerPlays(userMoves: userMoves, rockCount: rockCount, paperCount: paperCount, scissorsCount: scissorsCount, wins: &winsFirstWay)
            } else {
                print("Computer chooses to play based on previous user's choice \(winsSecondWay) \(winsFirstWay)")
                computerPlaysSecondWay(userMoves: userMoves, wins: &winsSecondWay)
            }
        }
    }
}

// MARK: - Functions

func computerPlays(userMoves: [String], rockCount: Int, paperCount: Int, scissorsCount: Int, wins: inout Int) {
    var computerMove = "rock"
    let totalMoves = Double(userMoves.count)
    
    let avgRock = Double(rockCount) / totalMoves
    let avgPaper = Double(paperCount) / totalMoves
    let avgScissors = Double(scissorsCount) / totalMoves
    
    if avgRock > avgPaper && avgRock > avgScissors {
        computerMove = "paper"
    } else if avgPaper > avgRock && avgPaper > avgScissors {
        computerMove = "scissors"
    } else if avgScissors > avgRock && avgScissors > avgPaper {
        computerMove = "rock"
    }
    
    let lastUserMove = userMoves.last ?? "rock"
    print("Computer chose \(computerMove)")
    whoWins(lastUserMove: lastUserMove, computerMove: computerMove, wins: &wins)
}

func computerPlaysSecondWay(userMoves: [String], wins: inout Int) {
    let lastUserMove = userMoves.dropLast().last ?? "rock"
    let currentUserMove = userMoves.last ?? "rock"
    let computerMove = lastUserMove
    print("Computer chose \(computerMove)")
    whoWins(lastUserMove: currentUserMove, computerMove: computerMove, wins: &wins)
}

func whoWins(lastUserMove: String, computerMove: String, wins: inout Int) {
    if lastUserMove == computerMove {
        print("It's a tie!")

        wins = max(0, wins - 1)
        return
    }
    
    switch lastUserMove {
    case "rock":
        if computerMove == "paper" {
            print("Computer wins!")
            wins += 1
        } else {
            print("User wins!")
            wins -= 1
        }
    case "paper":
        if computerMove == "scissors" {
            print("Computer wins!")
            wins += 1
        } else {
            print("User wins!")
            wins -= 1
        }
    case "scissors":
        if computerMove == "rock" {
            print("Computer wins!")
            wins += 1
        } else {
            print("User wins!")
            wins -= 1
        }
    default:
        break
    }
}
