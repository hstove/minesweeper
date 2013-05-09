class Minesweeper
  attr_accessor :rows, :board, :mines

  def initialize rows, mines
    @rows = rows.to_i
    @mines = mines.to_i
    make_board
  end

  def make_board
    @board = []
    @rows.times do |y|
      row = []
      @rows.times do |x|
        row << 0
      end
      @board << row
    end

    x, y = [nil, nil]
    @mines.times do
      begin
        x,y = [rand(@rows), rand(@rows)]
      end while @board[x][y]==:x
    @board[x][y] = :x
    end

    @rows.times do |row|
      @rows.times do |col|
        score = 0
        next if @board[row][col] == :x
        score += 1 if check_mine(row,col-1) 
        score += 1 if check_mine(row,col+1)
        score += 1 if check_mine(row+1, col)
        score += 1 if check_mine(row-1, col)
        score += 1 if check_mine(row+1,col-1)
        score += 1 if check_mine(row-1,col+1)
        score += 1 if check_mine(row+1, col+1)
        score += 1 if check_mine(row-1, col-1)
        @board[row][col] = score
      end
    end
  end

  def check_mine row, col
    unless col < 0 || row < 0 || row >= @rows || col >= @rows
      @board[row][col] == :x
    end
  end


  def print
    @rows.times do |row|
      print @board[row]
      print "\n"
    end
  end
end

