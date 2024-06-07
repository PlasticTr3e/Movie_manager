import customtkinter as ctk
import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from database import execute_query, fetch_query
from customtkinter import CTkImage
from PIL import Image

class Watchlist(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.selected_watchlist_id = None
        
        #Background frame 
        self.bg_frame = ctk.CTkFrame(self, width=1200, height=600, corner_radius=0, fg_color="#ffffff")
        self.bg_frame.pack(fill="both", expand=True)
        self.bg = CTkImage(Image.open(r"BG\BG7.png"), size=(1200, 600))
        self.bg_label = ctk.CTkLabel(self.bg_frame, image=self.bg, text="")
        self.bg_label.place(relheight=1, relwidth=1, relx=0.5, rely=0.5, anchor="center")

        #Frame untuk tombol create dan delete wachlist
        form_frame = ctk.CTkFrame(self.bg_label, fg_color="#0f1b22", width=500, height=120, bg_color="#0f1b22")
        form_frame.place(x=10, y=60)
        self.entry_name = ctk.CTkEntry(form_frame, width=300, height=40, corner_radius=10, placeholder_text="Create your watchlist here")
        self.entry_name.place(x=5, y=5)
        self.button_create = ctk.CTkButton(form_frame, text="Create Watchlist", width=150, height=40, corner_radius=20, command=self.create_watchlist)
        self.button_create.place(x=5, y=60)
        self.button_delete = ctk.CTkButton(form_frame, text="Delete Watchlist", width=150, height=40, corner_radius=20, command=self.delete_watchlist)
        self.button_delete.place(x=160, y=60)

        #Frame untuk table watchlist
        table_frame = ctk.CTkFrame(self.bg_label, fg_color="#0f1b22", width=1000, height=350, bg_color="#0f1b22")
        table_frame.place(x=10, y=180)
        watchlist_table_frame = ctk.CTkFrame(table_frame, fg_color="#0f1b22", width=500, height=288, bg_color="#0f1b22")
        watchlist_table_frame.place(x=10, y=10)
        movie_list_frame = ctk.CTkFrame(table_frame, fg_color="#0f1b22", width=500, height=288, bg_color="#0f1b22")
        movie_list_frame.place(x=510, y=10)
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

        #Table Watchlist
        self.tree = ttk.Treeview(watchlist_table_frame, columns=('Name'), show='headings', style="Treeview")
        self.tree.heading('Name', text='Name')
        self.tree.place(relwidth=1, relheight=1)
        self.tree.bind('<<TreeviewSelect>>', self.load_watchlist_movies)

        #Table Movies dalam watchlist
        self.movies_listbox = tk.Listbox(movie_list_frame, height=10, font=('Arial', 12))
        self.movies_listbox.place(relwidth=1, relheight=1)


        movie_frame = ctk.CTkFrame(self.bg_frame, fg_color="#0f1b22", width=500, height=100, bg_color="#0f1b22")
        movie_frame.place(x=10, y=500)
        self.entry_movie_id = ctk.CTkEntry(movie_frame, width=300, height=32, corner_radius=10, placeholder_text="Movie ID to Add")
        self.entry_movie_id.place(x=5, y=5)
        self.button_add_movie = ctk.CTkButton(movie_frame, text="Add Movie to Watchlist", width=150, height=32, corner_radius=20, command=self.add_movie_to_watchlist)
        self.button_add_movie.place(x=5, y=60)
        self.button_back = ctk.CTkButton(movie_frame, text="Back to Dashboard", width=150, height=32, corner_radius=20, command=self.back_to_dashboard)
        self.button_back.place(x=220, y=60)
        
    #Get watchlist_id from watchlists
    def load_watchlists(self):
        self.tree.delete(*self.tree.get_children())
        query = "SELECT id, name FROM watchlists WHERE user_id=%s"
        watchlists = fetch_query(query, (self.controller.user_id,))
        for watchlist in watchlists:
            self.tree.insert('', 'end', values=(watchlist['name'],))
    
    #Get movies.titile dari watchlist using watchlist_id
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

    #Create watchlist
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

    #Delete watchlist
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

    #Add movie to watchlist
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

    #Back to dashboard
    def back_to_dashboard(self):
        self.controller.show_frame("Dashboard")

    #Gatau ngapain pokoknya biar watclistnya langsung ke load. credit gpt
    def tkraise(self, *args, **kwargs):
        super().tkraise(*args, **kwargs)
        self.load_watchlists()
