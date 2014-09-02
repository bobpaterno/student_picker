# As a user
# in order to create a list of students to pick from
# I want to be able to create a student
feature "Student Index" do
  scenario "user wants to add a student" do
    visit '/'
    expect(page).to have_content("Add Student")
  end

  scenario "adds a student" do
    visit '/'
    click_on "Add Student"
    expect(current_path).to eq new_student_path
  end

  scenario "creates a student" do
    visit '/'
    click_on "Add Student"
    fill_in "Name", with: "Jim"
    click_button "Create Student"
    expect(Student.count).to eq 1
    expect(page).to have_content("Jim")
  end

  scenario "does not create a student" do
    visit '/'
    click_on "Add Student"
    click_button "Create Student"
    expect(page).to have_content("can't be blank")
  end
end
