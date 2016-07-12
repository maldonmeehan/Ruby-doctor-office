require('spec_helper.rb')

describe(Doctor) do
  describe(".all") do
    it("strts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end
end
