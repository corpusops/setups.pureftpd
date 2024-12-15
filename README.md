DISCLAIMER
============

**UNMAINTAINED/ABANDONED CODE / DO NOT USE**

Due to the new EU Cyber ​​Resilience Act (as European Union), even if it was implied because there was no more activity, this repository is now explicitly declared unmaintained.

The content does not meet the new regulatory requirements and therefore cannot be deployed or distributed, especially in a European context.

This repository now remains online ONLY for public archiving, documentation and education purposes and we ask everyone to respect this.

As stated, the maintainers stopped development and therefore all support some time ago, and make this declaration on December 15, 2024.


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
