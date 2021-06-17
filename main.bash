
echo alias genUser=/'. ./genUser.bash/' >> .bashrc
echo alias permit=/'. ./permit.bash/' >> .bashrc
echo alias schedule=/'. ./schedule.bash/' >> .bashrc
echo alias attendance=/'. ./attendance.bash/' >> .bashrc

sudo crontab -e 0 0 * * * "/schedule.bash"
