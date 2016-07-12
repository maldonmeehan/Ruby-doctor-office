require('spec_helper.rb')

describe(Patient) do

  describe("#==") do
    it("is the same patient if it has the same description and list ID ") do
      patient1 = Patient.new({:name => "John", :birthdate => '2016-06-15 00:00:00', :doctor_id => 1})
      patient2 = Patient.new({:name => "John", :birthdate => '2016-06-15 00:00:00', :doctor_id => 1})
      expect(patient1).to(eq(patient2))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

end
