feature "Home Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Welcome to Student Picker")
  end
end