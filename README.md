# Taskier - Task Manager built with Flutter & Appwrite

Taskier is a Flutter app that serves as a tasks/todo manager, allowing users to add and manage their tasks. The app is designed to explore the capabilities of Appwrite, a backend as a service (BaaS) platform. It leverages the power of Appwrite to securely store and synchronize tasks, providing a seamless offline and online experience for users.

## Features

- User authentication: Users can sign up, log in, and securely authenticate themselves within the app.
- Task management: Add, edit, and delete tasks with ease. Mark tasks as completed or pending, and prioritize them using custom categories.
- Offline storage: The app utilizes HiveDB, a lightweight NoSQL database, to store tasks locally on the device. This ensures that users can access and modify tasks even when they are offline.
- Automatic synchronization: Whenever an internet connection is available, Taskier automatically syncs the local task data with the Appwrite backend, ensuring that tasks are always up to date.
- Real-time updates: Taskier leverages the real-time capabilities of Appwrite to provide instant updates to the task list across multiple devices.

## Installation

1. Ensure that you have Flutter installed. For more information on Flutter installation, refer to the official [Flutter documentation](https://flutter.dev/docs/get-started/install).

2. Clone the Taskier repository:

   ```bash
   git clone https://github.com/your-username/Taskier.git
   ```

3. Navigate to the project directory:

   ```bash
   cd Taskier
   ```

4. Install the required dependencies:

   ```bash
   flutter pub get
   ```

5. Launch the app on your preferred device:

   ```bash
   flutter run
   ```

## Configuration

To use Taskier with Appwrite, you need to set up an Appwrite backend and obtain the necessary credentials. Follow these steps:

1. Sign up for an Appwrite account at [appwrite.io](https://appwrite.io).

2. Create a new project in the Appwrite dashboard.

3. Note down your Appwrite endpoint URL and project ID.

4. Create an API key for your project and copy it.

5. Open the Taskier project in your preferred code editor.

6. Locate the `lib/appwrite/appwrite_config.dart` file.

7. Replace the placeholder values with your Appwrite endpoint URL, project ID, and API key.

   ```dart
   const String appwriteEndpoint = 'YOUR_APPWRITE_ENDPOINT_URL';
   const String appwriteProjectId = 'YOUR_APPWRITE_PROJECT_ID';
   const String appwriteApiKey = 'YOUR_APPWRITE_API_KEY';
   ```

8. Save the file.

9. You're ready to use Taskier with your Appwrite backend!

## Contributing

Contributions to Taskier are welcome! If you encounter any bugs, have suggestions for new features, or want to contribute code improvements, please create an issue or submit a pull request to the project repository.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

Taskier makes use of the following open-source libraries and frameworks:

- [Flutter](https://flutter.dev/)
- [Appwrite](https://appwrite.io/)
- [Hive](https://pub.dev/packages/hive)

## Contributing

Contributions to Taskier are welcome! If you encounter any bugs, have suggestions for new features, or want to contribute code improvements, please create an issue or submit a pull request to the project repository. 

## Contact

If you have any questions or need further assistance, feel free to contact the project maintainer at [your-email@example.com](mailto:chat@codesadhu.com).

Happy task management with Taskier!

Certainly! Here's the modified "Contributing" section of the readme, including the contributor:

