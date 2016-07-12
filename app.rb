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
