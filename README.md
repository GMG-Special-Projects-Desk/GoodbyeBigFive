[![N|Solid](https://i.kinja-img.com/gawker-media/image/upload/c_fill,fl_progressive,g_center,h_180,q_80,w_320/rdxcnz0ban3vivfm8ect.png)]()
# Thwarting Tech Giants
Amazon, Facebook, Google, Microsoft, and Apple move more money than many medium sized nations. Their extraordinary profits are won through extraordinary reach - this is not a secret. That a few companies are afforded unprecedented and shamefully unregulated access into our homes is now an unremarkable fact of living with tiny computers everywhere.  

This is some code that will help you experience a life without the giants. For the article we used a VPN to monitor and block traffic, however the code in this repo provides a more streamlined approach. 

This code will build firewall rules for macOS using its built in packet filter PF. When you run it your device will be unable to interact with the various tech giants.  You will have to disable the firewall in order to start browsing the internet properly again.
### Dependencies 
This code is for OSX - specifically using their builtin packet filter PF. However, adapting it to run with IPtables on linux is pretty easy. 
### Installation
1. Clone this repository 
1. `chmod +x build.sh disable.sh enable.sh`
### Usage
1. `sudo ./block.sh --help`  
1. `sudo ./block.sh` # block packets to and from Microsoft,Apple,Google,Facebook and Amazon.
1. `sudo ./block.sh --fascist` # block the above companies as well as CDNS, see note below.
1. `sudo ./block.sh --google`  # block Google.  The script takes each company as an argument.
1. `sudo ./clear-filter` # clear the current packet filter.


Happy browsing

###  About CDNs

When designing our system we did not consider how the prevalence of CDNs would affect our blockade.  Many websites and apps are not actually sent to your browser directly from their hosting provider. Instead, often times there is a middle-man, a content delivery network, that acts as a buffer between your browser and the company’s server. The reason for this is speed and security.  A CDN will store versions of a company’s content in multiple geographical locations in order to deliver it to the end user faster.  If you think of the internet as a bunch of wires instead of as a kind of omnipotent cloud-like thing the reason for this is quite obvious - the closer are to your content the faster you will get it.

For our purposes, what this meant is that if a company decided to use a CDN it would evade our firewall because it didn’t look like it was sent from a tech giant.  The most obvious example of this is Airbnb.

If you really want to be certain that you have properly thwarted a tech giant, you will need to block the IP addresses of all major CDNs.  The downside of this strategy is that there will be a lot of false positives - you will block innocent services whose only *known crime is their usage of a CDN. The upside is that your web browser will be mostly useless. For the brave souls that want to go down this route, you can run the code in the aforementioned repository with the ‘--fascist’ flag. 

### Notes 
- This is a quick and dirty version of what we had running no the server, so there are probably some bugs. 
- You will need to add the above line to /etc/pf.conf everytime you restart your computer. 
- This does not block services behind a CDN
- For WhatsApp and Github you will need to add additional rules

