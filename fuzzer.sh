#!/bin/bash

if ! [ -x "$(command -v gobuster)" ]; then
    echo "installing gobuster"
    go get github.com/OJ/gobuster
fi
echo "Enter the path of your SecLists:  [ex: /root/SecLists]"
read d
if [ -d $d ]
then
    echo Directory $d exists.
else
    echo Error: Directory $d does not exists.
fi

if [ $d == /root/SecLists ];
then
 echo "All good"
else
    cp -r $d /root/
fi

echo "What you want to Fuzz"
echo "1.Fuzz the domains in a file. [ex: domains_list.txt]"
echo "2.Fuzz a domain. [ex: domain.com]"
read l
if [ $l == 1 ];then
echo "Choose the way you want to fuzz: "
echo
echo "1.Custom wordlist! [Enter the wordlist path when asked!]"
echo "2.Deafult wordlist! [I had a bunch for you!]"
echo
echo "0.Fuzz with custom wordlist"
echo "1.Fuzz basic wordlist count --> 4652 "
echo "2.Fuzz medium wordlist of directories count --> 30000 "
echo "3.Fuzz large wordlist of directories count --> 62275 "
echo "4.Fuzz medium wordlist of files count --> 17128 "
echo "5.Fuzz large wordlist of files count --> 37042 "
echo "6.Fuzz api wordlist found during recon count --> 7615 "
echo "7.Fuzz api wordlist common path count --> 33 "
echo "8.Fuzz api wordlist for actions count --> 222 "
echo "9.FUzz apache basic wordlist count --> 8531 "
echo "10.Fuzz frontend wordlist count --> 43 "
echo "11.Fuzz Php wordlist count --> 104 "
echo "12.Fuzz burp-parameter-names wordlist count --> 2588 "
echo "13.Fuzz graphql wordlist count --> 12 "
echo
echo "14.Fuzz with all the above wordlists!!!"
echo "Select a wordlist to fuzz: "
read n

if [ $n == 0 ];
then
 echo "Fuzzing with custom wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w $2 --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 1 ];
then
 echo "Fuzzing with basic wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/common.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 2 ];
then
 echo "Fuzzing with medium wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-medium-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt;d
one
 echo
 echo "Done with fuzzing"
fi

if [ $n == 3 ];
then
 echo "Fuzzing with large wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-large-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt;do
ne
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 4 ];
then
 echo "Fuzzing with medium size files wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-medium-files.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 5 ];
then
 echo "Fuzzing with large size files wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-large-files.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 6 ];
then
 echo "Fuzzing with api's found during recon wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/api/api-seen-in-wild.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 7 ];
then
 echo "Fuzzing with api's common-path wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/api/common_paths.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 8 ];
then
 echo "Fuzzing with api's action wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/api/actions.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 9 ];
then
 echo "Fuzzing with apache basic wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/Apache.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 10 ];
then
 echo "Fuzzing with frontend wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/frontpage.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 11 ];
then
 echo "Fuzzing with PHP wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/PHP.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 12 ];
then
 echo "Fuzzing with burp-parameter-names wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/burp-parameter-names.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 13 ];
then
 echo "Fuzzing with graphql wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/graphql.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 14 ];
then
 echo "Fuzzing with all wordlist!!"
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/common.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-medium-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt;d
one
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-large-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt;do
ne
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-medium-files.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/raft-large-files.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/api/api-seen-in-wild.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/api/common_paths.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/api/actions.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/Apache.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/frontpage.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/burp-parameter-names.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/PHP.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 for domain in $(cat $1); do gobuster dir -u $domain -w /root/SecLists/Discovery/Web-Content/graphql.txt --wildcard | grep -e "Status: 200" >> $1.txt;done
 echo
 echo "Done with fuzzing!!"
fi
fi

if [ $l == 2 ];then
echo "Choose the way you want to fuzz: "
echo
echo "1.Custom wordlist! [Enter the wordlist path when asked!]"
echo "2.Deafult wordlist! [I had a bunch for you!]"
echo
echo "0.Fuzz with custom wordlist"
echo "1.Fuzz basic wordlist count --> 4652 "
echo "2.Fuzz medium wordlist of directories count --> 30000 "
echo "3.Fuzz large wordlist of directories count --> 62275 "
echo "4.Fuzz medium wordlist of files count --> 17128 "
echo "5.Fuzz large wordlist of files count --> 37042 "
echo "6.Fuzz api wordlist found during recon count --> 7615 "
echo "7.Fuzz api wordlist common path count --> 33 "
echo "8.Fuzz api wordlist for actions count --> 222 "
echo "9.FUzz apache basic wordlist count --> 8531 "
echo "10.Fuzz frontend wordlist count --> 43 "
echo "11.Fuzz Php wordlist count --> 104 "
echo "12.Fuzz burp-parameter-names wordlist count --> 2588 "
echo "13.Fuzz graphql wordlist count --> 12 "
echo
echo "14.Fuzz with all the above wordlists!!!"
echo "Select a wordlist to fuzz: "
read n

if [ $n == 0 ];
then
 echo "Fuzzing with custom wordlist!!"
 gobuster dir -u $1 -w $2 --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 1 ];
then
 echo "Fuzzing with basic wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/common.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 2 ];
then
 echo "Fuzzing with medium wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-medium-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing"
fi

if [ $n == 3 ];
then
 echo "Fuzzing with large wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-large-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 4 ];
then
 echo "Fuzzing with medium size files wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-medium-files.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 5 ];
then
 echo "Fuzzing with large size files wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-large-files.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 6 ];
then
 echo "Fuzzing with api's found during recon wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/api/api-seen-in-wild.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 7 ];
then
 echo "Fuzzing with api's common-path wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/api/common_paths.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 8 ];
then
 echo "Fuzzing with api's action wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/api/actions.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 9 ];
then
 echo "Fuzzing with apache basic wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/Apache.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 10 ];
then
 echo "Fuzzing with frontend wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/frontpage.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 11 ];
then
 echo "Fuzzing with PHP wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/PHP.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 12 ];
then
 echo "Fuzzing with burp-parameter-names wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/burp-parameter-names.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 13 ];
then
 echo "Fuzzing with graphql wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/graphql.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi

if [ $n == 14 ];
then
 echo "Fuzzing with all wordlist!!"
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/common.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-medium-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-large-directories.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-medium-files.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/raft-large-files.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/api/api-seen-in-wild.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/api/common_paths.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/api/actions.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/Apache.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/frontpage.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/burp-parameter-names.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/PHP.fuzz.txt --wildcard | grep -e "Status: 200" >> $1.txt
 gobuster dir -u $1 -w /root/SecLists/Discovery/Web-Content/graphql.txt --wildcard | grep -e "Status: 200" >> $1.txt
 echo
 echo "Done with fuzzing!!"
fi
fi
