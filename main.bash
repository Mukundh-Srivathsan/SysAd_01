
echo alias genUser='./home/Jay_Jay/genUser.bash' >> .bashrc
echo alias permit='./home/Jay_Jay/permit.bash' >> .bashrc
echo alias schedule='./home/Jay_Jay/schedule.bash' >> .bashrc
echo alias attendance='./home/Jay_Jay/attendance.bash" >> .bashrc

echo 0 0 * * *  /home/Jay_Jay/schedule.bash >> /etc/crontab
