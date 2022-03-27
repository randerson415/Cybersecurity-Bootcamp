
#!/bin/bash

output=$HOME/research/sys_info.txt

echo "A Quick System Audit Script" >> $output
date >> $output
echo"" >> $output
echo "Machine Type Info:" >> $output
echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n" >> $ouput
echo "Hostname: $(hostname -s)" >> $output

# Create directory for output

if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi
echo -e "\n777 Files:" >> ~/research/sys_info.txt
find / -type f -perm 777 >> ~/research/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux -m | awk '{print $1, $2, $3, $4, $11}' | head >> ~/research/sys_info.txt

#Display the permissions for sensitive /etc files
echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
files=('/etc/passwd' '/etc/shadow')
for file in ${files[@]}
do
ls -l $file >> $output
done



