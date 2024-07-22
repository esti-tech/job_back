# EplusApp
## peep
This setup includes a React frontend with job posting and registration pages, along with a Node.js backend for handling API requests and storing data in MySQL. The UI/UX design uses the specified colors and fonts to maintain a consistent branding for Peep Travel Agent.

You can further expand the dashboard functionality and integrate the job posting and registration systems into a complete application with additional features like user authentication, role management, and data visualization.


## v0.0.1
 - the back end has functionalities
 > registering users for these version it can be said applicants since it directly related to application process
 > there is a user managment where registered users can login using their password 
    > for these version user managment works fine but to limit the exposure of admin functionalities we manually prohibit users from login but one admin
    > admin   credential can be set in the code 
     - email : peep@eplusapp.et
     - password :789264
> admin can add job posts 
> admin can view all job posts he has been posted
TODO : delete and edit functionalities are not done
> admin can view all users that have been applied for a job posted
> admin can see their attached document like cv and cover letter
> users can see jobs available in the home page
> users can see the detail information about the job and can apply by filling required filledes
> users can submit their document in pdf format. {only pdf is allowed}

### installation
- to get the exact result we have got we upload the database alongside these code so
- install nessacary packages using 
> npm install
> create database peeddb
> npm start