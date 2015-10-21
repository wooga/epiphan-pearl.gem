# Epiphan Pearl Gem

This a light ruby gem to connect to your Epiphan Pearl device and start/stop recordings, change prefixes, video formats and other settings. 
It provides a thin network and logic layer using the HTTP command interface to communicate with the device.

## Configuration
You can configure the gem like this:  

`EpiphanPearl.configuration.ip = ip`  
`EpiphanPearl.configuration.username = username`  
`EpiphanPearl.configuration.password = password`


`ip`: the Pearl's ip, e.g. "192.168.1.2"  
`username`: login username for your pearl device, e.g. "admin"  
`password`: login password for your pearl device, e.g. "pw"  

## Accessing parameter values
Available parameters are organized in parameter sets (compare to [documentation](http://www.epiphan.com/wp-content/uploads/2014/09/Epiphan_Pearl_userguide.pdf) page 307 and below).  
Syntax:   
`EpiphanPearl::[parameter_set].new([recorder_or_channel]).[parameter]`  
`EpiphanPearl::[parameter_set].new([recorder_or_channel]).[parameter] = [value]`  
  
`parameter_set`: Parameter Set the desired parameter belongs to  
`recorder_or_channel`: recorder or channel you want to address  
`parameter`: name of desired parameter   
`return`: parameter value       
  
Example:   
`EpiphanPearl::System.new("recorder").vendor`  
`EpiphanPearl::Recording.new("recorder").enabled = true`  

## Exceptions  
`Invalid Value Class Exception`  -> the value you tried to set has the wrong class, e.g. a String instead of an Integer   
`Value Not In Approved Possibilities Exception` -> the value you tried is not in the hardcoded possible values, e.g. setting recording format to "mp3"  
`Invalid Value Exception` -> the value is somehow else invalid  
`Authentication Exception` -> authentication failed. Check the provided username and password  
`Unknown Device Exception` -> provided device does not exist. Check the provided channel or recorder  
`Unknown Parameter Exception` -> the key of the parameter is not recognized by the device. Maybe your firmware version is not yet supported by this gem?  