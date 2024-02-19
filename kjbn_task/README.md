# Beat the Clock App

Welcome to Beat the Clock! This app is designed to challenge your speed and timing skills. With various widgets and timers, you'll have to tap your way through to beat the clock.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Table of Contents
- [Features](#features)
- [Domain Logic](#domain-logic)
- [Splash Screen](#splash-screen)
- [Usage](#usage)
- [Persistence](#persistence)
- [Dependencies](#dependencies)
- [How to Run](#how-to-run)

## Features
1. **Widget 5:** Tappable button to initiate actions.
2. **Widget 4:** Circular timer resetting automatically after 5 seconds.
3. **Widget 3:** Displays success or failure message with score & attempts.
4. **Widget 1:** Shows seconds from the current time.
5. **Widget 2:** Shows a random number between 0 - 59.

## Domain Logic
- Splash screen displayed for 3 seconds upon opening the app.
- Tapping Widget 5 triggers actions:
    - Widget 2 displays a random number between 0 - 59.
    - Widget 1 displays seconds from the tapped time.
- If the random number equals the seconds shown by Widget 1, Widget 3 displays a success message.
- If not, Widget 3 displays a failure message.
- On each tap of Widget 5, Widget 4 counter resets to 5 and counts down.
- Failure occurs if Widget 5 isn't tapped before Widget 4 counts down to 0.

## Splash Screen
The splash screen is designed to introduce users to the app. It displays the app name and transitions to the main page after 3 seconds.

## Usage
Simply tap Widget 5 to trigger actions and beat the clock! Pay attention to Widget 4's timer and aim for success messages displayed in Widget 3.

## Persistence
All values, including scores and attempts, are retained even after closing and reopening the app.

## Dependencies
No external dependencies are required for this app.

## How to Run
1. Clone this repository to your local machine.
2. Open the project in your preferred Flutter development environment.
3. Run the app on an emulator or physical device.

## developer info
1. **Name:** Umang Sojitra
2. **Email:** umangbs123@gmail.com
3. **GitHub:** https://github.com/umangDell/beat_the_clock/tree/master/kjbn_task
