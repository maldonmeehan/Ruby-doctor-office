require('spec_helper.rb')

describe(Patient) do

  describe("#==") do
    it("is the same patient if it has the same description and list ID ") do
      patient1 = Patient.new({:name => "John", :birthdate => '2016-08-01', :doctor_id => 1})
      patient2 = Patient.new({:name => "John", :birthdate => '2016-08-01', :doctor_id => 1})
      expect(patient1).to(eq(patient2))
    end
  end

  describe('.all') do
    it("an array that is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a patient to the array of saved patients") do
      test_patient = Patient.new({:name => "John", :birthdate => '2016-08-01', :doctor_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe("#name") do
    it("gives the patient a name") do
      test_patient = Patient.new({:name => "John", :birthdate => '2016-08-01', :doctor_id => 1})
      expect(test_patient.name()).to(eq("John"))
    end
  end

  describe("#birthdate") do
    it("gives the patient a birthday") do
      test_patient = Patient.new({:name => "John", :birthdate => '2016-08-01', :doctor_id => 1})
      expect(test_patient.birthdate()).to(eq("2016-08-01"))
    end
  end

  describe("#doctor_id") do
    it("lets you read the doctor id out") do
      test_patient = Patient.new({:name => "John", :birthdate => '2016-08-01', :doctor_id => 1})
      expect(test_patient.doctor_id()).to(eq(1))
    end
  end
end
