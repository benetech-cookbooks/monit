name             "monit"
maintainer       "Ron Ellis"
maintainer_email "rone@benetech.org"
license          "MIT"
description      "Configures monit.  Originally based off the 37 Signals Cookbook."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.8.29"


attribute 'monit/notify_email', 
  :description => 'The email address to send alerts to.',
  :type => "string",
  :required => "recommended"

attribute 'monit/poll_period',
  :description => 'How often to perform checks (in seconds)',
  :type => "string",
  :required => "recommended"

attribute 'monit/poll_start_delay',
  :description => 'When monit first starts, how long to delay before it starts performing checks',
  :type => "string",
  :required => "recommended"