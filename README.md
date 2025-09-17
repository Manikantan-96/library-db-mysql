# 📚 Library Management System (MySQL)
##📌 Overview
This project simulates a simple library database using MySQL. It manages members, books, and borrow transactions, with built-in logic to track availability, borrowing history, and popular genres.

##🧱 Schema Highlights
• 	Members: Stores user details
• 	Books: Includes title, author, genre, and available copies
• 	Borrow: Tracks borrow and return dates with foreign key constraints

##⚙️ Features
• 	Queries:
• 	Most borrowed book
• 	Members with multiple borrowings
• 	Books never borrowed
• 	Top genres by popularity
• 	Borrow records with pending returns
• 	Views & Indexes:
• 	 view for reporting
• 	Index on book title for faster search
• 	Triggers:
• 	Auto-decrease/increase available copies on borrow/return
• 	Stored Procedure:
• 	: Transaction-safe borrowing with stock check

##🚀 Setup Instructions
1. 	Clone the repo:
      git clone https://github.com/your-username/library-db.git
     cd library-db
2. 	Import the schema and data:
       source schema.sql;
      source data for table.sql;
3. 	Run queries from  or test procedures from .

###📈 Sample Query 
  Members who borrowed and haven’t returned books
  SELECT m.member_name, bk.title, bo.borrow_date
  FROM members m
  JOIN borrow bo ON m.member_id = bo.member_id
  JOIN books bk ON bo.book_id = bk.book_id
  WHERE bo.return_date IS NULL;
##🛣️ Future Enhancements
• 	Add fine calculation for late returns
• 	Include book reviews and ratings
• 	Build a web interface for librarians

###📄 License

This project is licensed under the MIT License.
