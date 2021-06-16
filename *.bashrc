# Source global definitions

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#User Specific alias

alias genUser = '. ./genUser.bash'
alias permit = '. ./permit.bash'
alias schedule = '. ./schedule.bash'
alias attendance = '. ./attendance.bash'