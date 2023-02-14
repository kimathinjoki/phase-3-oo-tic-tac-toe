
class TicTacToe

    attr_accessor :board

    @board = Array.new(9," ")

    def initialize(board)
        @board = board
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],  #bottom row
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]  # et cetera, creating a nested array for each win combination
    ]

    def display_board
        @board
    end

    def input_to_index(str)
        @board[str.to_i - 1]
    end

    def move(input_index,token="X")

        input_to_index(input_index) = token
        
    end

    def position_taken?(pos)

        if self.input_to_index(pos) == "X" || self.input_to_index(pos) == "O"
            true
        else 
            false
        end

    end

    def valid_move?(pos)

        if self.position_taken?(pos) == true && pos < 10
            true
        end 

    end

    def turn_count
        @board.count("X") + @board.count("0")
    end

    def currrent_player
        if turn_count % 2 == 0
            "It's X turn"
        else
            "its O turn"
        end
    end

    def turn
        puts "Pick a position between 1-9"
        input = gets
        self.input_to_index(input)
        if self.valid_move?(input) == true
            "Assign your move X for player one O for player two"

            token = gets

            move(input, token )

            puts self.display_board
        elsif 
           return self.turn

        end
    end

        def won?

            # A.each_index.select { |index| A[index] == 1}
            player1 = @board.each_index.select { |index| @board[index] == "X"}
            player2 = @board.each_index.select { |index| @board[index] == "O"}

            WIN_COMBINATIONS.each do |b|

                if b.sort == player1.sort
                    "Player One has won"
                    true
                elsif b.sort == player2.sort
                    "Player two has won"
                    true
                else 
                    "It's a tie, do another round"
                end

        
            end
        end

        def full?
            if !!@board.include?(" ") == false
                true
            else
                false
            end

        end

        def draw?

            if self.full? == true && self.won == "It's a tie, do another round"
                true
            else 
                false
            end
        end

        def over?
            if self.won? == true && self.full? == true
                true
            else 
                false
            end
        end

        def winner?

            if self.won? == "Player One has won"
                "X"
            elsif self.won? == "Player two has won"
                "O"

            end

        end


    


end