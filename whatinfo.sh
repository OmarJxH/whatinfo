#!/bin/bash
#create by : OmaR JxH
#E-mail om4rjxh@gmail.com
#website: http://JxHs.org
#Description : This script displays file information services and software system that has rpm packages
#cpoy whatinfo.sh to /usr/bin < ------------ /usr/bin/whatinfo
#$ whatinfo --help
         
         
                if [ ! -d "/etc/rpm" ]; then
              echo -e "\nThis script as to systems \"\e[31mredhat\e[0m\" Uses packages \"RPM\" \n"
              exit 0
        fi
         
                        case $1 in
         
        -h|--h|--help)
                        echo -e "whatinfo v1.0"
                        echo -e "\t\n[JxH]# whatinfo command's\n"
        echo "example"
                                        echo -e "\t\n[JxH]# whatinfo \"ls\"\n"
        echo "Or File service"
                                echo -e "\t\n[JxH]# whatinfo /etc/JxH.conf\n"
        exit 0;;
        *)
        ;;
                        esac
                [ -e "$1" ]
        folo=$?
                        if [ "$folo" = "0" ]; then
        #
        rpm -qf $1 2>/dev/null >/dev/null
        pope=$?
        if [ "$pope" != "0" ]; then
                        echo -e "\n\e[31mWarning : There are no package\e[0m \"$1\"\n"
        exit 0
        fi
        #
        clear
                        echo -e "\n\n\e[31mPackage Information\e[0m"
        echo -e "\n$(rpm -qf $1 | xargs -l1 rpm -qi )\t\n" 2>/dev/null
                        sleep 2
         
         
        echo -e "\e[31mPackage name\e[0m"
        echo -e "\n $(rpm -qf $1 )\n"
        #
        sleep 2
        file $1 |cut -f2 -d : |xargs -l1 echo -e "\e[31mFile\e[0m: "
                        sleep 2
        ls -i $1 |awk '{print $1}'|xargs echo -e "\e[31mInodes\e[0m: "
                        sleep 1
        ls -l $1 |awk '{print $1}'|xargs echo -e "\e[31mPermissions\e[0m: "
                        sleep 1
        ls -l $1 |awk '{print $3":"$4}'|xargs echo -e "\e[31mfile owner and group\e[0m: "
                        sleep 1
        ls -l $1 |awk '{print $6":"$7":"$8}'|xargs echo -e "\e[31mDate & Time\e[0m : "
                        sleep 1
        ls -lh $1|awk '{print $5}'|xargs echo -e "\e[31msize\e[0m: "
                        sleep 1
        md5sum $1|awk '{print $1}'|xargs echo -e "\e[31mMD5\e[0m:"
                        sleep 2
                        echo -e -n "\nDo you want display files for package? \"\e[31my\e[0m\" or \"\e[31mn\e[0m\" # "
        read yynn
                        while [ "$yynn" != "n" ]; do
                        if [ "$yynn" = "y" ]; then
        rpm -qf $1 2>/dev/null |xargs -l1 rpm -ql |less
        exit 0
                fi
        echo -e -n "Do you want display files for package? \"\e[31my\e[0m\" or \"\e[31mn\e[0m\" # "
        read yynn
                        done
        exit 0
         
                fi
                        which $1 2>/dev/null >/dev/null
        jxhs=$?
                if [ "$jxhs" != "0" ]; then
        echo -e "\nv1.0"
                        echo -e "Try 'whatinfo --help' display information.\n"
        exit 0
                fi
         
                        which $1 2>/dev/null |xargs rpm -qf 2>/dev/null >/dev/null
        whichsd=$?
        if [ "$whichsd" != "0" ]; then
                        echo -e "\n\e[31mWarning : There are no package\e[0m \"$1\"\n"
        exit 0
        fi
        clear
        echo -e "\n\n\e[31mPackage Information\e[0m"
                        echo -e "\t\n$(which $1|xargs -l1 rpm -qf |xargs -l1 rpm -qi )\t\n"
                        sleep 1
        echo -e "\e[31mPackage name\e[0m\n"
        echo -e "$(which $1 |xargs rpm -qf)\n"
        echo -e "\e[31mWhat's \e[0m$1\n"
        echo -e "$(whatis $1)"
                        sleep 2
        echo -e "\n\e[31mPATH\e[0m $1"
        echo -e "$(which $1)\t\n"
         
        which $1 |xargs file |cut -f2 -d : |xargs -l1 echo -e "\e[31mFile\e[0m: " 2>/dev/null
                        sleep 2
        which $1 |xargs -l1 ls -i |awk '{print $1}'|xargs echo -e "\e[31mInodes\e[0m: " 2>/dev/null
                        sleep 1
        which $1 |xargs ls -l |awk '{print $1}'|xargs echo -e "\e[31mPermissions\e[0m: " 2>/dev/null
                        sleep 1
        which $1 |xargs ls -l |awk '{print $3":"$4}'|xargs echo -e "\e[31mfile owner and group\e[0m: " 2>/dev/null
                        sleep 1
        which $1 |xargs ls -l |awk '{print $6":"$7":"$8}'|xargs echo -e "\e[31mDate & Time\e[0m: " 2>/dev/null
                        sleep 1
        which $1 |xargs ls -lh |awk '{print $5}'|xargs echo -e "\e[31msize\e[0m: " 2>/dev/null
                        sleep 1
        which $1 |xargs md5sum |awk '{print $1}'|xargs echo -e "\e[31mMD5\e[0m:" 2>/dev/null
        echo -e ""
                        sleep 2
                        echo -e -n "Do you want display files for package? \"\e[31my\e[0m\" or \"\e[31mn\e[0m\" # "
        read yynn
         
                        while [ "$yynn" != "n" ]; do
                if [ "$yynn" = "y" ]; then
        which $1 |xargs rpm -qf 2>/dev/null |xargs -l1 rpm -ql |less 2>/dev/null
        exit 0
                fi
        echo -e -n "Do you want display files for package? \"\e[31my\e[0m\" or \"\e[31mn\e[0m\" # "
        read yynn
                        done
         
    #END


