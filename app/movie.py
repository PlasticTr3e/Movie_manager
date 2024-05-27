import customtkinter as ctk
from tkinter import messagebox
from database import fetch_query, execute_query

class Movie(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.movie_id = None
        self.callback = None
        self.create_widgets()

    def create_widgets(self):
        self.label_title = ctk.CTkLabel(self, text="Movie Details", font=("Arial", 24))
        self.label_title.pack(pady=10)

        self.entry_title = ctk.CTkEntry(self, placeholder_text="Title")
        self.entry_title.pack(pady=5)
        self.entry_director = ctk.CTkEntry(self, placeholder_text="Director")
        self.entry_director.pack(pady=5)
        self.entry_year = ctk.CTkEntry(self, placeholder_text="Year")
        self.entry_year.pack(pady=5)
        self.entry_genre = ctk.CTkEntry(self, placeholder_text="Genre")
        self.entry_genre.pack(pady=5)

        self.label_description = ctk.CTkLabel(self, text="Description")
        self.label_description.pack(pady=5)
        self.text_description = ctk.CTkTextbox(self, width=400, height=100)
        self.text_description.pack(pady=5)

        self.button_save = ctk.CTkButton(self, text="Save Movie", command=self.save_movie)
        self.button_save.pack(pady=10)

    def load_movie(self, movie_id=None, callback=None):
        self.movie_id = movie_id
        self.callback = callback
        if movie_id:
            query = "SELECT * FROM movies WHERE id = %s"
            movie = fetch_query(query, (movie_id,))
            if movie:
                self.entry_title.delete(0, ctk.END)
                self.entry_title.insert(0, movie[0]['title'])
                self.entry_director.delete(0, ctk.END)
                self.entry_director.insert(0, movie[0]['director'])
                self.entry_year.delete(0, ctk.END)
                self.entry_year.insert(0, movie[0]['release_year'])
                self.entry_genre.delete(0, ctk.END)
                self.entry_genre.insert(0, movie[0]['genre'])
                self.text_description.delete("1.0", ctk.END)
                self.text_description.insert("1.0", movie[0]['description'])

    def save_movie(self):
        title = self.entry_title.get()
        director = self.entry_director.get()
        year = self.entry_year.get()
        genre = self.entry_genre.get()
        description = self.text_description.get("1.0", ctk.END).strip()

        if self.movie_id:
            query = "UPDATE movies SET title = %s, director = %s, release_year = %s, genre = %s, description = %s WHERE id = %s"
            execute_query(query, (title, director, year, genre, description, self.movie_id))
        else:
            query = "INSERT INTO movies (title, director, release_year, genre, description) VALUES (%s, %s, %s, %s, %s)"
            execute_query(query, (title, director, year, genre, description))

        if self.callback:
            self.callback()
        self.controller.show_frame("Dashboard")
    
    
