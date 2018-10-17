
  # @today = Date.strptime((Date.today.strftime("%d/%m/%Y").to_s), "%d/%m/%Y")
# p Date.today+1
feature 'Enter user details' do
  scenario 'submitting name and birthday - return birthday' do
    visit('/')
    fill_in :name, with: 'Clare'
    select(Date.today.day.to_s, :from => 'day')
    select(Date::MONTHNAMES[Date.today.month], :from => 'month')
    click_button 'Go'
    expect(page).to have_content 'Happy birthday, Clare!'
  end

  scenario 'submitting name and birthday - return date difference' do
    visit('/')
    fill_in :name, with: 'Clare'
    select((Date.today+1).day.to_s, :from => 'day')
    select(Date::MONTHNAMES[(Date.today+1).month], :from => 'month')
    click_button 'Go'
    expect(page).to have_content "It's 1 day until your birthday"
  end

  scenario 'submitting name and birthday - return date difference - next year' do
    visit('/')
    fill_in :name, with: 'Clare'
    select((Date.today-7).day.to_s, :from => 'day')
    select(Date::MONTHNAMES[(Date.today-7).month], :from => 'month')
    click_button 'Go'
    expect(page).to have_content "It's 358 days until your birthday"
  end

end
