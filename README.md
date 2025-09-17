📚 Library Management System (MySQL)
📌 Overview
This project simulates a simple library database using MySQL. It manages members, books, and borrow transactions, with built-in logic to track availability, borrowing history, and popular genres.

🧱 Schema Highlights
• 	Members: Stores user details
• 	Books: Includes title, author, genre, and available copies
• 	Borrow: Tracks borrow and return dates with foreign key constraints

⚙️ Features
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

🚀 Setup Instructions
1. 	Clone the repo:

2. 	Import the schema and data:

3. 	Run queries from  or test procedures from .

📈 Sample Query


🛣️ Future Enhancements
• 	Add fine calculation for late returns
• 	Include book reviews and ratings
• 	Build a web interface for librarians

📄 License
This project is licensed under the MIT License.