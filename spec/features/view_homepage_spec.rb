feature "Home Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Welcome to Student Picker")
  end

  scenario "shows a list of students" do
    pending "implementation"
    visit '/'
    expect(page).to have_content("Student List:")
  end
end
