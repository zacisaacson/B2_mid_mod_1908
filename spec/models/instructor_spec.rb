require 'rails_helper'

RSpec.describe Instructor, type: :model do
  describe "relationships" do
    it { should have_many :instructor_students}
    it { should have_many(:students).through(:instructor_students)}
  end

  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "methods" do
    it "can return average age" do
      mike = Instructor.create(name: "Mike")
      mike.students.create(name: "Zac", cohort: 1908, age: 30)
      mike.students.create(name: "Her", cohort: 1908, age: 26)

      expect(mike.average_age).to eq(28.0)
    end
  end
end
