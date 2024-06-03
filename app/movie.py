import customtkinter as ctk
from tkinter import messagebox
from database import fetch_query, execute_query
from customtkinter import CTkImage
from PIL import Image

class Movie(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.movie_id = None
        self.callback = None
        
        self.bg_frame = ctk.CTkFrame(self, width=1200, height=600, corner_radius=0, fg_color="#ffffff")
        self.bg_frame.pack(fill="both", expand=True)
        
        self.bg = CTkImage(Image.open(r"C:\Users\diata\OneDrive\Documents\Bagas\Tugas\UNPAD\Semester 2\Sistem Data\Praktikum\UAS_PROJECT\Movie_manager\app\BG3.png"), size=(1200, 600))
        self.bg_label = ctk.CTkLabel(self.bg_frame, image=self.bg, text="")
        self.bg_label.place(relheight = 1, relwidth=1, relx=0.5, rely=0.5, anchor="center")

        self.entry_title = ctk.CTkEntry(self.bg_label, width=300, height=40, corner_radius=20, placeholder_text="Title" ,bg_color="#836969" )
        self.entry_title.place(relx=0.2, rely=0.3, anchor="center")
        
        self.entry_director = ctk.CTkEntry(self.bg_label, width=300, height=40, corner_radius=20, placeholder_text="Director",bg_color="#836969")
        self.entry_director.place(relx=0.2, rely=0.4, anchor="center")
        
        self.entry_year = ctk.CTkEntry(self.bg_label, width=300, height=40, corner_radius=20, placeholder_text="Year",bg_color="#836969")
        self.entry_year.place(relx=0.2, rely=0.5, anchor="center")
        
        self.entry_genre = ctk.CTkEntry(self.bg_label, width=300, height=40, corner_radius=20, placeholder_text="Genre",bg_color="#836969")
        self.entry_genre.place(relx=0.2, rely=0.6, anchor="center")

        self.label_description = ctk.CTkLabel(self.bg_label, text="Description", font=("Arial", 24), text_color="#333333",bg_color="#796a6b")
        self.label_description.place(relx=0.56, rely=0.26, anchor="center")
        
        self.text_description = ctk.CTkTextbox(self.bg_label, width=400, height=250, corner_radius=20,bg_color="#836969")
        self.text_description.place(relx=0.56, rely=0.52, anchor="center")

        self.button_save = ctk.CTkButton(self.bg_label, text="Save Movie", width=200, height=40, corner_radius=20, command=self.save_movie,bg_color="#836969")
        self.button_save.place(relx=0.2, rely=0.75, anchor="center")
        
        self.button_back = ctk.CTkButton(self.bg_label, text="Back to Dashboard", width=200, height=40, corner_radius=20, command=self.back_to_dashboard,bg_color="#836969")
        self.button_back.place(relx=0.2, rely=0.85, anchor="center")

    def load_movie(self, movie_id=None, callback=None):
        self.clear_fields()
        self.movie_id = movie_id
        self.callback = callback
        if movie_id:
            query = "SELECT * FROM movies WHERE id = %s"
            movie = fetch_query(query, (movie_id,))
            if movie:
                mov_id = f"{movie[0]['title']} ({movie[0]['id']})"
                self.entry_title.insert(0, mov_id)
                self.entry_director.insert(0, movie[0]['director'])
                self.entry_year.insert(0, movie[0]['release_year'])
                self.entry_genre.insert(0, movie[0]['genre'])
                self.text_description.insert("1.0", movie[0]['description'])

    def save_movie(self):
        title = self.entry_title.get()
        director = self.entry_director.get()
        year = self.entry_year.get()
        genre = self.entry_genre.get()
        description = self.text_description.get("1.0", ctk.END).strip()
        if not title or not director or not year or not genre:
            messagebox.showerror("Error", "All fields are required")
            return
        try:
            if self.movie_id:
                query = "UPDATE movies SET title = %s, director = %s, release_year = %s, genre = %s, description = %s WHERE id = %s"
                execute_query(query, (title, director, year, genre, description, self.movie_id))
            else:
                query = "INSERT INTO movies (title, director, release_year, genre, description) VALUES (%s, %s, %s, %s, %s)"
                execute_query(query, (title, director, year, genre, description))
            messagebox.showinfo("Success", "Movie saved successfully")
            if self.callback:
                self.callback()
            self.controller.show_frame("Dashboard")
        except Exception as err:
            messagebox.showerror("Error", f"Database error: {err}")
    
    def clear_fields(self):
        self.entry_title.delete(0, ctk.END)
        self.entry_director.delete(0, ctk.END)
        self.entry_year.delete(0, ctk.END)
        self.entry_genre.delete(0, ctk.END)
        self.text_description.delete("1.0", ctk.END)

    def back_to_dashboard(self):
        self.controller.show_frame("Dashboard")
