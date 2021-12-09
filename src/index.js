// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDnmqQjmWOczHzBeCaT8iJ42BgQ89jTDlw",
  authDomain: "hydrate-58bca.firebaseapp.com",
  projectId: "hydrate-58bca",
  storageBucket: "hydrate-58bca.appspot.com",
  messagingSenderId: "636159238680",
  appId: "1:636159238680:web:69c127632729f8913b196d",
  measurementId: "${config.measurementId}"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(firebaseApp);
const db = getFirestore(firebaseApp);