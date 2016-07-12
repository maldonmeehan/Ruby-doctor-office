require('spec_helper.rb')
require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("add a new doctor", {:type => :feature}) do
  it ("allows an admistrator to create a new doctor") do
    visit('/')
    click_link('Add a doctor')
    fill_in('doctor_name', :with => 'Dr. Smith')
    fill_in('specialty', :with => 'Heart')
    click_button('Submit')
    expect(page).to have_content('Your entry has been successfully created!')
  end
end

describe("add a new patient to a doctor path", {:type => :feature}) do
  it ("allows an admistrator to create a new patient to a doctor") do
    doctor = Doctor.new({:name => 'Dr. Smith', :specialty => 'Heart', :id => nil})
    doctor.save()
    visit('/doctors')
  end
end

# click_link('Dr. Smith')
# click_link('Add a Patient')
# fill_in('patient_name', :with => 'Andrea')
# fill_in('birthdate', :with => '1999-08-01')
# click_button('Submit')
# expect(page).to have_content('Your entry has been successfully created!')
