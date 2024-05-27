import customtkinter as ctk
from tkinter import messagebox
from database import fetch_query, execute_query

class Auth(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        self.create_widgets()

    def create_widgets(self):
        self.label_title = ctk.CTkLabel(self, text="Login", font=("Arial", 24))
        self.label_title.pack(pady=20)

        self.entry_username = ctk.CTkEntry(self, placeholder_text="Username")
        self.entry_username.pack(pady=10)

        self.entry_password = ctk.CTkEntry(self, placeholder_text="Password", show="*")
        self.entry_password.pack(pady=10)

        self.button_login = ctk.CTkButton(self, text="Login", command=self.login)
        self.button_login.pack(pady=10)

        self.button_register = ctk.CTkButton(self, text="Register", command=self.show_register)
        self.button_register.pack(pady=10)

    def login(self):
        username = self.entry_username.get()
        password = self.entry_password.get()

        if not username or not password:
            messagebox.showerror("Error", "All fields are required")
            return

        query = "SELECT * FROM users WHERE username = %s AND password = %s"
        user = fetch_query(query, (username, password))

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
        self.create_widgets()

    def create_widgets(self):
        self.label_title = ctk.CTkLabel(self, text="Register", font=("Arial", 24))
        self.label_title.pack(pady=20)

        self.entry_username = ctk.CTkEntry(self, placeholder_text="Username")
        self.entry_username.pack(pady=10)

        self.entry_password = ctk.CTkEntry(self, placeholder_text="Password", show="*")
        self.entry_password.pack(pady=10)

        self.entry_confirm_password = ctk.CTkEntry(self, placeholder_text="Confirm Password", show="*")
        self.entry_confirm_password.pack(pady=10)

        self.button_register = ctk.CTkButton(self, text="Register", command=self.register)
        self.button_register.pack(pady=10)

        self.button_back = ctk.CTkButton(self, text="Back to Login", command=self.back_to_login)
        self.button_back.pack(pady=10)

    def register(self):
        username = self.entry_username.get()
        password = self.entry_password.get()
        confirm_password = self.entry_confirm_password.get()

        if not username or not password or not confirm_password:
            messagebox.showerror("Error", "All fields are required")
            return

        if password != confirm_password:
            messagebox.showerror("Error", "Passwords do not match")
            return

        query = "SELECT * FROM users WHERE username = %s"
        user = fetch_query(query, (username,))
        if user:
            messagebox.showerror("Error", "Username already exists")
            return

        query = "INSERT INTO users (username, password) VALUES (%s, %s)"
        try:
            execute_query(query, (username, password))
            messagebox.showinfo("Success", "User registered successfully")
            self.back_to_login()
        except mysql.connector.Error as err:
            messagebox.showerror("Error", f"Database error: {err}")

    def back_to_login(self):
        self.controller.show_frame("Auth")
