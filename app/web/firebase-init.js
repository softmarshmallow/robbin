import * as firebaseConfig from "./credentials/firebase.config"
console.log(firebaseConfig)

importScripts("https://www.gstatic.com/firebasejs/7.16.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.16.1/firebase-analytics.js");
importScripts("https://www.gstatic.com/firebasejs/7.16.1/firebase-auth.js");

firebase.initializeApp(firebaseConfig);