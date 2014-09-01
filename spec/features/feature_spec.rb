require 'capybara/rails'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/login'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'name', :with => 'Joe'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Logged in'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'name', :with => 'Joe'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'invalid'
  end
end