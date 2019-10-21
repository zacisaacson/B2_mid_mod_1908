require 'rails_helper'

RSpec.describe "the Instructor show page" do
  it "has name, students and average age of students" do
    mike = Instructor.create(name: "Mike")
    meg = Instructor.create(name: "Meg")
    zac = mike.students.create(name: "Zac", cohort: 1908, age: 30)
    her = mike.students.create(name: "Her", cohort:1908, age: 26)
    graham = meg.students.create(name: "Graham", cohort:1908, age: 26)
    hill = meg.students.create(name: "Hill", cohort:1908, age: 27)

    visit '/students'

    within "#student-#{zac.id}" do
      click_link "#{mike.name}"
    end

    expect(current_path).to eq("/instructors/#{mike.id}")
    expect(page).to have_content(mike.name)

    within "#students-#{mike.id}" do
      expect(page).to have_content(zac.name)
      expect(page).to have_content(her.name)
      expect(page).to_not have_content(graham.name)
      expect(page).to_not have_content(hill.name)
    end
    expect(page).to have_content("Average Age: 28")
  end
end
