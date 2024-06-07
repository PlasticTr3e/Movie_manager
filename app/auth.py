import customtkinter as ctk
from customtkinter import CTkImage
from PIL import Image
from tkinter import messagebox
from database import fetch_query, execute_query
import mysql.connector
import hashlib

class Auth(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent, corner_radius=0)
        self.controller = controller
        self.configure(bg_color="#ffffff", fg_color="#ffffff")
        
        self.bg_frame = ctk.CTkFrame(self, width=1200, height=600, corner_radius=0, fg_color="#ffffff")
        self.bg_frame.pack(fill="both", expand=True)
        
        self.bg = CTkImage(Image.open(r"C:\Users\diata\OneDrive\Documents\Bagas\Tugas\UNPAD\Semester 2\Sistem Data\Praktikum\UAS_PROJECT\Movie_manager\app\BG.png"), size=(1200, 600))
        self.bg_label = ctk.CTkLabel(self.bg_frame, image=self.bg)
        self.bg_label.place(relheight = 1, relwidth=1, relx=0.5, rely=0.5, anchor="center")
        
        login_form_frame = ctk.CTkFrame(self.bg_label, fg_color="#f0f0f0", bg_color="#22333e", corner_radius=20)
        login_form_frame.place(relheight = 0.6, relwidth= 0.38, relx=0.5, rely=0.6, anchor="center")

        self.welcome_label = ctk.CTkLabel(login_form_frame, text="Welcome", font=("Helvetica", 24), text_color="#333333", bg_color="transparent")
        self.welcome_label.place(relx=0.5, rely=0.15, anchor="center")

        self.sub_welcome_button = ctk.CTkButton(login_form_frame, text="Don't have an account?", text_color="#333333", font=("Helvetica", 12), fg_color="#f0f0f0", command=self.show_register)
        self.sub_welcome_button.place(relx=0.5, rely=0.23, anchor="center")

        self.entry_username = ctk.CTkEntry(login_form_frame, width=260, height=40, corner_radius=10, placeholder_text="Username")
        self.entry_username.place(relx=0.5, rely=0.43, anchor="center")
    
        self.entry_password = ctk.CTkEntry(login_form_frame, width=260, height=40, corner_radius=10, placeholder_text="Password", show="*")
        self.entry_password.place(relx=0.5, rely=0.58, anchor="center")

        self.login_button = ctk.CTkButton(login_form_frame, text="LOGIN", width=200, height=40, corner_radius=20, command=self.login)
        self.login_button.place(relx=0.5, rely=0.83, anchor="center")

    def login(self):
        username = self.entry_username.get()
        password = self.entry_password.get()

        if not username or not password:
            messagebox.showerror("Error", "All fields are required")
            return

        password_hash = hashlib.sha256(password.encode()).hexdigest()
        query = "SELECT * FROM users WHERE username = %s AND password = %s"
        user = fetch_query(query, (username, password_hash))

        if user:
            self.controller.user_id = user[0]['id']
            self.controller.show_frame("Dashboard")
        else:
            messagebox.showerror("Error", "Invalid username or password")

    def show_register(self):
        self.controller.show_frame("Register")

class Register(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        
        self.bg_frame = ctk.CTkFrame(self, width=1200, height=700, corner_radius=0, fg_color="#ffffff")
        self.bg_frame.pack(fill="both", expand=True)
        
        self.bg = CTkImage(Image.open(r"C:\Users\diata\OneDrive\Documents\Bagas\Tugas\UNPAD\Semester 2\Sistem Data\Praktikum\UAS_PROJECT\Movie_manager\app\BG2.png"), size=(1200, 600))
        self.bg_label = ctk.CTkLabel(self.bg_frame, image=self.bg,text="")
        self.bg_label.place(relheight = 1, relwidth=1, relx=0.5, rely=0.5, anchor="center")

        # Username Entry
        self.entry_username = ctk.CTkEntry(self.bg_frame, width=300, height=40,  placeholder_text="Username", bg_color="#4d4842")
        self.entry_username.place(relx=0.5, rely=0.24, anchor="center")

        # Email Entry
        self.entry_email = ctk.CTkEntry(self.bg_frame, width=300, height=40,  placeholder_text="Email", bg_color="#484240")
        self.entry_email.place(relx=0.5, rely=0.34, anchor="center")

        # Password Entry
        self.entry_password = ctk.CTkEntry(self.bg_frame, width=300, height=40,  placeholder_text="Password", show="*", bg_color="#9d7f63")
        self.entry_password.place(relx=0.5, rely=0.44, anchor="center")

        # Confirm Password Entry
        self.entry_confirm_password = ctk.CTkEntry(self.bg_frame, width=300, height=40,  placeholder_text="Confirm Password", show="*", bg_color="#9a7151")
        self.entry_confirm_password.place(relx=0.5, rely=0.54, anchor="center")

        # Register Button
        self.button_register = ctk.CTkButton(self.bg_frame, text="Register", width=200, height=40,  command=self.register, bg_color="#a3824d")
        self.button_register.place(relx=0.5, rely=0.68, anchor="center")

        # Back to Login Button
        self.button_back = ctk.CTkButton(self.bg_frame, text="Back to Login", width=200, height=40,  command=self.back_to_login, bg_color="#ad8c4d")
        self.button_back.place(relx=0.5, rely=0.78, anchor="center")

    def register(self):
        username = self.entry_username.get()
        email = self.entry_email.get()
        password = self.entry_password.get()
        confirm_password = self.entry_confirm_password.get()

        if not username or not email or not password or not confirm_password:
            messagebox.showerror("Error", "All fields are required")
            return

        if password != confirm_password:
            messagebox.showerror("Error", "Passwords do not match")
            return

        query = "SELECT * FROM users WHERE username = %s OR email = %s"
        user = fetch_query(query, (username, email))
        if user:
            messagebox.showerror("Error", "Username or Email already exists")
            return

        password_hash = hashlib.sha256(password.encode()).hexdigest()
        query = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)"
        try:
            execute_query(query, (username, email, password_hash))
            messagebox.showinfo("Success", "User registered successfully")
            self.back_to_login()
        except mysql.connector.Error as err:
            messagebox.showerror("Error", f"Database error: {err}")

    def back_to_login(self):
        self.controller.show_frame("Auth")
