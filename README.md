# Todo App
This is a Flutter todo app that utilizes BLoC state management and clean architecture principles.
The app allows users to add, Update, delete, and filter tasks as All Tasks, Completed Tasks, and Pending Tasks.
#Project Structure:

'lib/' The main directory, which is structured into various layers representing the core of clean architecture.
features/todo/
This directory is specific to the todo feature and is further divided into subdirectories representing different layers of clean architecture.
domain/: Contains the business logic and entities of the todo feature.

repositories/: Abstract repository interfaces that define the operations available for the todo tasks which connect with the bloc for saving in the local database.

data/: Responsible for the data layer, including data models and repository implementations. 
models/:todo_model.dart: Data model that maps the Todo entity to a data structure compatible with local storage or remote services.


presentation/:

Contains the UI and BLoC components for the todo feature.
state/: Manages the state of the todo feature, handling events and emitting states to the UI.
blocs/: three separate efficiency blocs for completed, add todo, list todo for smooth state management experience

screens/:
home_screen.dart: The main screen displaying the list of tasks, with options to add, delete, and filter tasks.

widgets/:
Reusable UI components like task_item.dart, which displays individual tasks.
bottom_nav_bar.dart: for handling bottom bar index
dialog_new_todo.dart: adding new task.
task_list.dart_for display tasks

fonts/: Custom fonts used for styling text in the app.
test/
Contains unit and widget tests for ensuring the correctness of each layer in the clean architecture.

pubspec.yaml
The configuration file for the Flutter project.
Lists all dependencies used in the app (e.g., flutter_bloc, hive, etc.).
Configures assets, fonts, and other settings.

#Instruction on How to run the app.

git clone <https://github.com/ShashiKha9/todoApp_bloc.git>
cd <repository-directory>

**Install dependencies:**
    ```
      flutter pub get
    ```

 **Set up an emulator or connect a device:**
    - For Android: Use Android Studio to set up an emulator.
    - For iOS: Use Xcode to set up a simulator.

  **Using the Terminal:**
    ```bash
  flutter run

   **Using an IDE:**
    - Open the project in Android Studio or VS Code.
    - Select the target device.
    - Click on the "Run" button.
    ```

 To run the unit and widget tests, execute:
```bash
flutter test

Author: Shashi Kha
Email: shashikha1000@gmail.com
GitHub: ShashiKha9

