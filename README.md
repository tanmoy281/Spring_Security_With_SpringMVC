[![Build Status](https://travis-ci.org/tanmoy281/Spring_Security_With_SpringMVC.svg?branch=master)](https://travis-ci.org/tanmoy281/Spring_Security_With_SpringMVC)

# Spring_Security_With_SpringMVC
A Spring MVC application with an authentication and authorization module developed using spring security.

Home page url: http://HOST:PORT/ContactBookAppWar/

You need to place sqljdbc42.jar to ContactBookAppWar/libs folder, as this artifact is not available in maven central repository.

Required: MS SQL Server 2014 Express.

DB Settings: 

1. Set ms sql server anthentication type as 'SQL Server Authentication'.(Not Windows Authentication)


2. Run the db script stored in Database Administration/DB backup/DatabaseScript.sql in a query window.


3. Make sure the db url, username and password in ContactBookAppWar/WebContent/WEB-INF/jdbc.properties match with your sql server db properties.
