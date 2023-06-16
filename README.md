# El Intelligente Parque - Smart Parking System

This guide provides step-by-step instructions on how to compile and build an Android APK file for the Flutter application. Follow these steps to generate a release-ready APK for distribution.

## Prerequisites
Before you begin, ensure that you have the following:

- Flutter SDK installed on your machine. You can download it from the official Flutter website: https://flutter.dev.
- Android Studio with the necessary SDKs and tools installed.

## Steps

### Open the project in Android Studio
Launch Android Studio and open the Flutter project you just cloned or copied.

### Configure Android device
Connect an Android device to your computer via USB or set up an emulator using Android Virtual Device Manager (AVD).

### Open the terminal
Open the terminal or command prompt within Android Studio or navigate to the project's root directory using your preferred terminal application.

### Switch to the project directory
Change your current directory to the root directory of your Flutter project using the following command:

```bash
cd /path/to/your/project

```

### Ensure Flutter dependencies are up to date
Run the following command to ensure that all Flutter dependencies are up to date:

```
flutter pub get
```

### Build the APK file
Execute the following command to build the APK file:

```
flutter build apk
```

### Wait for the build process
Wait for the build process to complete. It may take a few minutes depending on the size of your project and the processing power of your computer.

### Locate the APK file
Once the build process finishes successfully, you can find the generated APK file in the following directory:

```
/path/to/your/project/build/app/outputs/flutter-apk/app-release.apk
```

### Install and test the APK
Transfer the APK file to your Android device or emulator, and install it. Launch the application to ensure it functions as expected.