# Epiphan Pearl Gem

This a light ruby gem to connect to your Epiphan Pearl device and start/stop recordings, change prefixes, video formats and other settings. 
It provides a thin network and logic layer using the HTTP command interface to communicate with the device.

## Configuration
You can configure the gem like this:  

`EpiphanPearl.configuration.ip = [ip]`  
`EpiphanPearl.configuration.username = [username]`  
`EpiphanPearl.configuration.password = [password]`


ip: the Pearl's ip, e.g. "0.0.0.0"  
username: login username for your pearl device e.g. "admin"  
password: login password for your pearl device e.g. "pw"
  
## Usage  
  
### Get parameter value  
`
EpiphanPearl::Parameter.get([recorder/channel], [parameter key])
`  
recorder/channel: recorder or channel you want to address  
parameter key: can be found in the [documentation](http://www.epiphan.com/wp-content/uploads/2014/09/Epiphan_Pearl_userguide.pdf) on page 307 and below.  
return: parameter value or nil if error occured 
  
### Set parameter value  
`
EpiphanPearl::Parameter.set([recorder/channel], [parameter key], [value])
`  
recorder/channel: recorder or channel you want to address  
parameter key: can be found in the [documentation](http://www.epiphan.com/wp-content/uploads/2014/09/Epiphan_Pearl_userguide.pdf) on page 307 and below.  
value: value to set for parameter. Possible value can be found in documentation. Wrong parameters will cause error.  
return: true if setting of parameter was successful or false if error occured   
  
### Error handling  
The error of the last failed command can be fetched like this
`EpiphanPearl::Error.last`  
The following errors exist:  
`:unknown_key_error`  -> you tried to access an unknown parameter  
`:unknown_value_error` -> the provided value does no match the documentation's specifications  
`:unknown_parameter_error` -> you tried to access an unknown parameter. This should be a problem with the gem or your device  
`:authentication_error` -> authentication failed. Check the provided username and password  
`:unknown_device_error` -> provided device does not exist. Check the provided channel or recorder  
