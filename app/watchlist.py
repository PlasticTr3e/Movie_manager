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
        
        self.bg_frame = ctk.CTkFrame(self, width=1200, height=600, corner_radius=0, fg_color="#ffffff")
        self.bg_frame.pack(fill="both", expand=True)
        
        self.label_title = ctk.CTkLabel(self.bg_frame, text="Watchlist", font=("Arial", 24), text_color="#333333")
        self.label_title.pack(pady=10)

        # Create and organize the form frame
        form_frame = ctk.CTkFrame(self.bg_frame, fg_color="#ffffff")
        form_frame.pack(fill=tk.X, pady=5, padx=10)

        self.label_name = ctk.CTkLabel(form_frame, text="Watchlist Name", font=("Arial", 14), text_color="#333333")
        self.label_name.grid(row=0, column=0, padx=5, pady=5, sticky="w")

        self.entry_name = ctk.CTkEntry(form_frame, width=300, height=40, corner_radius=10)
        self.entry_name.grid(row=0, column=1, padx=5, pady=5, sticky="w")

        self.button_create = ctk.CTkButton(form_frame, text="Create Watchlist", width=150, height=40, corner_radius=20, command=self.create_watchlist)
        self.button_create.grid(row=1, column=0, padx=5, pady=5, sticky="w")
        
        self.button_delete = ctk.CTkButton(form_frame, text="Delete Watchlist", width=150, height=40, corner_radius=20, command=self.delete_watchlist)
        self.button_delete.grid(row=1, column=1, padx=5, pady=5, sticky="w")

        # Divide the space into two sections: the watchlist table and the movies list side by side
        table_frame = ctk.CTkFrame(self.bg_frame, fg_color="#ffffff", width=1000, height=350)
        table_frame.pack(fill=ctk.BOTH, expand=True, pady=10)

        watchlist_table_frame = ctk.CTkFrame(table_frame, fg_color="#ffffff", width=500)
        watchlist_table_frame.pack(fill=ctk.BOTH, expand=True, side=ctk.LEFT, padx=10, pady=5)

        movie_list_frame = ctk.CTkFrame(table_frame, fg_color="#ffffff", width=500)
        movie_list_frame.pack(fill=ctk.BOTH, expand=True, side=ctk.RIGHT, padx=10, pady=5)

        # Treeview for watchlists
        style = ttk.Style()
        style.theme_use("clam")
        style.configure("Treeview", 
                        background="#ffffff",
                        foreground="black",
                        rowheight=25,
                        fieldbackground="#f9f9f9",
                        font=('Arial', 12))
        style.configure("Treeview.Heading", 
                        background="#f1f1f1",
                        foreground="black",
                        font=('Arial', 12, 'bold'))
        style.map('Treeview', 
                  background=[('selected', '#e1e1e1')], 
                  foreground=[('selected', 'black')])

        self.tree = ttk.Treeview(watchlist_table_frame, columns=('Name'), show='headings', style="Treeview")
        self.tree.heading('Name', text='Name')
        self.tree.pack(fill=ctk.BOTH, expand=True)
        self.tree.bind('<<TreeviewSelect>>', self.load_watchlist_movies)

        # Listbox for movies in selected watchlist
        self.movies_listbox = tk.Listbox(movie_list_frame, height=10, font=('Arial', 12))
        self.movies_listbox.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)

        # Movie ID and add movie frame
        movie_frame = ctk.CTkFrame(self.bg_frame, fg_color="#ffffff")
        movie_frame.pack(fill=tk.X, pady=5, padx=10)

        self.label_movie = ctk.CTkLabel(movie_frame, text="Movie ID to Add", font=("Arial", 14), text_color="#333333")
        self.label_movie.grid(row=0, column=0, padx=5, pady=5, sticky="w")

        self.entry_movie_id = ctk.CTkEntry(movie_frame, width=300, height=40, corner_radius=10)
        self.entry_movie_id.grid(row=0, column=1, padx=5, pady=5, sticky="w")

        self.button_add_movie = ctk.CTkButton(movie_frame, text="Add Movie to Watchlist", width=200, height=40, corner_radius=20, command=self.add_movie_to_watchlist)
        self.button_add_movie.grid(row=1, column=0, padx=5, pady=5, sticky="w")

        self.button_back = ctk.CTkButton(movie_frame, text="Back to Dashboard", width=200, height=40, corner_radius=20, command=self.back_to_dashboard)
        self.button_back.grid(row=1, column=1, padx=5, pady=5, sticky="w")

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
                    self.load_watchlist_movies(None)
                except Exception as err:
                    messagebox.showerror("Error", f"Error: {err}")

    def back_to_dashboard(self):
        self.controller.show_frame("Dashboard")

    def tkraise(self, *args, **kwargs):
        super().tkraise(*args, **kwargs)
        self.load_watchlists()
