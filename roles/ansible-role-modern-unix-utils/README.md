# Ansible role: Install modern linux utilities

This role will install latest binaries from GitHub.

For example:
&nbsp; &nbsp; By default, this role installs bat. The role takes the latest tarball from GitHub and install binary to `/usr/local/bin/`

Variables:
``` yaml
- name: lsd # Name of binary.
  install: True #Optional. By default `True`.
  alias: "ls='/usr/local/bin/lsd'" #Optional. Used to create alias. In form of alias {{ alias }}
  github_repo: Peltoche/lsd #Github user and repo name.
  asset_name: x86_64-unknown-linux-musl #String to find specific asset
  is_archive: True #Optional. Default `False`. If archive, using `unarchive` module, else using `get_url` module.
  extra_opts: #Optional. Extra options to unarchive.
    - --strip=1
    - --no-anchored
    - lsd
```

Playbook example:
``` yaml
---
- hosts: 127.0.0.1
  connection: local
  become: true
  roles:
    - modern-unix-utils
```
