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
