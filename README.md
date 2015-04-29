# SDFC Form
Sun Devil Fitness Complex Form is a web-based and mobile application thata allows students/faculty to submit SDFC forms (end of shift and accident reports) to database through logging into a system. Administrators or managers will have their own username, which allows them to log in and view the reports by each different search criteria. The project will contain all the requirements and information provided by the ASU gym, SDFC.

##Sun Devil Fitness
Arizona State University’s Sun Devil Fitness Complex (SDFC) enhances the ASU experience by providing programs, services and facilities that promote healthy lifestyles, build community and enable student success. Sun Devil Fitness offers a variety of recreation, fitness and sport opportunities that include intramurals, group exercise, personal training, sport clubs and instructional classes.

##Product Backlog
[![Stories in Ready](https://badge.waffle.io/asu-cis-capstone/sdfc.svg?label=ready&title=Ready)](http://waffle.io/asu-cis-capstone/sdfc)


##Getting Started / How to Install
###How to Install and test SDFC webpage
1. The provided files on our repository will contain everything you need to download and use.
2. The required software will be Microsoft Visual Studio and MySQL Workbench.
3. In order to test our webpage, simply open SDFC.suo file and run with web browser(Google Chrome is recommended)
4. Login with our guest account in order to test everything with all the permissions // ID - guest, Password - password

###How to connect the Amazon Web Services 
1. In order to test our AWS locally, you need to install MySQL from Orcale: http://dev.mysql.com/downloads/installer/
2. After installing it, open the MySQL Workbench and set up a new MySQL connection
3. Simply put all the information given below
  - Hostname: cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com // Port: 3306 // Username and Password: will be provided soon.

<br/>
##Release Notes
- Version 0.1
  - Initial repository, waffle.io integration, visual mock-up

- Version 0.2
  - Done with basic CSS and HTML for desktop and mobile
 
- Version 0.3
  - Got connection working to AWS
  - Done with login functionality
  - Done with html canvas for writing signature on mobile

- Version 0.4
  - Added search functionality
  - Improvement for styling on homepage with different color and font

- Version 0.5
  - Done with CSS and HTML for the most part on desktop
  - Added some test data in MySQL; few employees and managers information added

- Version 0.6
  - Done with pulling all necessary information for the standard injury report on desktop
  - Implement export PDF function
  - Done with security on navigating pages without having a session works

- Version 1.0
  - Implement export gridview to Excel and CSV file function
  - Done with new styling on desktop


##List of Contributions
* Cody Pugliese
* Jay Jaeho Lee
* Kevin Galati
* Matthew Okamoto
* Shem Miller
