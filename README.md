# Paper-Rock-Scissors

Rock-Paper-Scissors with Adaptive Computer Strategy

This is a simple Rock-Paper-Scissors game in Swift where the computer adapts its strategy based on the user’s past moves. While it is not true machine learning, it uses simple adaptive strategies to make the game more challenging and dynamic.

How the Computer Adapts
The computer uses two strategies to decide its next move:

First Strategy: Frequency-Based (Averages)
The computer counts how many times the user has played rock, paper, and scissors.
It calculates which move the user plays most frequently.
Then it chooses the move that beats the user’s most frequent move.

Example: If the user plays rock most often, the computer will choose paper.
This strategy adapts to the user’s overall tendencies.

Second Strategy: Last-Move Mimicry
The computer looks at the user’s previous move and plays the same move.
This strategy assumes that users may repeat patterns in short sequences.

Example: If the user played scissors in the last round, the computer plays scissors this round.

Choosing the Strategy
The program tracks which strategy has won more rounds (winsFirstWay and winsSecondWay).
On each turn, the computer chooses the strategy that has been more successful.
If both strategies are tied, it randomly chooses between them.

# Why It’s ML-Like
Although this program does not implement a formal machine learning model, it shows adaptive behavior based on past data, which is a key idea in machine learning:
It learns from user behavior over time.
It adjusts its strategy dynamically based on which approach works better.
It can improve its chances of winning as more data is collected.

Think of it as a rule-based adaptive system, a simple precursor to real ML algorithms that use probabilities and pattern recognition.
