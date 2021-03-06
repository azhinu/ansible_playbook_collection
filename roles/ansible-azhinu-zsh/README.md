# Azhinu ZSH

This role will install ZSH as Shell FZF for autocompletion and Sheldon as plugin manager.

Plugins list:

* `sorin-ionescu/prezto` — Completion, suggestion and more.
* `romkatv/powerlevel10k` — Famous ZSH prompt.
* `anatolykopyl/sshukh` — Use sshukh instead of ssh to ignore server fingerprint mismatch.
* `lildude/fzf-prezto` — FZF plugin to allow fuzzy autocompletion and history search.
* `zdharma/fast-syntax-highlighting` — Syntax highlighting.

## Pipeline

1. Install Git, wget (Required by sheldon), FZF.
2. Install Sheldon binaries from Github.
3. Add dotfiles for selected users
4. Change Shell to ZSH for selected users.

## Variables

``` yaml
users: #Users to apply ZSH dotfiles and shell
  - user1
  - user2

sheldon_tag: 0.6.4 #Sheldon release
force_copy_dotfiles: True #Override ZSH dotfiles
```

## Notes

We can use `github_release` module to get latest release but it required github3.py module on target host.
Sheldon not used to init Prezto because it has unstable behavior
