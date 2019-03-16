class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read_file
    File.read(@filename)
  end

  def rows_array
    read_file.split(/\n+/)
  end

  def break_rows
    rows_array.map do |row|
      row.split(",")
    end
  end

  def cards
    break_rows.map do |entry|
      question = entry[0]
      answer = entry[1].to_s
      category = "#{entry[2]}"
      Card.new(question, answer, category)
    end
  end

end
