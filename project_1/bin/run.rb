require 'pry'
require_relative '../config/environment'


    # ----------------------------------------------------------------------------------------
    # --------------- Greeting Methods -------------------------------------------------------
    # ----------------------------------------------------------------------------------------

    def greet
       puts "Welcome!"
    end

    def greet_patient
            patient_name_response = gets.chomp.downcase
            partz = patient_name_response.split(" ")
            new_partz = []
      
            partz.each do |part|
                 new_partz << part[0].upcase + part[1..-1].downcase
            end
                @proper_patient_name = new_partz.join(" ")
    
                @new_patient = Patient.find_or_create_by(name: @proper_patient_name, age: Faker::Number.between(1, 80), gender: Faker::Gender.binary_type)
    end

    def greet_physician
        physician_name_response = gets.chomp.downcase
        partz = physician_name_response.split(" ")
        new_partz = []
  
        partz.each do |part|
             new_partz << part[0].upcase + part[1..-1].downcase
        end
            @proper_physician_name = new_partz.join(" ")

            @new_physician = Physician.find_or_create_by(name: @proper_physician_name, yrs_experience: Faker::Number.between(5, 30), department: ["Pediatric", "Gynecology", "Dermatology", "Nerology", "Cardiology"].sample)
                 new_appt_physician = Appointment.create(patient_id: Patient.all.sample.id, physician_id: @new_physician.id, appointment_date: Faker::Date.forward(60))
    end

    # ----------------------------------------------------------------------------------------
    # --------- Ask the user patient or physician---------------------------------------------
    # ----------------------------------------------------------------------------------------

    def physician_or_patient_question
        puts "Are you a patient or physician? Please enter 'patient' or 'physician'"
    end
    
    # ----------------------------------------------------------------------------------------
    # ------------------ Physican Methods ----------------------------------------------------
    # ----------------------------------------------------------------------------------------

    def avg_patient_age
        ages = Patient.average("age").round(1)
        ages
    end 

    def senior_patients
        seniors = Patient.where("age >= 65").count
        seniors
    end

    def male_patients
        male_pats = Patient.where("gender = 'Male'").count
        male_pats
    end

    def next_appointment
        next_app_for_user_physician = @new_physician.appointments.map do |appt|
            appt.appointment_date
        end
        next_app_for_user_physician
    end

    # ----------------------------------------------------------------------------------------
    # ------------------- Patient Methods ----------------------------------------------------
    # ----------------------------------------------------------------------------------------

    def dr_avg_yrs_exp
        avg_yr_exp = Physician.average("yrs_experience").round(1)
        avg_yr_exp
    end

    def create_new_appt
        @new_appt1 = Appointment.create(patient_id: @new_patient.id, physician_id: Physician.all.sample.id, appointment_date: Faker::Date.forward(60))
        # appt_date = @new_patient.appointments.map do |appt|
        #     appt.appointment_date
        # end
        @new_appt1.appointment_date
    end

    def your_physician_name
        if @new_appt1.blank? == true
     
            puts "Hmmmm... It looks like you don't have an appointment with a physician yet. Please make an appointment to find out about your physician's name!"
        else
        
            puts "Your physician's name is: #{physician_name_finder}. You should be excited to meet your physician!"
        end
    end

    def physician_name_finder
        physician_finder_using_id = @new_appt1.physician_id
        your_doc_name = Physician.find(physician_finder_using_id).name
        your_doc_name
    end

    def specialty_finder
        physician_finder_using_id = @new_appt1.physician_id
        your_doc_spec = Physician.find(physician_finder_using_id).department
        your_doc_spec
    end

    def your_physician_specialty

        if @new_appt1.blank? == true
 
            puts "Hmmmm... It looks like you don't have an appointment with a physician yet. Please make an appointment to find out about your physician's practice specialty."
        else
    
            puts "Your physician's specialty is: #{specialty_finder}. Are you excited???????????"
        end
    end

    def change_pati_appt
        if @new_appt1.blank? == true
      
            puts "Hmmmm... It looks like you don't have a scheduled appointment. Please make an appointment to reschedule your appointment!"
        else

        to_update = Appointment.where({patient_id: [@new_patient.id]})
        updated_appointment_date_attribute = to_update.update(appointment_date: Faker::Date.forward(60))

        rescheduled_appointment_date_selector = updated_appointment_date_attribute.map do |resched_appt|
            resched_appt.appointment_date
            end
     
            puts "Roger that! Your Doctor's appointment is rescheduled for: #{rescheduled_appointment_date_selector}. See you then!" 

        end
    end #end the chage_pati_appt method

    def cancel_appt
        @cancel_appt_variable = @new_appt1.delete
    end
    
    def empty_appt_checker
        if @new_appt1.blank? == true
   
            puts "Hmmmm... It looks like you don't have a scheduled appointment. Please make an appointment to cancel!"
        else
            cancel_appt

            puts "Okay, your appointment has been canceled. Here is your confirmation nunmber: #{cancel_appt}"
        end
    end

    # ----------------------------------------------------------------------------------------
    # ------------------ Menu prompt methods -------------------------------------------------
    # ----------------------------------------------------------------------------------------

    def menu_prompt_physician
        prompt = ">"
        puts "______________________________________________________________________________________"
        puts " "
        puts "Please choose from the following options (Type in number, then hit enter!)"
            sleep(0.5)
        puts "1. Your patients' average age"
            sleep(0.25)
        puts "2. Your next appointment"
            sleep(0.25)
        puts "3. How many patients are seniors (65+)?"
            sleep(0.25)
        puts "4. How many male patients are there?"
            sleep(0.25)
        puts "5. Exit"

        print prompt
    end

    def menu_prompt_patient

        prompt = ">"
        puts "______________________________________________________________________________________"
        puts " "
        puts "Please choose from the following options (Type in number, then hit enter!)"
            sleep(0.5)
        puts "1. Find out all of the Doctors' average years of experience working at this Hospital."
            sleep(0.25)
        puts "2. Create a new Doctor's appointment"
            sleep(0.25)
        puts "3. Reschedule your Doctor's appointment date (You must choose option 2 first!)."
            sleep(0.25)
        puts "4. Find out about your Doctor's specialty (You must choose option 2 first!)"
            sleep(0.25)
        puts "5. Find out about your Doctor's name (You must choose option 2 first!)"
            sleep(0.25)
        puts "6. Cancel your Doctor's appointment (You must choose option 2 first!)"
            sleep(0.25)
        puts "7. Exit"

        print prompt
    end
    
    def phy_or_pat_prompt
        @response_string1 = gets.chomp.downcase
    end

    # ----------------------------------------------------------------------------------------
    # -------------- Physician and Patient Execution Methods----------------------------------
    # ----------------------------------------------------------------------------------------

    def physician_execution_method
        if @response_string1 == "Physician".downcase
            sleep(0.45)
            puts "------------------------------------------------------------------------------------ " 
            puts "You've entered #{@response_string1.capitalize}."
            puts " "
            sleep(0.2)
            puts "------------------------------------------------------------------------------------ " 
            puts " "
            sleep(0.2)
            puts "Please enter your full name"
            puts " "
            puts " "
            greet_physician
                sleep(1)
            puts "_____________________________________________________________________________________"
            puts " "
            puts "Welcome, Doctor #{@proper_physician_name}!"
            puts " "
                sleep(0.3)

            menu_prompt_physician

            while @response_string2 = gets.chomp
                case @response_string2
                    
                when "1"
                    puts "The average age of your patients is #{avg_patient_age}"
                        sleep(2.25)
                    menu_prompt_physician

                when "2"
                    puts "The appointment is on #{next_appointment}. Plenty of time for a vacation until then!"
                        sleep(2.25)
                    menu_prompt_physician

                when "3"
                    puts "There are #{senior_patients} patient(s) who are 65 or older."
                        sleep(2.25)
                    menu_prompt_physician

                when "4"
                    puts "There are #{male_patients} male patients."
                        sleep(2.25)
                    menu_prompt_physician

                when "5"
                    break
                
                else 
                    puts " "
                    puts "I said a number between 1-5 ONLY!!! Please enter a number between 1 - 5"
                        sleep(1.2)
                    menu_prompt_physician
                    
                exit if @response_string2 == "5"
                
                end
            end
            puts "Your program will end now. Goodbye"
        end
                # puts "Your program will end now. Goodbye"
    end

    def patient_execution_method
        if @response_string1 == "Patient".downcase
        sleep(0.45)
        puts "------------------------------------------------------------------------------------ " 
        puts "You've entered #{@response_string1.capitalize}"
        puts " "
        sleep(0.2)
        puts "------------------------------------------------------------------------------------ " 
        puts " "
        sleep(0.2)
        puts "Please enter your full name"
        puts " "
        puts " "
        greet_patient
            sleep(1)
        puts "_____________________________________________________________________________________"
        puts " "
        puts "Welcome, #{@proper_patient_name}!"
        puts " "
        
        sleep(0.3)
            
            menu_prompt_patient
            while @response_string2 = gets.chomp
                case @response_string2
                    
                when "1"
                    puts "The average years of experience of doctors is #{dr_avg_yrs_exp} year(s)."
                        sleep(2.25)
                    menu_prompt_patient

                when "2"
                    
                    puts "You're all set! Your appointment is schedule for #{create_new_appt}"
                        sleep(2.25)
                    menu_prompt_patient

                when  "3"
                    change_pati_appt
                        sleep(2.25)
                    menu_prompt_patient

                when "4"
                    your_physician_specialty
                    sleep(2.25)
                    menu_prompt_patient

                when "5"
                    your_physician_name
                    sleep(2.25)
                    menu_prompt_patient

                when "6"
                    empty_appt_checker
                    sleep(2.25)
                    menu_prompt_patient

                when "7"
                    break
                
                else 
                    puts "I said a number between 1-7 ONLY!!!! Please enter a number between 1 - 7"
                        sleep(1.2)
                    menu_prompt_patient
                    
                exit if @response_string2 == "7"
                
                end
            end

    
             puts "Your program will end now. Goodbye"
        end #end if, elsif statements
        
    end

    # ----------------------------------------------------------------------------------------
    # ---------------------- Execution -------------------------------------------------------
    # ----------------------------------------------------------------------------------------

    def run
        greet
        sleep(0.5)
        physician_or_patient_question
        phy_or_pat_prompt

        #start physician menu
        physician_execution_method

        #start patient menu    
        patient_execution_method

    end

    # ----------------------------------------------------------------------------------------
    # ---------------------- Run the Application ---------------------------------------------
    # ----------------------------------------------------------------------------------------

    run


