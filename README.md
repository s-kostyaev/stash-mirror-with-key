stash-mirror-with-key
=====================
With this hook you may mirror your stash repos to github (or another
code hosting) without saving your github password to stash.

Installation
-------------

For using this hook you must install
[atlassian external hooks](https://github.com/ngsru/atlassian-external-hooks)
first.
Then clone this repo and copy hook script to external hooks path on
stash server:

    git clone https://github.com/s-kostyaev/stash-mirror-with-key.git

    cd stash-mirror-with-key

    scp mirror-with-key.sh root@stashhost:/path/to/stash-home/data/external-hooks/

    scp mirror-with-key-debug.sh root@stashhost:/path/to/stash-home/data/external-hooks/
	

How to use this hook
---------------------

1. Generate new deploy key for repo: `ssh-keygen -t rsa -C "reponame@stashhost" -f keyname`
2. Create github repo for mirroring
3. Add created key as deploy key in this repo:
`xclip keyname.pub` → github repo page → settings → Deploy keys →
Add deploy key → paste → add key
4. Add hook to your stash repo: `xclip keyname` → stash repo page →
settings → Hooks → enable External Async Post Receive Hook → paste
script hook name in "Executable" field → enable checkbox "Use safe
dir" → paste key from buffer to "positional parameters" field (first
line must be github SSH clone URL of mirror repo, other lines is
private key pasted from buffer)
![hook options](https://raw.githubusercontent.com/s-kostyaev/stash-mirror-with-key/master/hook.png)
→ Save
5. Profit!

Debug
-----------

For debug go to hook configuration and change script name from
`mirror-with-key.sh` to `mirror-with-key-debug.sh`. After that add
your email between repo path and private key (on the second line ---
one line for each argument). This hook send debug message to your email.
