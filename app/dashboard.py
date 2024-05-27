import customtkinter as ctk
from tkinter import ttk, messagebox
from database import fetch_query, execute_query

class Dashboard(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.create_widgets()

    def create_widgets(self):
        self.label_title = ctk.CTkLabel(self, text="Dashboard", font=("Arial", 24))
        self.label_title.pack(pady=10)

        self.tree_frame = ctk.CTkFrame(self)
        self.tree_frame.pack(fill=ctk.BOTH, expand=True, pady=10)

        self.tree = ttk.Treeview(self.tree_frame, columns=('Title', 'Director', 'Year', 'Genre'), show='headings')
        self.tree.heading('Title', text='Title')
        self.tree.heading('Director', text='Director')
        self.tree.heading('Year', text='Year')
        self.tree.heading('Genre', text='Genre')
        self.tree.pack(fill=ctk.BOTH, expand=True)

        self.load_movies()

        button_frame = ctk.CTkFrame(self)
        button_frame.pack(fill=ctk.X, pady=10)

        self.button_add_movie = ctk.CTkButton(button_frame, text="Add Movie", command=self.add_movie)
        self.button_add_movie.pack(side=ctk.LEFT, padx=5)

        self.button_edit_movie = ctk.CTkButton(button_frame, text="Edit Movie", command=self.edit_movie)
        self.button_edit_movie.pack(side=ctk.LEFT, padx=5)

        self.button_delete_movie = ctk.CTkButton(button_frame, text="Delete Movie", command=self.delete_movie)
        self.button_delete_movie.pack(side=ctk.LEFT, padx=5)

        self.button_add_to_watchlist = ctk.CTkButton(button_frame, text="Add to Watchlist", command=self.add_to_watchlist)
        self.button_add_to_watchlist.pack(side=ctk.LEFT, padx=5)

    def load_movies(self):
        self.tree.delete(*self.tree.get_children())
        query = "SELECT * FROM movies"
        movies = fetch_query(query)
        for movie in movies:
            self.tree.insert('', 'end', values=(movie['title'], movie['director'], movie['release_year'], movie['genre']))

    def add_movie(self):
        self.controller.show_frame("Movie", callback=self.load_movies)

    def edit_movie(self):
        selected_item = self.tree.selection()
        if selected_item:
            movie_title = self.tree.item(selected_item, 'values')[0]
            try:
                query = "SELECT id FROM movies WHERE title = %s"
                result = fetch_query(query, (movie_title,))
                if result:
                    movie_id = result[0]['id']
                    self.controller.show_frame("Movie", movie_id=movie_id, callback=self.load_movies)
                else:
                    messagebox.showerror("Error", "Movie ID not found")
            except mysql.connector.Error as err:
                messagebox.showerror("Error", f"Database error: {err}")
                
    def tkraise(self, *args, **kwargs):
        super().tkraise(*args, **kwargs)
        self.load_movies()

    def delete_movie(self):
        selected_item = self.tree.selection()
        if selected_item:
            movie_title = self.tree.item(selected_item, 'values')[0]
            try:
                query = "SELECT id FROM movies WHERE title = %s"
                result = fetch_query(query, (movie_title,))
                if result:
                    movie_id = result[0]['id']
                    delete_query = "DELETE FROM movies WHERE id = %s"
                    execute_query(delete_query, (movie_id,))
                    messagebox.showinfo("Success", "Movie deleted successfully")
                    self.load_movies()
                else:
                    messagebox.showerror("Error", "Movie ID not found")
            except mysql.connector.Error as err:
                messagebox.showerror("Error", f"Database error: {err}")

    def add_to_watchlist(self):
        self.controller.show_frame("Watchlist")
