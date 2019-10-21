require 'rails_helper'

RSpec.describe "the Students index page" do
  it "should display all students" do
    zac = Student.create(name: "Zac", cohort: 1908, age: 30)
    meg = zac.instructors.create(name: "Meg")
    mike = zac.instructors.create(name: "Mike")

    visit '/students'

    within "#student-#{zac.id}" do
      expect(page).to have_content(zac.name)
      expect(page).to have_content(zac.cohort)
      expect(page).to have_content(zac.age)
      expect(page).to have_link(meg.name)
      expect(page).to have_link(mike.name)
    end
  end
end
