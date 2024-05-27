import customtkinter as ctk
from auth import Auth, Register
from dashboard import Dashboard
from watchlist import Watchlist
from movie import Movie

class MainApplication(ctk.CTk):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.geometry("800x768")
        self.title("Movie Manager")
        self.user_id = None
        self.container = ctk.CTkFrame(self)
        self.container.pack(fill="both", expand=True)

        self.frames = {}
        for F in (Dashboard, Movie, Watchlist, Auth, Register):  
            page_name = F.__name__
            frame = F(parent=self.container, controller=self)
            self.frames[page_name] = frame
            frame.grid(row=0, column=0, sticky="nsew")

        self.show_frame("Auth")

    def show_frame(self, page_name, **kwargs):
        frame = self.frames[page_name]
        if page_name == "Movie":
            movie_frame = self.frames["Movie"]
            movie_id = kwargs.get("movie_id", None)
            if movie_id:
                movie_frame.load_movie(movie_id)
            else:
                movie_frame.movie_id = None
                movie_frame.entry_title.delete(0, ctk.END)
                movie_frame.entry_director.delete(0, ctk.END)
                movie_frame.entry_year.delete(0, ctk.END)
                movie_frame.entry_genre.delete(0, ctk.END)
                movie_frame.entry_description.delete(0, ctk.END)
        frame.tkraise()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()
