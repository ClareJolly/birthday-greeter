feature 'Enter user details' do
  scenario 'submitting name and birthday' do
    visit('/')
    fill_in :name, with: 'Clare'
    fill_in :birthday, with: '30/09/1978'
    click_button 'Submit'
    expect(page).to have_content 'Name: Clare'
    expect(page).to have_content 'Birthday: 30/09/1978'
  end

end
