#!/bin/sh

FUTU_HOME=${FUTU_HOME:-"/FutuOpenD"}

console=${console:-0}
no_monitor=${no_monitor:-1}
cfg_file=${cfg_file:-"$FUTU_HOME/FutuOpenD.xml"}
lang=${lang:-en}
api_port=${api_port:-11111}
log_level=${log_level:-no}

OPTS="-console=$console -no_monitor=$no_monitor -cfg_file=$cfg_file -lang=$lang -api_port=$api_port -log_level=$log_level"

if [ $login_account ];then
	OPTS="$OPTS -login_account=$login_account"
else
	echo "login_account IS NOT EXISTS"
    exit 100
fi

if [ $login_pwd ];then
	OPTS="$OPTS -login_pwd=$login_pwd"
fi

if [ $login_pwd_md5 ];then
	OPTS="$OPTS -login_pwd_md5=$login_pwd_md5"
fi

if [ $login_cert_file ];then
	OPTS="$OPTS -login_cert_file=$login_cert_file"
fi

if [ $login_cert_file ];then
	OPTS="$OPTS -login_region=$login_region"
fi

if [ $telnet_ip ];then
	OPTS="$OPTS -telnet_ip=$telnet_ip"
fi

if [ $telnet_port ];then
	OPTS="$OPTS -telnet_port=$telnet_port"
fi

echo "Use Opts $OPTS"

$FUTU_HOME/FutuOpenD $OPTS

