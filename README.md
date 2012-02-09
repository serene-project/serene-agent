serene-agent
============

Language : Perl


Quick Overview
--------------
The agent is basically a scheduler which manage multiple plugins executions, and send data to the collector in JSON format.


Internal Scheduler Settings
---------------------------
The internal scheduler uses a "Vixie" cron-like syntax, with an additional 6th column if you want to play with seconds.
   minute         0-59
   hour           0-23
   day of month   1-31 
   month          1-12 (or as names)
   day of week    0-7 (0 or 7 is Sunday, or as names )
   seconds        0-59 (optional)

If nothing specified, the default interval is set to 5 minutes in etc/serene-agent/config.ini :
   default_interval="*/5 * * * * *"
