feature 'Enter user details' do
  scenario 'submitting name and birthday - return birthday' do
    visit('/')
    fill_in :name, with: 'Clare'
    fill_in :birthday, with: Date.today.strftime("%d/%m/%Y")
    click_button 'Submit'
    expect(page).to have_content 'Happy birthday, Clare!'
  end

  scenario 'submitting name and birthday - return date difference' do
    visit('/')
    fill_in :name, with: 'Clare'
    fill_in :birthday, with: ((Date.today)+1).strftime("%d/%m/%Y")
    click_button 'Submit'
    expect(page).to have_content "It's 1 day until your birthday"
  end

end
