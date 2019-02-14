require 'sqlite3'

class DBHandler
   def initialize
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "CREATE TABLE IF NOT EXISTS Students(ID INTEGER PRIMARY KEY, 
        firstname TEXT, lastname TEXT, major TEXT, email TEXT, status TEXT);"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end
   
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