require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/patient')
require('./lib/doctor')
require('pg')

DB = PG.connect({:dbname => "doctor_office"})

get('/') do
  erb(:index)
end

get("/doctors") do
  @doctors = Doctor.all
  erb(:doctors)
end

get("/doctors/new") do
  erb(:doctor_form)
end

post("/doctors") do
  name = params.fetch("doctor_name")
  specialty = params.fetch("specialty")
  @doctor = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  @doctor.save()
  erb(:success)
end

get("/patients/new") do
  erb(:patient_form)
end

post("/patients") do
  name = params.fetch("patient_name")
  birthdate = params.fetch("birthdate")
  doctor_id = params.fetch("doctor_id")
  @patient = Patient.new({:name => name, :birthdate => birthdate, :doctor_id => nil})
  @patient.save()
  erb(:success)
end
