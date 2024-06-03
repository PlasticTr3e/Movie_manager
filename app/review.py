import customtkinter as ctk
from tkinter import messagebox
from database import execute_query

class Review(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.movie_id = None
        self.callback = None
        
        self.bg_frame = ctk.CTkFrame(self, width=1200, height=600, corner_radius=0, fg_color="#ffffff")
        self.bg_frame.pack(fill="both", expand=True)
        
    def set_params(self, movie_id=None, callback=None):
        self.movie_id = movie_id
        self.callback = callback

        self.label_title = ctk.CTkLabel(self.bg_frame, text="Add Review", font=("Arial", 24), text_color="#333333")
        self.label_title.pack(pady=20)

        self.label_rating = ctk.CTkLabel(self.bg_frame, text="Rating (1-5)", font=("Arial", 14), text_color="#333333")
        self.label_rating.pack(pady=5)
        self.rating_var = ctk.StringVar()
        self.rating_entry = ctk.CTkEntry(self.bg_frame, textvariable=self.rating_var, width=300, height=40, corner_radius=10)
        self.rating_entry.pack(pady=10)

        self.label_comment = ctk.CTkLabel(self.bg_frame, text="Comment", font=("Arial", 14), text_color="#333333")
        self.label_comment.pack(pady=5)
        self.comment_text = ctk.CTkTextbox(self.bg_frame, width=300, height=100, corner_radius=10)
        self.comment_text.pack(pady=10)

        self.submit_button = ctk.CTkButton(self.bg_frame, text="Submit", width=200, height=40, corner_radius=20, command=self.submit_review)
        self.submit_button.pack(pady=20)
        
        self.submit_button = ctk.CTkButton(self.bg_frame, text="Back", width=200, height=40, corner_radius=20, command=self.back_to_dashboard)
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
            self.clear_fields()
            if self.callback:
                self.callback()
            self.controller.show_frame("Dashboard")
        except Exception as e:
            print(f"Error submitting review: {e}")
            messagebox.showerror("Error", "Failed to submit review")
            
    def clear_fields(self):
        self.rating_entry.delete(0, ctk.END)
        self.comment_text.delete("1.0", ctk.END)
        
    def back_to_dashboard(self):
        self.controller.show_frame("Dashboard")
