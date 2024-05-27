import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from database import execute_query, fetch_query

class Review(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        self.create_widgets()

    def create_widgets(self):
        self.label_movie_id = tk.Label(self, text="Movie ID")
        self.label_movie_id.pack(pady=5)

        self.entry_movie_id = tk.Entry(self)
        self.entry_movie_id.pack(pady=5)

        self.label_rating = tk.Label(self, text="Rating (1-5)")
        self.label_rating.pack(pady=5)

        self.entry_rating = tk.Entry(self)
        self.entry_rating.pack(pady=5)

        self.label_comment = tk.Label(self, text="Comment")
        self.label_comment.pack(pady=5)

        self.entry_comment = tk.Entry(self)
        self.entry_comment.pack(pady=5)

        self.button_submit = tk.Button(self, text="Submit Review", command=self.submit_review)
        self.button_submit.pack(pady=5)

        self.tree = ttk.Treeview(self, columns=('User', 'Movie', 'Rating', 'Comment'), show='headings')
        self.tree.heading('User', text='User')
        self.tree.heading('Movie', text='Movie')
        self.tree.heading('Rating', text='Rating')
        self.tree.heading('Comment', text='Comment')
        self.tree.pack(fill=tk.BOTH, expand=True, pady=5)

        self.load_reviews()

    def load_reviews(self):
        self.tree.delete(*self.tree.get_children())
        query = "SELECT * FROM reviews"
        reviews = fetch_query(query)
        for review in reviews:
            self.tree.insert('', 'end', values=(review['user_id'], review['movie_id'], review['rating'], review['comment']))

    def submit_review(self):
        movie_id = self.entry_movie_id.get()
        rating = self.entry_rating.get()
        comment = self.entry_comment.get()
        query = "INSERT INTO reviews (user_id, movie_id, rating, comment) VALUES (%s, %s, %s, %s)"
        try:
            execute_query(query, (self.controller.user_id, movie_id, rating, comment))
            messagebox.showinfo("Success", "Review submitted successfully")
            self.load_reviews()
        except mysql.connector.Error as err:
            messagebox.showerror("Error", f"Error: {err}")
