Delivery Analytics API 
-----------------------

This project was created with Ruby on Rails, a postgreSQL database, and the following gems:

- active-model-serializer 

- rspec-rails

- phonelib


Project Contents 
-----------------------
Api with 5 tested endpoints

/api/all = will return all devices (not asked for but helped production)

/api/register = will create a new device

/api/terminate = will updated a device's disabled_at attribute to Datetime.now 

/api/alive = will create a new heartbeat 

/api/report = will create a new report 

