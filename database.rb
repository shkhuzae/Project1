#requiring external sqlite3 module that is installed 
require 'sqlite3'

#defining class DBHandler
class DBHandler
  
  #constructor 
   def initialize
     #error catching
      begin
        #opening student.db database
        db = SQLite3::Database.open "student.db"
        
        #creating Students table with required parameters
        dbstatement = "CREATE TABLE IF NOT EXISTS Students(ID INTEGER PRIMARY KEY, 
        firstname TEXT, lastname TEXT, major TEXT, email TEXT, status TEXT);"
        
        #executing statement
        db.execute dbstatement
        
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
      #end of error catching
   end
   
   #inserting values into Students table
   def create(firstname, lastname, major, email, status)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "INSERT INTO Students(firstname, lastname, major, email, status) VALUES('#{firstname}', '#{lastname}', '#{major}', '#{email}','#{status}');"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   #selecting all students
   def all
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students;"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   #selecting enrolled or graduated students depending on the parameter
   def enrolled(status)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students where status='#{status}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   #selecting a student's record based on their ID
   def get(id)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end    
  
   #updating a student's information based on given parameters
   def update(id, firstname, lastname, major, email, status)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "UPDATE Students SET firstname='#{firstname}', lastname='#{lastname}', major='#{major}', email='#{email}', status='#{status}' WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   #deleting a student's record from the table Students
   def destroy(id)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "DELETE FROM Students WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end    
   
end