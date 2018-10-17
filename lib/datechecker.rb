class DateChecker

  attr_reader :birthday, :today

  def initialize(todayx = Date.today.strftime("%d/%m/%Y").to_s)
    @today = Date.strptime(todayx, "%d/%m/%Y")
    # p @today.instance_of?(Date)
    # p @today
    @birthday = format_birthday(10,10)
  end

  def format_birthday(d,m)
    @birthday = Date.strptime(construct_birthday(d,m), "%d/%m/%Y")
    # p @birthday
  end

  def next_birthday
    # p @today
    # p "fff"
    # p @birthday
    @today > @birthday ? @birthday.next_year : @birthday
  end

  def birthday_today?
    @today == @birthday
  end

  def date_diff
    (next_birthday - @today).to_i
  end

  def plural
    "s" if date_diff > 1
  end

  private

  def construct_birthday(d, m)
  "#{ d}/#{m}/#{Date.today.year}"
  end

end
