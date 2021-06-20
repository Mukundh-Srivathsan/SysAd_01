
echo alias genUser='./home/Jay_Jay/genUser.bash' >> /home/Jay_Jay/.bashrc
echo alias permit='./home/Jay_Jay/permit.bash' >> /home/Jay_Jay/.bashrc
echo alias schedule='./home/Jay_Jay/schedule.bash' >> /home/Jay_Jay/.bashrc
echo alias attendance='./home/Jay_Jay/attendance.bash' >> /home/Jay_Jay/.bashrc
echo alias genMoM='./home/Jay_Jay/genMoM.bash' >> /home/Jay_Jay/.bashrc

echo 0 0 * * *  /home/Jay_Jay/schedule.bash >> /etc/crontab
