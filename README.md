# SkillKu

The user friendly and easy to use course training & job seeking platform. This app delivers up-to-date job opening right on the hand of its users and industry standard training courses available.

## Description

This app is created using Flutter 3.19.6 Stable, developed with clean MVC architecture. This app uses Scraped API of Google Job from SerpAPI for the job opening list and Firebase Realtime Database to fetch the course training list. This app also implementing Firebase Authentication to delivers ease of access for the user login.

Note: Currently this app isn't meant to accommodate job and course appliances, in this version, the app only to be meant as catalogues

## Getting Started
### 1. If you want to try this app by cloning this repository, please follow this instruction below:
1. Clone the repository
```
git clone https://github.com/MAI-BEBI-POWDER-TEAM/SkillKu/
```
2. Open the cloned SkillKu and head to **SkillKu/lib/utils/**
3. Inside this **SkillKu/lib/utils/**, create a new file called **secret.dart** (make sure it's all lowercases)
4. Now open this link in your browser https://serpapi.com/ and create / login your account
5. If your account is created, you should found **Your Private API Key** on https://serpapi.com/dashboard
6. Copy that API Key, paste into your **secret.dart** like this, **follow the variable name** 
```
const String jobApiKey = 'JUST_PASTE_YOUR_API_KEY_HERE';
```
7. Awesome, now try running the app!


### 2. Try the Android version, this is the quickest option
1. Just go to ["Releases" section of this repository](https://github.com/MAI-BEBI-POWDER-TEAM/SkillKu/releases)
2. Then download the **skillku-v101-release.apk** or **skillku-v101-debug.apk**
