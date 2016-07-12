class Patient
  attr_reader(:name, :birthdate, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  define_method(:==) do |another_patient|
    self.name().==(another_patient.name()).&self.doctor_id().==(another_patient.doctor_id())
    .&self.birthdate().==(another_patient.birthdate())
  end
end
