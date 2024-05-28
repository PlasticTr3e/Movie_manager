import customtkinter as ctk
from tkinter import messagebox
from database import execute_query

class Review(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.movie_id = None
        self.callback = None
        self.create_widgets()
        
    def set_params(self, movie_id=None, callback=None):
        self.movie_id = movie_id
        self.callback = callback

    def create_widgets(self):
        self.label_title = ctk.CTkLabel(self, text="Add Review", font=("Arial", 24))
        self.label_title.pack(pady=10)

        self.label_rating = ctk.CTkLabel(self, text="Rating (1-5)")
        self.label_rating.pack(pady=5)
        self.rating_var = ctk.StringVar()
        self.rating_entry = ctk.CTkEntry(self, textvariable=self.rating_var)
        self.rating_entry.pack(pady=5)

        self.label_comment = ctk.CTkLabel(self, text="Comment")
        self.label_comment.pack(pady=5)
        self.comment_text = ctk.CTkTextbox(self, height=10)
        self.comment_text.pack(pady=5)

        self.submit_button = ctk.CTkButton(self, text="Submit", command=self.submit_review)
        self.submit_button.pack(pady=20)

    def submit_review(self):
        rating = self.rating_var.get()
        comment = self.comment_text.get("1.0", "end-1c")
        user_id = self.controller.user_id 

        if not rating.isdigit() or not (1 <= int(rating) <= 5):
            messagebox.showerror("Error", "Rating must be a number between 1 and 5")
            return

        query = "INSERT INTO reviews (user_id, movie_id, rating, comment) VALUES (%s, %s, %s, %s)"
        try:
            execute_query(query, (user_id, self.movie_id, rating, comment))
            messagebox.showinfo("Success", "Review submitted successfully")
            if self.callback:
                self.callback()
            self.controller.show_frame("Dashboard")
        except Exception as e:
            print(f"Error submitting review: {e}")
            messagebox.showerror("Error", "Failed to submit review")
