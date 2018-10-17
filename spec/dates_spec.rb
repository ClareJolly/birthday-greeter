require 'datechecker'

describe DateChecker do
  # subject(:datechecker) { DateChecker.new(Date.strptime("10/10/2018", "%d/%m/%Y")) }
  subject(:datechecker) { DateChecker.new("10/10/2018") }
  # let(:player_1) { double :player }
  # let(:player_2) { double :player }

  describe 'format birthday' do
    it 'takes day and month and returns birthday' do
      expect(datechecker.format_birthday("10","10")).to eq Date.strptime('10/10/2018', "%d/%m/%Y")
    end
  end

  describe 'compare dates' do
    it 'today and birthday should match' do
      datechecker.format_birthday("10","10")
      expect(datechecker.birthday_today?).to eq true
    end

    it '1 day difference (when next birthday this year)' do
      datechecker.format_birthday("11","10")
      expect(datechecker.date_diff).to eq 1
    end

    it '1 day difference (when next birthday this year)' do
      datechecker.format_birthday("01","10")
      datechecker.next_birthday
      expect(datechecker.date_diff).to eq 356
    end

    it 'plural dates' do
      datechecker.format_birthday("01","10")
      datechecker.next_birthday
      expect(datechecker.plural).to eq "s"
    end
  end

  describe 'next birthday' do
    it 'birthday already passed therefore next one is next year' do
      datechecker.format_birthday("01","10")
      expect(datechecker.next_birthday).to eq Date.strptime("01/10/2019", "%d/%m/%Y")
    end

    it 'birthday not already passed therefore next one is this year' do
      datechecker.format_birthday("12","10")
      expect(datechecker.next_birthday).to eq Date.strptime("12/10/2018", "%d/%m/%Y")
    end

  end
  # it "passes for equal dates" do
  #   expect(Time.new(2014, 4, 2)).to be_the_same_time_as Time.new(2014, 4, 2)
  # end
end
