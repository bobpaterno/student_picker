# As a user
# in order to find a student who has not been recently called upon
# I want to be able to pick a random student
feature "Pick Student button" do
  scenario "picks a student" do
    Fabricate(:student, name: "Jim", last_called: Time.zone.now)
    sally = Fabricate(:student, name: "Sally", last_called: (Time.zone.now - 3600) )

    visit '/'
    click_on "Pick Student"
    expect(current_path).to eq student_path(sally)
  end


end
