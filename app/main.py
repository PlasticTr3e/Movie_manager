import customtkinter as ctk
from dashboard import Dashboard
from movie import Movie
from watchlist import Watchlist
from auth import Auth, Register

class MainApplication(ctk.CTk):
    def __init__(self):
        super().__init__()

        self.title("Movie Manager")
        self.geometry("800x600")
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
            movie_id = kwargs.get("movie_id", None)
            callback = kwargs.get("callback", None)
            frame.load_movie(movie_id=movie_id, callback=callback)
        frame.tkraise()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()
