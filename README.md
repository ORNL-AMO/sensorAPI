# Mimir-backend

## How does it work?
You simply clone the repo and start running the server on your network.<br/>
Once you have a live server, you can start to create devices within the Mimir app. When you create a device, you will get a device id. Use this device id when reporting sensor data to associate you sensors with your device in Mimir.<br/>
![alt-text](https://i.imgur.com/qeHREwu.jpg)

## API DOCS
### route/:parameter
HTTP METHOD: {Parameter1, Parameter2, ...}
### sensors/:sensor_type
POST: {id, timestamp, sensor_reading}<br/>
- id: Integer representing the device id given to you in Mimir<br/>
- timestamp: UTC string representing the time the sensor reading was recorded<br/>
- sensor_reading: Raw/converted sensor output as a floating point decimal<br/>
## Setup
### Ruby version
Ruby 2.3

### Database creation
```
bin/rake db:migrate
```
