# flc_swe

A new Flutter project.

## Project Description

What: This project is a web application created to display the profile pages of members of the Freshman Leadership Council (FLC). It consists of four primary pages. The landing page acts as a home screen that introduces users to the FLC website. From here, users can go to a profiles page that takes them to a list of class years. Once a specific year is chosen, the council members and board members of that FLC year are presented, allowing the user to click on a profile and view the information about that member. Additionally, there is login functionality that allows admins to view the website from the Admin dashboard view. From here, admins can edit, delete, and add profiles. 

Why: One of the primary goals of the FLC is to prepare their council of freshmen for the future and begin to introduce them into an environment of leadership and professionalism. This website facilitates this by allowing members to not only showcase their professional endeavours but to network with students and alumni who shared those same goals. 

Additionally, FLC made it clear they did not want members to have the ability to edit their profiles and the content they contain. This concern led to the development of the admin side of the website. 

How: The website accomplishes the two above goals by doing the following. It accomplishes the first goal of allowing members to showcase their professional endeavours by giving each member a profile that acts as a platform for their work and interests. This profile has information such as a bio, the student’s major, and contact information. Additionally, it allows for links to other websites such as LinkedIn or personal websites that allow the councilmembers to showcase projects and expand their reach outside the website itself. The profiles also allow members to state what they are looking for, whether that be an internship, job, research, or some additional opportunity. 

The website accomplishes the second goal of creating a network for students and alumni by acting as an archive for FLC members throughout the years. The website was specifically made to be organized by year. Every year, there is a new wave of councilmembers, hence every year will have profiles of past and present members. The goal of this is to allow members to connect with other members or reach out to alumni through the profiles. Current members may find value in looking for professional opportunities by going through the profiles of past members and past members may be able to find like-minded and driven candidates for collaboration or open positions. 

## Project Features
Overview of Website Pages
User View
Landing Page
Class Selection Page
Profile Overview Page
Profile Pages

Admin View (In addition to the above pages)
Class Selection Page (in admin view)
Profile Overview Page (in admin view)
Edit/Add Profile Page
Admin Login Page

## Software Guidelines
Requirements
-Windows 10 or Mac OS 10.12
-This website runs best on Google Chrome
-Internet Connection is required

Current Versions
Flutter Version 2.0.4

If you have any questions on installing or downloading Flutter, below are some links for guidance. This is primarily for running the project locally or developing the project further. 
https://flutter.dev/docs/get-started/install 
https://flutter.dev/docs/get-started/web 

An overview of Dependency Versions. These can be found in the pubspec.yaml file

Firebase Information and Dependencies
This code is found in index.html and is used to initialize the used versions of firebase

Firebase.src and Firebase.json are the two main files where the configuration of Firebase is documented and the Firebase Hosting is set up.

For deployment, there is no API Key necessary for Firebase. For hosting, you can get the Firebase key by logging into the Firebase project, gear icon, and clicking Project Setting. 

You should then scroll down to the bottom of the page and see the Firebase SDK snippet. Here, you can click Automatic to see the code implemented into the official index.html of the project. For specific information about the Firebase Configuration, click on CDN. A picture is taken below to show the specifics of this key. 

## Running the Application Locally
Clone the Github repository to a folder of your choice or unzip the file containing the project code (we will call the location of the  contents in this folder the project level directory)
See https://docs.github.com/en/github/getting-started-with-github/about-remote-repositories for more information on cloning a repository
Find the project level directory where the project and its files are stored
Run the command flutter run -d chrome in your command line prompt
For other browsers, see the following documentation 
https://flutter.dev/docs/get-started/web 
This should bring up a new google chrome page (or other browser) containing the website

## Contact Us
Emails:
lewisdaniel@ufl.edu
arielweitzenfeld@ufl.edu
ekinatay@ufl.edu
aliu1@ufl.edu
