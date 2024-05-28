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

        button_frame = ctk.CTkFrame(self)
        button_frame.pack(fill=ctk.X, pady=10)

        self.button_add_movie = ctk.CTkButton(button_frame, text="Add Movie", command=self.add_movie)
        self.button_edit_movie = ctk.CTkButton(button_frame, text="Edit Movie", command=self.edit_movie)
        self.button_delete_movie = ctk.CTkButton(button_frame, text="Delete Movie", command=self.delete_movie)
        self.button_add_movie.pack(side=ctk.LEFT, padx=5, pady=5, expand=True)
        self.button_edit_movie.pack(side=ctk.LEFT, padx=5, pady=5, expand=True)
        self.button_delete_movie.pack(side=ctk.LEFT, padx=5, pady=5, expand=True)
        
        self.button_review_movie = ctk.CTkButton(button_frame, text="Add Review", command=self.add_review)
        self.button_review_movie.pack(side=ctk.LEFT, padx=5, pady=5, expand=True)
        
        button_frame.pack(anchor=ctk.CENTER)

        search_frame = ctk.CTkFrame(self)
        search_frame.pack(fill=ctk.X, pady=10)

        self.search_var = ctk.StringVar()
        self.search_entry = ctk.CTkEntry(search_frame, textvariable=self.search_var, placeholder_text="Search...")
        self.search_entry.pack(side=ctk.LEFT, fill=ctk.X, expand=True, padx=5)
        self.search_button = ctk.CTkButton(search_frame, text="Search", command=self.search_movies)
        self.search_button.pack(side=ctk.LEFT, padx=5)
        
        self.tree_frame = ctk.CTkFrame(self)
        self.tree_frame.pack(fill=ctk.BOTH, expand=True, pady=10)

        self.tree = ttk.Treeview(self.tree_frame, columns=('Title', 'Director', 'Year', 'Genre'), show='headings')
        self.tree.heading('Title', text='Title')
        self.tree.heading('Director', text='Director')
        self.tree.heading('Year', text='Year')
        self.tree.heading('Genre', text='Genre')
        self.tree.bind('<Double-1>', self.on_double_click)
        self.tree.pack(fill=ctk.BOTH, expand=True)

        self.load_movies()

        review_frame = ctk.CTkFrame(self)
        review_frame.pack(fill=ctk.BOTH, expand=True, pady=10)

        self.review_tree = ttk.Treeview(review_frame, columns=('User', 'Rating', 'Comment'), show='headings')
        self.review_tree.heading('User', text='User')
        self.review_tree.heading('Rating', text='Rating')
        self.review_tree.heading('Comment', text='Comment')
        self.review_tree.pack(fill=ctk.BOTH, expand=True)

        self.load_reviews_button = ctk.CTkButton(review_frame, text="Load Reviews", command=self.load_reviews)
        self.load_reviews_button.pack(pady=5)

        watchlist_frame = ctk.CTkFrame(self)
        watchlist_frame.pack(fill=ctk.X, pady=10)

        self.button_add_to_watchlist = ctk.CTkButton(watchlist_frame, text="Watchlist", command=self.add_to_watchlist)
        self.button_add_to_watchlist.pack(side=ctk.LEFT, padx=5, pady=5)

    def load_movies(self):
        self.tree.delete(*self.tree.get_children())
        query = "SELECT * FROM movies"
        movies = fetch_query(query)
        for movie in movies:
            self.tree.insert('', 'end', values=(movie['title'], movie['director'], movie['release_year'], movie['genre']))

    def load_reviews(self):
        selected_item = self.tree.selection()
        if selected_item:
            movie_title = self.tree.item(selected_item, 'values')[0]

            query = """
                SELECT u.username, r.rating, r.comment
                FROM reviews r
                JOIN users u ON r.user_id = u.id
                JOIN movies m ON r.movie_id = m.id
                WHERE m.title = %s
            """
            try:
                reviews = fetch_query(query, (movie_title,))
            except Exception as e:
                print(f"Error executing query: {e}")
                reviews = None

            if reviews:
                self.review_tree.delete(*self.review_tree.get_children())
                for review in reviews:
                    self.review_tree.insert('', 'end', values=(review['username'], review['rating'], review['comment']))
            else:
                messagebox.showinfo("Info", "No reviews found for the selected movie.")
        else:
            messagebox.showerror("Error", "No movie selected")

    def search_movies(self):
        search_term = self.search_var.get()
        query = "SELECT * FROM movies WHERE title LIKE %s OR director LIKE %s"
        search_pattern = f"%{search_term}%"
        movies = fetch_query(query, (search_pattern, search_pattern))
        self.tree.delete(*self.tree.get_children())
        for movie in movies:
            self.tree.insert('', 'end', values=(movie['title'], movie['director'], movie['release_year'], movie['genre']))

    def add_movie(self):
        self.controller.show_frame("Movie", callback=self.load_movies)

    def edit_movie(self):
        selected_item = self.tree.selection()
        if selected_item:
            movie_title = self.tree.item(selected_item, 'values')[0]
            query = "SELECT id FROM movies WHERE title = %s"
            result = fetch_query(query, (movie_title,))
            if result:
                movie_id = result[0]['id']
                self.controller.show_frame("Movie", movie_id=movie_id, callback=self.load_movies)
            else:
                messagebox.showerror("Error", "Movie ID not found")

    def delete_movie(self):
        selected_item = self.tree.selection()
        if selected_item:
            movie_title = self.tree.item(selected_item, 'values')[0]
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

    def add_review(self):
        selected_item = self.tree.selection()
        if selected_item:
            movie_title = self.tree.item(selected_item, 'values')[0]
            query = "SELECT id FROM movies WHERE title = %s"
            result = fetch_query(query, (movie_title,))
            if result:
                movie_id = result[0]['id']
                self.controller.show_frame("Review", movie_id=movie_id)
            else:
                messagebox.showerror("Error", "Movie ID not found")
        else:
            messagebox.showerror("Error", "No movie selected")

    def add_to_watchlist(self):
        self.controller.show_frame("Watchlist")

    def on_double_click(self, event):
        self.edit_movie()
