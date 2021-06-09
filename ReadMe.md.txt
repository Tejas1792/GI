E-Commerce Login page
Tools used:
•	Frontend : HTML/CSS 
•	API layer : .NET 4.8. 
•	Database : SQL Server

Package required:
•	RestSharp (May not require)
Below are the steps to run the application on the local system.
	Download file called GI Assignment.
	Go to asp.net application, File, Open, Project/Solution (Select file name GI Assignment).
	To install package RestSharp, Right click on Solution, Select Manage NuGet Package, Browse for RestSharp and click to install.
	To create database, Right click on Solution and expand options for Add. Click on Existing Item, open App_Data and select GIAssignment.mdf. If this doesn’t work, follow the below step or skip it.
	You need create database, Right click on Solution and expand options for Add. Click on New Item, on left side of the window click on Data, and select SQL Server Database and give name GIAssignment.
	Run the Script GIAQueryCSPIV.sql  to create Database in SQL Server.
	To get connect string click on Database and go to properties and look for connectionstring
	Open Login.aspx.cs, in method CheckNoinDB() and on click event btnregister set your connection string to the database.
	Press f5 to run the web application.
Note: Enter your number with country code, for instance +91xxxxxxxxxx. Also the third party OTP service has limited SMS service.
I hope the above steps will be enough to guide you to run the project. Thank you.
