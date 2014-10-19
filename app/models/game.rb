class Game < ActiveRecord::Base
  attr_reader :score, :seconds_allocated, :correct_entries_ids

  def setup(entries)
    @score = 0
    @seconds_allocated = calculate_time(entries.count)
    @correct_entries_ids = []
    self
  end

  def check
    entry = @entries.find_by(text:params[:answer]).where.not(id: @correct_entries_ids)
    if entry
      @correct_entries_ids << entry.id
      entry
    else
      false
    end
  end

  private

  def calculate_time(num_of_entries)
    seconds = num_of_entries * 5
    if seconds < 30
      return 30
    elsif seconds > 300
      return 300
    else
      seconds
    end
  end

end