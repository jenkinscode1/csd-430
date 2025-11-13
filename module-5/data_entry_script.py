"""
Author: Jelani Jenkins
Date: 11/12/2025
Assignment: Module 5 and 6 

I select the Movies topic for my database project.

For the database you will:
Title the database CSD430. 
The username will be student1. 
The password will be ‘pass’. 
The table name will be <studentfirstname>_movies_data.  
For each module you are to include an updated index.jsp to hold links to all module’s CRUD deliverables. 

"""

import mysql.connector 
from mysql.connector import errorcode
from pathlib import Path 
from dotenv import dotenv_values
import os, sys
BASE_DIR = Path(__file__).resolve().parent.parent 

ENV = Path(os.path.join(BASE_DIR,".env"))
secrets = dotenv_values(ENV) 

config = {
    "user": secrets["USER"],
    "password": secrets["PASSWORD"],
    "host": secrets["HOST"],
    "autocommit": True
}

writer =None
conn = None

def reconnect_to_db():  
    global conn
    if conn:
        conn = None
    db = mysql.connector.connect(**config) 
    conn = db
    cur = conn.cursor()
    return cur

cursor = reconnect_to_db()
cursor.execute("CREATE DATABASE IF NOT EXISTS CSD430;")
cursor.execute("USE CSD430;")

cursor.execute(f"""
    CREATE TABLE IF NOT EXISTS jelani_movies_data (
        movie_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        genre VARCHAR(50),
        release_year INT,
        rating DECIMAL(3,1),
        director VARCHAR(100)
    );
""")

movies = [
    ("Inception", "Science Fiction", 2010, 8.8, "Christopher Nolan"),
    ("The Matrix", "Action", 1999, 8.7, "The Wachowskis"),
    ("Gladiator", "Drama", 2000, 8.5, "Ridley Scott"),
    ("Interstellar", "Adventure", 2014, 8.6, "Christopher Nolan"),
    ("The Dark Knight", "Action", 2008, 9.0, "Christopher Nolan"),
    ("Titanic", "Romance", 1997, 7.8, "James Cameron"),
    ("Avatar", "Science Fiction", 2009, 7.9, "James Cameron"),
    ("The Godfather", "Crime", 1972, 9.2, "Francis Ford Coppola"),
    ("Jurassic Park", "Adventure", 1993, 8.1, "Steven Spielberg"),
    ("Forrest Gump", "Drama", 1994, 8.8, "Robert Zemeckis")
]

insert_query = f"""
    INSERT INTO jelani_movies_data(title, genre, release_year, rating, director)
    VALUES (%s, %s, %s, %s, %s);
"""

cursor.executemany(insert_query, movies)

print("Database and table created successfully.")
print(f"Inserted {cursor.rowcount} movie records into jelani_movies_data.")

cursor.execute(f"SELECT * FROM jelani_movies_data;")
for row in cursor.fetchall():
    print(row)

cursor.close()
