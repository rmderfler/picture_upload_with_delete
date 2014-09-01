require 'capybara/rails'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/login'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'Name', :with => 'Joe'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Logged in'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'Name', :with => 'Joe'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'invalid'
  end

  it "gives a user an error if the name is already taken" do
    visit '/signup'
    user = User.create(:name => 'T', :password => 'password')
    another_user = User.create(:name => 'T', :password => 'password')
    fill_in 'Name', :with => 'T'
    fill_in 'Password', :with => 'password'
    click_button 'Create User'
    expect(page).to have_content 'Name has already been taken'
  end


describe "logout" do
  it "logs out a signed in user" do
    visit '/login'
    user = User.create(:name => 'G', :password => 'password')
    fill_in 'name', :with => 'G'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    visit '/'
    click_on 'Log out'
    expect(page).to have_content 'Logged out'
  end
end

describe "upload a photo page" do
  it "displays 'Your photos' after upload" do
    visit '/login'
    user = User.create(:name => 'G', :password => 'password')
    fill_in 'name', :with => 'G'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    visit '/'
    click_on 'Add photo'
    expect(page).to have_content 'Your photos'
  end
end

end