Patient.destroy_all
Physician.destroy_all
Appointment.destroy_all

100.times {Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)}
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
# Patient.create(name: Faker::FunnyName.name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)


Physician.create(name: "Doctor " + Faker::FunnyName.name, yrs_experience: Faker::Number.between(5, 30), department: ["Pediatric", "Gynecology", "Dermatology", "Neurology", "Cardiology"].sample)

100.times {Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))}
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
# Appointment.create(patient_id: Patient.all.sample.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))


