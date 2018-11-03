# corpusops pureftpd deployment
    
## Support development
- Ethereum: ``0xa287d95530ba6dcb6cd59ee7f571c7ebd532814e``
- Bitcoin: ``3GH1S8j68gBceTeEG5r8EJovS3BdUBP2jR``
- [paypal](https://paypal.me/kiorky)

## Redo only the ftp users setup
```sh

export A_ENV_NAME=foo
.ansible/scripts/call_ansible.sh -vvvvv .ansible/playbooks/app.yml -e "{\
    cops_pureftpd_s_manage_content: true, \
    cops_pureftpd_s_first_fixperms: true, \
    cops_pureftpd_s_users: true, only_steps: true,\
    cops_vars_debug: true}"
```
