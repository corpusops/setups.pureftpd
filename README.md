# corpusops pureftpd deployment


## Redo only the ftp users setup
```sh

export A_ENV_NAME=foo
.ansible/scripts/call_ansible.sh -vvvvv .ansible/playbooks/app.yml -e "{\
    cops_pureftpd_s_manage_content: true, \
    cops_pureftpd_s_first_fixperms: true, \
    cops_pureftpd_s_users: true, only_steps: true,\
    cops_vars_debug: true}"
```
