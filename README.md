# Bookworm

## Features

### Core Functionality (Must-Have):

- **Home Page:**
  - Displays a visually appealing list of books.
  - Uses placeholder data or integrates with a book API.

- **Reading List/Library:**
  - Users can add books from the home page or manually.
  - Features to:
    - Mark books as "To Read," "Currently Reading," or "Read."
    - Remove books from the reading list.
  - Displays books in a user-friendly format.

- **User Profile:**
  - A basic user profile screen.

- **Book Summary View:**
  - Displays a detailed summary when a book is selected, including:
    - Book Title
    - Author
    - Cover Image (if available)
    - Brief Description/Synopsis
    - List of Chapters (if applicable)

- **Reading View:**
  - Provides a simple and comfortable reading experience with placeholder text.

### Optional Enhancements (Implemented):

- **Search Functionality:**
  - Allows users to search for books in their reading list or on the home page.

- **Data Persistence:**
  - Stores book data locally using Shared Preferences and SQLite.

- **Theming:**
  - Supports both light and dark mode.

- **Integration with Google Books API:**
  - Fetches book details dynamically.

## Installation & Running the Project

### Prerequisites
- Ensure you have Flutter installed. You can download it from [Flutter's official site](https://flutter.dev/docs/get-started/install).
- Set up your development environment (VS Code, Android Studio, etc.).
- Install Dart SDK (comes with Flutter).

### Steps to Run the Project

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/sabin6969/BookWorm
   cd bookworm
   ```

2. **Install Dependencies:**
   ```sh
   flutter pub get
   ```

3. **Create a `.env` File:**
   - Inside the root of your project, create a file named `.env`.
   - Add the following line:
     ```sh
     api_key=your_google_books_api_key_here
     ```

4. **Run the App:**
   ```sh
   flutter run
   ```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.2
  shared_preferences: ^2.5.2
  http: ^1.3.0
  flutter_dotenv: ^5.2.1
  drift: ^2.25.1
  get_it: ^8.0.3
  path_provider: ^2.1.5
  path: ^1.9.0
  sqlite3_flutter_libs: ^0.5.31
  drift_flutter: ^0.2.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.15
  drift_dev: ^2.25.2
```

## Assets
- Make sure you have the following assets in place:
  - `.env`
  - `assets/images/`

| **Image 1** | **Image 2** | **Image 3** |
|------------|------------|------------|
| ![Summary View](https://github.com/user-attachments/assets/c9e8e0f8-aa0d-4173-bf9b-3a9e67b5c8e6) | ![Reading View](https://github.com/user-attachments/assets/95473e39-7552-432a-9dd0-b15e1a80ffb4) | ![Reading List](https://github.com/user-attachments/assets/390067ee-e7f7-44d2-8e5c-002b8cf3c257) |
| **Summary View** | **Reading View** | **Reading List** |

| **Image 4** | **Image 5** | **Image 6** |
|------------|------------|------------|
| ![Reading List 2](https://github.com/user-attachments/assets/bf491cb8-13a5-4b92-ab95-49a5f45d4e4b) | ![Profile Page](https://github.com/user-attachments/assets/5c6197fe-0e04-4e12-9e6d-8284333ee0d7) | ![Dark Theme & Search](https://github.com/user-attachments/assets/7ea488a7-871f-4e72-9dc6-fbd922099291) |
| **Reading List 2** | **Profile Page** | **Dark Theme & Search** |

