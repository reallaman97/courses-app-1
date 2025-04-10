## Setup Flutter

Follow these steps to set up Flutter on your system:

### 1. Download Flutter SDK  
Download the Flutter SDK from the following URL:  
[https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.29.2-stable.zip](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.29.2-stable.zip)

### 2. Extract the SDK  
Extract the zip file into the directory where you want to store the Flutter SDK.  
For example:  
`C:\user\{username}\dev\flutter`

### 3. Add Flutter to PATH  
To run Flutter commands in PowerShell, add Flutter to the `PATH` environment variable.  
This guide assumes you installed the Flutter SDK in:  
`%USERPROFILE%\dev\flutter`

### 4. Set Up Android Studio

1. **Download Android Studio**  
   Download and install Android Studio from:  
   [https://developer.android.com/studio](https://developer.android.com/studio)

2. **Install Flutter and Dart Plugins**  
   - Open Android Studio  
   - Go to `Settings` > `Plugins`  
   - Search for **Flutter** and click `Install`  
   - It will also prompt you to install the **Dart** plugin — accept and install it

3. **Set Flutter SDK Path**  
   - Go to `Settings` > `Languages & Frameworks` > `Flutter`  
   - Set the Flutter SDK path to the directory where you extracted Flutter (e.g., `C:\user\{username}\dev\flutter`)

4. **Install Android SDK and Tools**  
   - Go to `Settings` > `Appearance & Behavior` > `System Settings` > `Android SDK`  
   - Make sure you have installed:
     - Android SDK Platform (any recent version)
     - Android SDK Command-line Tools
     - Android Emulator (optional, for virtual devices)

5. **Set Up an Emulator (Optional)**  
   - Open the **Device Manager** in Android Studio  
   - Click on `Create Device` to create an Android Virtual Device (AVD)

### 5. Clone the Flutter Project  
    Clone the repository from GitHub and open it in a terminal:  
    ```bash
    git clone https://github.com/reallaman97/courses-app
    cd courses-app

### 6. **Run the Flutter App**
    Run the following command to start the app:
    ```bash
    flutter run