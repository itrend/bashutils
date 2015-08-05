A bunch of tools for easier Tomcat handling. Copy them to a directory in your PATH and enjoy.
The utils are Linux only. Also, they are somewhat fragile and might break with future releases
of Tomcat.

All of the utils assume they are run somewhere within Apache Tomcat directory tree (no matter
how deep inside) and will discover the root Tomcat directory by themselves. In this text,
"current Tomcat" means the shell's current directory is somewhere within the Tomcat tree.

* tomcat-startup - executes bin/startup.sh for the current Tomcat and tail -f logs/catalina.out after
* tomcat-shutdown - executes bin/shutdown.sh, waits 10 seconds for Tomcat to die. If it's not dead
                    in 10 seconds, kill -9 is administered
* tomcat-restart - equivalent of tomcat-shutdown; tomcat-startup
* tomcat-tail - equivalent of tail -f logs/catalina.out run from the root Tomcat directory
* tomcat-dir - prints the root directory of the current Tomcat
* tomcat-kill - administers kill -9 to the current Tomcat, if running
* tomcat-info - prints some information for the current Tomcat, like root directory, port, PID (if running)
* tomcat-pid - prints the PID if the current Tomcat, if running; does nothing otherwise
* tomcat-lib - actual code for Tomcat discovery and functions resides here. 

