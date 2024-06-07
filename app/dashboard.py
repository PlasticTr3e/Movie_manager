import customtkinter as ctk
from tkinter import ttk, messagebox
from database import fetch_query, execute_query
from customtkinter import CTkImage
from auth import Auth
from PIL import Image

class Dashboard(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        
        self.bg_frame = ctk.CTkFrame(self)
        self.bg_frame.place(relwidth=1, relheight=1)
        
        self.bg = CTkImage(Image.open(r"BG5.png"), size=(1200, 600))
        self.bg_label = ctk.CTkLabel(self.bg_frame, image=self.bg, text="")
        self.bg_label.place(relheight = 1, relwidth=1, relx=0.5, rely=0.5, anchor="center")

        button_frame = ctk.CTkFrame(self.bg_label, fg_color="#0f1b22")
        button_frame.place(relx=0.5, rely=0.15, anchor="center")

        self.button_add_to_watchlist = ctk.CTkButton(button_frame, text="Watchlist", command=self.add_to_watchlist, width=100, height=40, corner_radius=10)
        self.button_add_movie = ctk.CTkButton(button_frame, text="Add Movie", command=self.add_movie, width=100, height=40, corner_radius=10)
        self.button_delete_movie = ctk.CTkButton(button_frame, text="Delete Movie", command=self.delete_movie, width=100, height=40, corner_radius=10)
        self.button_review_movie = ctk.CTkButton(button_frame, text="Add Review", command=self.add_review, width=100, height=40, corner_radius=10)
        self.button_delete_review = ctk.CTkButton(button_frame, text="Delete Review", command=self.delete_review, width=100, height=40, corner_radius=10)
        self.button_logout = ctk.CTkButton(button_frame, text="Logout", command=self.logout, width=100, height=40, corner_radius=10)

        self.button_add_to_watchlist.pack(side=ctk.LEFT, padx=5, pady=5)
        self.button_add_movie.pack(side=ctk.LEFT, padx=5, pady=5)
        self.button_delete_movie.pack(side=ctk.LEFT, padx=5, pady=5)
        self.button_review_movie.pack(side=ctk.LEFT, padx=5, pady=5)
        self.button_delete_review.pack(side=ctk.LEFT, padx=5, pady=5)
        self.button_logout.pack(side=ctk.RIGHT, padx=5, pady=5)

        search_frame = ctk.CTkFrame(self.bg_label, fg_color="#0f1b22")
        search_frame.place(relx=0.5, rely=0.25, anchor="center")

        self.search_var = ctk.StringVar()
        self.search_entry = ctk.CTkEntry(search_frame, textvariable=self.search_var, placeholder_text="Search...", width=200, height=40, corner_radius=10)
        self.search_entry.pack(side=ctk.LEFT, padx=5)
        self.search_button = ctk.CTkButton(search_frame, text="Search", command=self.search_movies, width=100, height=40, corner_radius=10)
        self.search_button.pack(side=ctk.LEFT, padx=5)

        table_frame = ctk.CTkFrame(self.bg_label, corner_radius=20, fg_color="#ffffff", bg_color="#0f1b22")
        table_frame.place(relwidth = 0.84, relheight=0.6,relx=0.5, rely=0.65, anchor="center")

        style = ttk.Style()
        style.theme_use("clam")  
        style.configure("Treeview", 
                        background="#ffffff",
                        foreground="black",
                        rowheight=28,
                        fieldbackground="#f9f9f9",
                        font=('Helvetica', 8))
        style.configure("Treeview.Heading", 
                        background="#f1f1f1",
                        foreground="black",
                        font=('Helvetica', 8, 'bold'))
        style.map('Treeview', 
                  background=[('selected', '#FF8000')], 
                  foreground=[('selected', 'black')])


        self.movie_tree = ttk.Treeview(table_frame, columns=('Title', 'Director', 'Year', 'Genre'), show='headings', style="Treeview")
        self.movie_tree.heading('Title', text='Title')
        self.movie_tree.heading('Director', text='Director')
        self.movie_tree.heading('Year', text='Year')
        self.movie_tree.heading('Genre', text='Genre')
        self.movie_tree.column('Title', anchor='center', width=160)
        self.movie_tree.column('Director', anchor='center' , width=140)
        self.movie_tree.column('Year', anchor='center', width=60)
        self.movie_tree.column('Genre', anchor='center', width=90)
        self.movie_tree.bind('<Double-1>', self.on_double_click)
        self.movie_tree.bind('<<TreeviewSelect>>', self.load_reviews)
        self.movie_tree.pack(fill="both", expand=True, side=ctk.LEFT, padx=20,pady=20)

        self.movie_tree.tag_configure('oddrow', background='#f9f9f9')
        self.movie_tree.tag_configure('evenrow', background='#f0f0f0')

        self.load_movies()

  
        self.review_tree = ttk.Treeview(table_frame, columns=('User', 'Rating', 'Comment'), show='headings', style="Treeview")
        self.review_tree.heading('User', text='User')
        self.review_tree.heading('Rating', text='★')
        self.review_tree.heading('Comment', text='Comment')
        self.review_tree.column('User', anchor='center', width=80)
        self.review_tree.column('Rating', anchor='center', width=30)
        self.review_tree.column('Comment', anchor='center', width=180)
        self.review_tree.pack(fill="both", expand=True, side=ctk.RIGHT,pady=20,padx=20)
        
        self.review_tree.tag_configure('oddrow', background='#f9f9f9')
        self.review_tree.tag_configure('evenrow', background='#f0f0f0')

        
    def load_movies(self):
        self.movie_tree.delete(*self.movie_tree.get_children())
        query = "SELECT * FROM movies"
        movies = fetch_query(query)
        for index, movie in enumerate(movies):
            tag = 'oddrow' if index % 2 == 0 else 'evenrow'
            self.movie_tree.insert('', 'end', values=(movie['title'], movie['director'], movie['release_year'], movie['genre']), tags=(tag,))

    def load_reviews(self, event, movie_title=None):
        self.review_tree.delete(*self.review_tree.get_children())
        selected_item = self.movie_tree.selection()
        if selected_item:
            movie_title = self.movie_tree.item(selected_item, 'values')[0]
        if movie_title:
            query = """
                SELECT u.username, r.rating, r.comment
                FROM reviews r
                JOIN users u ON r.user_id = u.id
                JOIN movies m ON r.movie_id = m.id
                WHERE m.title = %s
            """
            try:
                reviews = fetch_query(query, (movie_title,))
                for index, review in enumerate(reviews):
                    tag = 'oddrow' if index % 2 == 0 else 'evenrow'
                    self.review_tree.insert('', 'end', values=(review['username'], review['rating'], review['comment']), tags=(tag,))
            except Exception as e:
                print(f"Error executing query: {e}")

    def search_movies(self):
        search_term = self.search_var.get()
        query = "SELECT * FROM movies WHERE title LIKE %s OR director LIKE %s"
        search_pattern = f"%{search_term}%"
        movies = fetch_query(query, (search_pattern, search_pattern))
        self.movie_tree.delete(*self.movie_tree.get_children())
        for index, movie in enumerate(movies):
            tag = 'oddrow' if index % 2 == 0 else 'evenrow'
            self.movie_tree.insert('', 'end', values=(movie['title'], movie['director'], movie['release_year'], movie['genre']), tags=(tag,))

    def add_movie(self):
        self.controller.show_frame("Movie", callback=self.load_movies)

    def edit_movie(self):
        selected_item = self.movie_tree.selection()
        if selected_item:
            movie_title = self.movie_tree.item(selected_item, 'values')[0]
            query = "SELECT id FROM movies WHERE title = %s"
            result = fetch_query(query, (movie_title,))
            if result:
                movie_id = result[0]['id']
                self.controller.show_frame("Movie", movie_id=movie_id, callback=self.load_movies)

    def delete_movie(self):
        selected_item = self.movie_tree.selection()
        if selected_item:
            movie_title = self.movie_tree.item(selected_item, 'values')[0]
            query = "SELECT id FROM movies WHERE title = %s"
            result = fetch_query(query, (movie_title,))
            if result:
                movie_id = result[0]['id']
                delete_query = "DELETE FROM movies WHERE id = %s"
                execute_query(delete_query, (movie_id,))
                messagebox.showinfo("Success", "Movie deleted successfully")
                self.load_movies()

    def add_review(self):
        selected_item = self.movie_tree.selection()
        if selected_item:
            movie_title = self.movie_tree.item(selected_item, 'values')[0]
            query = "SELECT id FROM movies WHERE title = %s"
            result = fetch_query(query, (movie_title,))
            if result:
                movie_id = result[0]['id']
                self.controller.show_frame("Review", movie_id=movie_id)
        else:
            messagebox.showerror("Error", "No movie selected")
            
    def delete_review(self):
        selected_item = self.review_tree.selection()
        if selected_item:
            val = self.review_tree.item(selected_item, 'values')
            name = val[0]
            rating = val[1]
            comment = val[2]
            query = """
                SELECT r.id FROM reviews r
                JOIN users u ON r.user_id = u.id
                JOIN movies m ON r.movie_id = m.id
                WHERE u.username = %s AND r.rating = %s AND r.comment = %s
            """
            result = fetch_query(query, (name, rating, comment))
            if result:
                review_id = result[0]['id']
                delete_query = "DELETE FROM reviews WHERE id = %s"
                execute_query(delete_query, (review_id,))
                messagebox.showinfo("Success", "Review deleted successfully")
        else:
            messagebox.showerror("Error", "No review selected")

    def add_to_watchlist(self):
        self.controller.show_frame("Watchlist")

    def on_double_click(self, event):
        self.edit_movie()
        
    def logout(self):
        self.controller.show_frame("Auth")
        
