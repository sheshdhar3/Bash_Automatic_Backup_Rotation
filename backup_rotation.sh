#!/bin/bash
<< Bkup_BashShellScripts
This Shell scripts show the backup details..
Bkup_BashShellScripts

  echo "Please enter the location of data to backup"
 
  read a #Source of data to backup
  
  #Maximum backup data
  max_bkups=3

  Create_bkup() { 

    tar -czvf backup_destination_path/backup_$(date +%Y-%m-%d-%H-%M-%S).tar.gz $a

    echo "Backup completed successfully."
   
   }  


 #Function to delete the oldest backup if more than max_bkup exist

  Delete_old_bkups() {

	 num_bkups=$(find "backup_destination_path/" -maxdepth 1 -type f -name "backup_*.tar.gz" | wc -l)
	 
	 if [ "$num_bkups" -gt "$max_bkups" ]; then

	oldest_backup=$(ls -t "backup_destination_path" | grep '^backup_.*\.tar\.gz$' | tail -n 1)

  rm -f "backup_destination_path$oldest_backup"
  
       echo "Deleted oldest backups: $oldest_backup"
       
       fi
    }


  # Main Script
  Create_bkup
  Delete_old_bkups


