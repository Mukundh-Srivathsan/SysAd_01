
echo alias genUser='./genUser.bash' >> .bashrc
echo alias permit='./permit.bash' >> .bashrc
echo alias schedule='./schedule.bash' >> .bashrc
echo alias attendance='./attendance.bash" >> .bashrc

0 0 * * * "/bin/bash" "/schedule.bash"
