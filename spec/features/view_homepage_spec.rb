# As a user
# in order to select a student
# I want to be able to view a list of students
feature "Home Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Welcome to Student Picker")
  end

  scenario "shows a list of students" do
    Fabricate(:student, name: "Jim")
    Fabricate(:student, name: "Sally")

    visit '/'
    expect(Student.count).to eq 2
    expect(page).to have_content("Student List:")
    expect(page).to have_content("Jim")
    expect(page).to have_content("Sally")
  end
end
