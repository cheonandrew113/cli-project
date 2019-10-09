class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :physicians, through: :appointments

  def self.patients
    hi = Patient.all
    hi
  end
end