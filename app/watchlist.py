import customtkinter as ctk
import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from database import execute_query, fetch_query

class Watchlist(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.selected_watchlist_id = None
        self.create_widgets()

    def create_widgets(self):
        self.label_name = ctk.CTkLabel(self, text="Watchlist Name")
        self.label_name.pack(pady=5)

        self.entry_name = ctk.CTkEntry(self)
        self.entry_name.pack(pady=5)

        self.button_create = ctk.CTkButton(self, text="Create Watchlist", command=self.create_watchlist)
        self.button_create.pack(pady=5)
        
        self.button_delete = ctk.CTkButton(self, text="Delete Watchlist", command=self.delete_watchlist)
        self.button_delete.pack(pady=5)

        self.tree_frame = ctk.CTkFrame(self)
        self.tree_frame.pack(fill=ctk.BOTH, expand=True, pady=10)
        
        self.tree = ttk.Treeview(self.tree_frame, columns=('Name'), show='headings')
        self.tree.heading('Name', text='Name')
        self.tree.pack(fill=ctk.BOTH, expand=True)
        self.tree.bind('<<TreeviewSelect>>', self.load_watchlist_movies)
        
        self.label_movie = ctk.CTkLabel(self, text="Movie ID to Add")
        self.label_movie.pack(pady=5)

        self.entry_movie_id = ctk.CTkEntry(self)
        self.entry_movie_id.pack(pady=5)

        self.button_add_movie = ctk.CTkButton(self, text="Add Movie to Watchlist", command=self.add_movie_to_watchlist)
        self.button_add_movie.pack(pady=5)
        
        self.button_back = ctk.CTkButton(self, text="Back to Dashboard", command=self.back_to_dashboard)
        self.button_back.pack(pady=5)

        self.movies_listbox = tk.Listbox(self)
        self.movies_listbox.pack(fill=tk.BOTH, expand=True, pady=5)

    def load_watchlists(self):
        self.tree.delete(*self.tree.get_children())
        query = "SELECT id, name FROM watchlists WHERE user_id=%s"
        watchlists = fetch_query(query, (self.controller.user_id,))
        for watchlist in watchlists:
            self.tree.insert('', 'end', values=(watchlist['name'],))
    
    def load_watchlist_movies(self, event):
        self.movies_listbox.delete(0, tk.END)
        selected_item = self.tree.selection()
        if selected_item:
            watchlist_name = self.tree.item(selected_item)['values'][0]
            query = "SELECT id FROM watchlists WHERE name = %s AND user_id = %s"
            watchlist_id_result = fetch_query(query, (watchlist_name, self.controller.user_id))
            if watchlist_id_result:
                watchlist_id = watchlist_id_result[0]['id']
                self.selected_watchlist_id = watchlist_id
                query = "SELECT movies.title FROM movies INNER JOIN watchlist_movies ON movies.id = watchlist_movies.movie_id WHERE watchlist_movies.watchlist_id = %s"
                movies = fetch_query(query, (watchlist_id,))
                for movie in movies:
                    self.movies_listbox.insert(tk.END, movie['title'])

    def create_watchlist(self):
        name = self.entry_name.get()
        if not name:
            messagebox.showerror("Error", "Watchlist name cannot be empty")
            return
        query = "INSERT INTO watchlists (user_id, name) VALUES (%s, %s)"
        try:
            execute_query(query, (self.controller.user_id, name))
            messagebox.showinfo("Success", "Watchlist created successfully")
            self.load_watchlists()
        except Exception as err:
            messagebox.showerror("Error", f"Error: {err}")

    def delete_watchlist(self):
        selected_item = self.tree.selection()
        if selected_item:
            watchlist_name = self.tree.item(selected_item)['values'][0]
            query = "SELECT id FROM watchlists WHERE name = %s AND user_id = %s"
            watchlist_id_result = fetch_query(query, (watchlist_name, self.controller.user_id))
            if watchlist_id_result:
                watchlist_id = watchlist_id_result[0]['id']
                query = "DELETE FROM watchlists WHERE id = %s"
                try:
                    execute_query(query, (watchlist_id,))
                    messagebox.showinfo("Success", "Watchlist deleted successfully")
                    self.load_watchlists()
                    self.movies_listbox.delete(0, tk.END)
                except Exception as err:
                    messagebox.showerror("Error", f"Error: {err}")

    def add_movie_to_watchlist(self):
        selected_item = self.tree.selection()
        if selected_item:
            watchlist_name = self.tree.item(selected_item)['values'][0]
            query = "SELECT id FROM watchlists WHERE name = %s AND user_id = %s"
            watchlist_id_result = fetch_query(query, (watchlist_name, self.controller.user_id))
            if watchlist_id_result:
                watchlist_id = watchlist_id_result[0]['id']
                movie_id = self.entry_movie_id.get()
                if not movie_id:
                    messagebox.showerror("Error", "Movie ID cannot be empty")
                    return
                query = "INSERT INTO watchlist_movies (watchlist_id, movie_id) VALUES (%s, %s)"
                try:
                    execute_query(query, (watchlist_id, movie_id))
                    messagebox.showinfo("Success", "Movie added to watchlist successfully")
                    self.load_watchlist_movies(None)
                except Exception as err:
                    messagebox.showerror("Error", f"Error: {err}")

    def back_to_dashboard(self):
        self.controller.show_frame("Dashboard")

    def tkraise(self, *args, **kwargs):
        super().tkraise(*args, **kwargs)
        self.load_watchlists()