# Zsh

| Alias   | Command                               |
|:--------|:--------------------------------------|
| _alias_ | list all aliases                      |
| ..      | cd ..                                 |
| ...     | cd ../..                              |
| ....    | cd ../../..                           |
| .....   | cd ../../../..                        |
| /       | cd /                                  |
| ~       | cd ~                                      |
| _cd +n_ | switch to directory number `n`        |
| _1_     | cd -                                  |
| _2_     | cd +2                                 |
| _3_     | cd +3                                 |
| _4_     | cd +4                                 |
| _5_     | cd +5                                 |
| _6_     | cd +6                                 |
| _7_     | cd +7                                 |
| _8_     | cd +8                                 |
| _9_     | cd +9                                 |
| _md_    | mkdir -p                              |
| _rd_    | rmdir                                 |
| _d_     | dirs -v (lists last used directories) |

See `~/.oh-my-zsh/lib/directories.zsh`

### Alias
example: 

```bash
alias -s rb=vim #opens ruby files in vim
# $ foo.rb 
# vim => foo.rb
alias -g gp='| grep -i' #creates a global alias for grep
# $ ps ax gp ruby
# (all ruby process will be displayed)
```

| Flag  | Description                                     |
|:------|:------------------------------------------------|
| L     | print each alias in the form of calls to alias  |
| g     | list or define global aliases                   |
| m     | print aliases matching specified pattern        |
| r     | list or define regular aliases                  |
| s     | list or define suffix aliases                   |

## Tab-completion

| For options and helpful text of what they do |
|:--------------------------------------------:|
| _ls -(tab)_                                  |
| _cap (tab)_                                  |
| _rake (tab)_                                 |
| _ssh (tab)_                                  |
| _sudo umount (tab)_                          |
| _kill (tab)_                                 |
| _unrar (tab)_                                |

## Git

| Dynamic access to current branch name with the current_branch function |
|:----------------------------------------------------------------------:|
| git pull origin $(current_branch)                                      |
| grb publish $(current_branch) origin                                   |

| Alias                  | Command                                                                           |
|:-----------------------|:----------------------------------------------------------------------------------|
| _g_                    | git                                                                               |
| _ga_                   | git add                                                                           |
| _gaa_                  | git add --all                                                                     |
| _gapa_                 | git add --patch                                                                   |
| _gb_                   | git branch                                                                        |
| _gba_                  | git branch -a                                                                     |
| _gbr_                  | git branch --remote                                                               |
| _gc_                   | git commit -v                                                                     |
| _gc!_                  | git commit -v --amend                                                             |
| _gca_                  | git commit -v -a                                                                  |
| _gca!_                 | git commit -v -a --amend                                                          |
| _gcl_                  | git config --list                                                                 |
| _gclean_               | git clean -fd                                                                     |
| _gpristine_            | git reset --hard && git clean -dfx                                                |
| _gcm_                  | git checkout master                                                               |
| _gcmsg_                | git commit -m                                                                     |
| _gco_                  | git checkout                                                                      |
| _gcount_               | git shortlog -sn                                                                  |
| _gcp_                  | git cherry-pick                                                                   |
| _gcs_                  | git commit -S                                                                     |
| _gd_                   | git diff                                                                          |
| _gdca_                 | git diff --cached                                                                 |
| _gdt_                  | git diff-tree --no-commit-id --name-only -r                                       |
| _gdt_                  | git difftool                                                                      |
| _gfa_                  | git fetch --all --prune                                                           |
| _gg_                   | git gui citool                                                                    |
| _gga_                  | git gui citool --amend                                                            |
| _ggpnp_                | git pull origin $(current_branch) && git push origin $(current_branch)            |
| _ggpull_               | git pull origin $(current_branch)                                                 |
| _ggl_                  | git pull origin $(current_branch)                                                 |
| _ggpur_                | git pull --rebase origin $(current_branch)                                        |
| _glum_                 | git pull upstream master                                                          |
| _ggpush_               | git push origin $(current_branch)                                                 |
| _ggp_                  | git push origin $(current_branch)                                                 |
| _ggsup_                | git branch --set-upstream-to=origin/$(current_branch)                             |
| _gignore_              | git update-index --assume-unchanged                                               |
| _gignored_             | git ls-files -v &#124; grep "^\[\[:lower:\]\]"                                    |
| _git-svn-dcommit-push_ | git svn dcommit && git push github master:svntrunk                                |
| _gk_                   | gitk --all --branches                                                             |
| _gl_                   | git pull                                                                          |
| _glg_                  | git log --stat --max-count = 10                                                   |
| _glgg_                 | git log --graph --max-count = 10                                                  |
| _glgga_                | git log --graph --decorate --all                                                  |
| _glo_                  | git log --oneline --decorate --color                                              |
| _glog_                 | git log --oneline --decorate --color --graph                                      |
| _glp_                  | _git_log_prettily (git log --pretty=$1)                                           |
| _gm_                   | git merge                                                                         |
| _gmt_                  | git mergetool --no-prompt                                                         |
| _gp_                   | git push                                                                          |
| _gpoat_                | git push origin --all && git push origin --tags                                   |
| _gr_                   | git remote                                                                        |
| _grba_                 | git rebase --abort                                                                |
| _grbc_                 | git rebase --continue                                                             |
| _grbs_                 | git rebase --skip                                                             |
| _grbi_                 | git rebase -i                                                                     |
| _grh_                  | git reset HEAD                                                                    |
| _grhh_                 | git reset HEAD --hard                                                             |
| _grmv_                 | git remote rename                                                                 |
| _grrm_                 | git remote remove                                                                 |
| _grset_                | git remote set-url                                                                |
| _grt_                  | cd $(git rev-parse --show-toplevel &#124;&#124; echo ".")                         |
| _grup_                 | git remote update                                                                 |
| _grv_                  | git remote -v                                                                     |
| _gsd_                  | git svn dcommit                                                                   |
| _gsps_                 | git show --pretty = short --show-signature                                        |
| _gsr_                  | git svn rebase                                                                    |
| _gss_                  | git status -s                                                                     |
| _gst_                  | git status                                                                        |
| _gsta_                 | git stash save                                                                    |
| _gstaa_                | git stash apply                                                                   |
| _gstd_                 | git stash drop                                                                    |
| _gstl_                 | git stash list                                                                    |
| _gstp_                 | git stash pop                                                                     |
| _gsts_                 | git stash show --text                                                             |
| _gts_                  | git tag -s                                                                        |
| _gunignore_            | git update-index --no-assume-unchanged                                            |
| _gunwip_               | git log -n 1 &#124; grep -q -c "\-\-wip\-\-" && git reset HEAD~1                  |
| _gup_                  | git pull --rebase                                                                 |
| _gvt_                  | git verify-tag                                                                    |
| _gwch_                 | git whatchanged -p --abbrev-commit --pretty = medium                              |
| _gwip_                 | git add -A; git ls-files --deleted -z &#124; xargs -r0 git rm; git commit -m "--wip--" |

You also find these commands in Dash as a Cheat-sheet.

## Editors

| Alias | Command                                                                  |
|:------|:-------------------------------------------------------------------------|
| _stt_ | (When using `sublime` plugin) Open current directory in Sublime Text 2/3 |
| _v_   | (When using `vi-mode` plugin) Edit current command line in Vim           |