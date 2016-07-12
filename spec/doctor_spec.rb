require('spec_helper.rb')

describe(Doctor) do
  describe(".all") do
    it("starts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the doctors name") do
      doctor = Doctor.new({:name => "Dr. Smith", :specialty => "heart", :id => nil})
      expect(doctor.name()).to(eq("Dr. Smith"))
    end
  end

  describe("#specialty") do
    it("it tells you the doctors speciality") do
      doctor = Doctor.new({:name => "Dr. Smith", :specialty => "heart", :id => nil})
      expect(doctor.specialty()).to(eq("heart"))
      end
    end


  describe("#id") do
    it("it sets the ID when you save it") do
      doctor = Doctor.new({:name => "Dr. Smith", :specialty => "heart", :id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
      end
    end

  describe("#save") do
    it("saves the doctor to a database") do
      doctor = Doctor.new({:name => "Dr. Smith", :specialty => "heart", :id => nil})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#==") do
    it("is the same doctor if they have the same name") do
      doctor1 = Doctor.new({:name => "Dr. Smith", :specialty => "heart", :id => nil})
      doctor2 = Doctor.new({:name => "Dr. Smith", :specialty => "heart", :id => nil})
      expect(doctor1).to eq(doctor2)
    end
  end
end
