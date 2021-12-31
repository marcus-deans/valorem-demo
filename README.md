# valorem-demo
Demonstration code of Valorem, a bespoke portfolio recommendation platform to be created as an iOS mobile app. The included code demonstrates the Swift code building the frontend of the application and that connects to the Firebase backend for additional services. The profile customization and setup is defined by this code. Work is ongoing on Valorem, with the financial algorithms being further developed prior to deploying the app.

The ```Onboarding``` directory includes user account creation/login as well as authentication. The initial connection to Firebase is made here in order to allow user profile information to be created/retrieved from the backend.

The ```PortfolioTargetSelection``` directory allows the user to specify the overall characteristics of their portfolio; this is analogous to traditional robo-advisors with a risk/return profile selection. This information is saved under the user's profile in Firebase.

The ```ValueSelectionScreen``` directory allows the user to select the specific values that they want their portfolio to be constructed around: these includes values such as "clean energy", "pure water", "fair pay", and "voting rights". Currently six values are implemented with capability to expand once the financial algorithms are completed. These user selections are similarly saved to the user's profile in Firebase.
