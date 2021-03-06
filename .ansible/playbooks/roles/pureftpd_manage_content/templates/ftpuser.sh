#!/usr/bin/env bash
set -x
USER="{{ftp_user}}"
PASSWORD="{{password}}"
UHOME="{{home}}"
DELETE="{% if delete%}y{%endif %}"
OWNER={{user}}
GROUP={{group}}
ret=0
if [ "x$DELETE" != "x" ];then
    if ( pure-pw show "$USER" >/dev/null 2>&1 );then
        pure-pw userdel "$USER"
        ret=$?
    fi
else
    uid=$(id -u ${OWNER})
    gid=$(getent group ${GROUP} | cut -d: -f3)
    f=$(mktemp)
    cat > "$f" << EOF
$PASSWORD
$PASSWORD
EOF
    pure-pw show "$USER" 2>&1 || /bin/true
    if ! ( pure-pw show "$USER" >/dev/null 2>&1 );then
      cat "$f" | pure-pw useradd "$USER" -d "$UHOME" -u $uid -g $gid -m
      ret=$?
    fi
    if ( pure-pw show "$USER" >/dev/null 2>&1 );then
      cat "$f" | pure-pw usermod "$USER" -d "$UHOME" -u $uid -g $gid -m
      ret=$?
    fi
    if [ "x$ret" = "x0" ];then
        cat "$f" | pure-pw passwd "$USER"
        ret=$?
    fi
    if [ "x$ret" = "x0" ];then
        pure-pw mkdb
        ret=$?
    fi
    rm -f "${f}"
fi
exit $ret
# vim:set et sts=4 ts=4 tw=80:
