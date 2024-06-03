import customtkinter as ctk
from dashboard import Dashboard
from movie import Movie
from watchlist import Watchlist
from auth import Auth, Register
from review import Review

class MainApplication(ctk.CTk):
    def __init__(self):
        super().__init__()

        ctk.set_default_color_theme("dark-blue")

        self.title("Movie App")
        self.geometry("1200x600")
        self.resizable(False, False)
        self.configure(bg="#1c1c1c")

        container = ctk.CTkFrame(self, width=1200, height=600, corner_radius=10, fg_color="#ffffff")
        container.place(relwidth=1, relheight=1)

        self.frames = {}
        for F in (Dashboard, Movie, Watchlist, Auth, Register, Review):
            page_name = F.__name__
            frame = F(parent=container, controller=self)
            self.frames[page_name] = frame
            frame.place(relwidth=1, relheight=1)

        self.show_frame("Auth")

    def show_frame(self, page_name, **kwargs):
        frame = self.frames[page_name]
        if page_name == "Movie":
            movie_id = kwargs.get("movie_id", None)
            callback = kwargs.get("callback", None)
            frame.load_movie(movie_id=movie_id, callback=callback)
        elif page_name == "Review":
            movie_id = kwargs.get("movie_id", None)
            callback = kwargs.get("callback", None)
            frame.set_params(movie_id=movie_id, callback=callback)
        frame.tkraise()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()
