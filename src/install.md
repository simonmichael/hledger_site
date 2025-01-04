# Install

<div class=pagetoc>

<!-- toc -->
</div>

The current hledger release is **1.41**.
Here are the **[release notes](release-notes.md)**.

There are three main ways to install hledger on your computer:

- [Release binaries](#release-binaries) are provided by hledger's maintainer and are always up to date.
- [Packaged binaries](#package-binaries) are provided by system packagers and are sometimes less up to date.
- Or you can [build your own binaries](#build-from-source), which takes more time and resources.

After installing, there are some [final things to check](#check-your-installation).
[Your feedback](support.md) helps make this process smoother.


## Release binaries

Official release binaries for Linux, Mac, Windows.

[![hledger release binaries](https://img.shields.io/badge/hledger_release_binaries-1.41-brightgreen.svg)](https://github.com/simonmichael/hledger/releases/tag/1.41)
[release binaries](https://github.com/simonmichael/hledger/releases/tag/1.41)
([![RSS](images/rss.png) RSS](https://github.com/simonmichael/hledger/releases.atom))

## Packaged binaries

### Homebrew (Linux, Mac, WSL)

[![Homebrew](https://repology.org/badge/version-for-repo/homebrew/hledger.svg)](https://formulae.brew.sh/formula/hledger)
`brew install hledger`
<!-- homebrew packagers, chenrui ? -->

### Docker (Linux, Mac, Windows)

[![Docker](https://img.shields.io/badge/Docker_image-1.41-brightgreen.svg)](https://hub.docker.com/r/dastapov/hledger)
`docker pull dastapov/hledger`\
[more..](https://hub.docker.com/search?q=hledger&type=image&sort=updated_at&order=desc)
<!-- adept -->

### Windows

[![Scoop](https://repology.org/badge/version-for-repo/scoop/hledger.svg)](https://scoop.sh/#/apps?q=hledger)
`scoop install hledger`
\
[![Chocolatey](https://repology.org/badge/version-for-repo/chocolatey/hledger.svg)](https://community.chocolatey.org/packages/hledger)
`choco install hledger -y`
\
[![Winget](https://repology.org/badge/version-for-repo/winget/hledger.svg)](https://github.com/microsoft/winget-pkgs/tree/master/manifests/s/simonmichael/hledger)
`winget install simonmichael.hledger`
<!--
https://learn.microsoft.com/en-us/windows/package-manager/winget/#use-winget
https://github.com/microsoft/winget-cli/issues/210: Some users have reported isssues with the client not being on their PATH 
-->

### Linux

[![Alpine edge](https://repology.org/badge/version-for-repo/alpine_edge/hledger.svg)](https://pkgs.alpinelinux.org/packages?name=hledger*&branch=edge)
`doas apk add hledger hledger-ui hledger-web`\
[![Alpine 3.21](https://repology.org/badge/version-for-repo/alpine_3_21/hledger.svg)](https://pkgs.alpinelinux.org/packages?name=hledger*&branch=v3.21)\
[![Alpine 3.20](https://repology.org/badge/version-for-repo/alpine_3_20/hledger.svg)](https://pkgs.alpinelinux.org/packages?name=hledger*&branch=v3.20)\
[![Alpine 3.19](https://repology.org/badge/version-for-repo/alpine_3_19/hledger.svg)](https://pkgs.alpinelinux.org/packages?name=hledger*&branch=v3.19)\
[![Alpine 3.18](https://repology.org/badge/version-for-repo/alpine_3_18/hledger.svg)](https://pkgs.alpinelinux.org/packages?name=hledger*&branch=v3.18)\
[![Alpine 3.17](https://repology.org/badge/version-for-repo/alpine_3_17/hledger.svg)](https://pkgs.alpinelinux.org/packages?name=hledger*&branch=v3.17)\
<!-- dhruvin -->

[![Arch](https://repology.org/badge/version-for-repo/arch/hledger.svg)](https://archlinux.org/packages/extra/x86_64/hledger/)
`pacman -Sy hledger hledger-ui hledger-web`

[![Debian unstable](https://repology.org/badge/version-for-repo/debian_unstable/hledger.svg)](https://packages.debian.org/unstable/hledger)
`sudo apt install hledger hledger-ui hledger-web`\
[![Debian testing](https://img.shields.io/badge/Debian_testing_package-1.32.3-red.svg)](https://packages.debian.org/testing/hledger)\
[![Debian stable](https://img.shields.io/badge/Debian_stable_package-1.25-red.svg)](https://packages.debian.org/stable/hledger)\
[![Debian oldstable](https://img.shields.io/badge/Debian_oldstable_package-1.18.1-red.svg)](https://packages.debian.org/oldstable/hledger)\
[more..](https://packages.debian.org/search?searchon=names&keywords=hledger)
<!-- Clint -->

![Fedora_42](https://img.shields.io/badge/Fedora_42_package-1.32.3-red.svg)
`sudo dnf install hledger`\
![Fedora_41](https://img.shields.io/badge/Fedora_41_package-1.32.3-red.svg)\
![Fedora_40](https://img.shields.io/badge/Fedora_40_package-1.30.1-red.svg)\
![Fedora_39](https://img.shields.io/badge/Fedora_39_package-1.30.1-red.svg)\
![Fedora_38](https://img.shields.io/badge/Fedora_38_package-1.27.1-red.svg)\
![Fedora 37](https://repology.org/badge/version-for-repo/fedora_37/hledger.svg)\
[more..](https://src.fedoraproject.org/rpms/hledger)

[![Gentoo](https://img.shields.io/badge/Gentoo_package-1.34-red.svg)](https://gentoo.zugaina.org/Search?search=hledger)
`sudo eselect repository enable haskell && sudo emerge hledger hledger-ui hledger-web`
<!-- ezzie -->

![Raspberry Pi release binaries](https://img.shields.io/badge/Raspberry_Pi_release_binaries-1.22.2-red.svg)
[hledger-linux-arm32v7.zip](https://github.com/simonmichael/hledger/releases/tag/1.22.1)
\
![Raspberry Pi contributed binaries](https://img.shields.io/badge/Raspberry_Pi_contributed_binaries-1.18.1-red.svg)
[hledger-aarch64-manjaro.gz](https://github.com/simonmichael/hledger/releases/tag/1.18.1)
[hledger-armhf32-debian.gz](https://github.com/simonmichael/hledger/releases/tag/1.18) *(unaudited)*
<!-- nobodyinperson -->

[![ubuntu_24_10](https://repology.org/badge/version-for-repo/ubuntu_24_10/hledger.svg)](https://packages.ubuntu.com/oracular/hledger)
`sudo apt install hledger hledger-ui hledger-web`\
[![ubuntu_24_04](https://repology.org/badge/version-for-repo/ubuntu_24_04/hledger.svg)](https://packages.ubuntu.com/noble/hledger) \
[![ubuntu_22_04](https://repology.org/badge/version-for-repo/ubuntu_22_04/hledger.svg)](https://packages.ubuntu.com/jammy/hledger) \
[![ubuntu_20_04](https://repology.org/badge/version-for-repo/ubuntu_20_04/hledger.svg)](https://packages.ubuntu.com/focal/hledger) \
[![ubuntu_18_04](https://repology.org/badge/version-for-repo/ubuntu_18_04/hledger.svg)](https://packages.ubuntu.com/bionic/hledger)\
[![ubuntu_16_04](https://repology.org/badge/version-for-repo/ubuntu_16_04/hledger.svg)](https://packages.ubuntu.com/xenial/hledger)\
[more..](https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=hledger)

[![Void Linux x86_64](https://repology.org/badge/version-for-repo/void_x86_64/hledger.svg)](https://voidlinux.org/packages/?q=hledger)
`xbps-install -S hledger hledger-ui hledger-web`

### BSD

[![freebsd ports](https://repology.org/badge/version-for-repo/freebsd/hledger.svg)](https://www.freshports.org/search.php?query=hledger)
`pkg install hs-hledger hs-hledger-ui hs-hledger-web`
\
![openbsd ports](https://repology.org/badge/version-for-repo/openbsd/hledger.svg)
`pkg_add hledger`

### Nix (Linux, Mac)

[![Nix](https://repology.org/badge/version-for-repo/nix_unstable/hledger.svg)](https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=hledger)
`nix-shell -p hledger hledger-ui hledger-web`
\
Issues:
[#1030](https://github.com/simonmichael/hledger/issues/1030),
[#1033](https://github.com/simonmichael/hledger/issues/1033),
[#2089](https://github.com/simonmichael/hledger/issues/2089),
[Troubleshooting](https://hledger.org/hledger.html#troubleshooting)
<!-- maralorn, chvp -->

### Sandstorm (Web)

[![Sandstorm](https://img.shields.io/badge/Sandstorm_app-1.31-red.svg)](https://apps.sandstorm.io/search?term=hledger)
[HLedger Web sandstorm app](https://apps.sandstorm.io/app/8x12h6p0x0nrzk73hfq6zh2jxtgyzzcty7qsatkg7jfg2mzw5n90)
<!-- jacob weisz -->



## Build from source

### Build requirements

Building hledger requires the GHC compiler and either the stack or cabal build tool.
These are usually easy to install (see below).
But they will require quite a bit of memory and disk space -
up to 4G of RAM and 2G of your hard drive to build the hledger tools.
See also the [build tips](#build-tips) below.

On unix systems, you will need a [UTF-8-aware locale](#lang) configured.
Also you may need to install additional C libraries 
to avoid errors like "*cannot find -ltinfo*" when building hledger.
Eg,

- on Debian or Ubuntu: `sudo apt install libgmp-dev libtinfo-dev zlib1g-dev`
- on Fedora or RHEL: `sudo dnf install gmp-devel ncurses-devel zlib-devel`

Here are some ways to build hledger:

### Build with hledger-install

[hledger-install.sh][hledger-install] is an automated install script that requires only [bash].
This is a good choice if you are not used to building Haskell software.
It installs build tools if needed,
then builds the current release of the hledger tools and some [add-on tools](scripts.md),
installing them in ~/.local/bin (or ~/.cabal/bin if you had cabal and not stack installed).

<!--
Issues with cli snippets in hledger.org code blocks:

- Wrap long lines with \ to make them visible without scrolling on the website.
- When multiple lines are copy/pasted from the website to a terminal, only the first runs (because of ^J's ?)
  Insert ;\ between lines to work around.

```
echo a
echo b
```
-->

```
curl -O https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh
less hledger-install.sh   # <- good practice: inspect scripts before running
bash hledger-install.sh
```

### Build with stack

`stack` is a reliable Haskell build tool.
You can install it 

- with your system package manager
- or from its [website][stack]
- or with [ghcup] (this is ideal if you plan to do more Haskelling).

Once stack is installed, run:
```
stack update
stack install hledger-1.41 hledger-ui-1.41 hledger-web-1.41 \
  --resolver=nightly-2024-12-19 --verbosity=error
```

stack will install a compatible version of the GHC compiler if needed,
perhaps using ~2G of disk space (under `~/.ghcup` if it is configured to use ghcup, otherwise under `~/.stack`).
Then it will build the hledger tools and install them in `~/.local/bin`.

### Build with cabal

`cabal` is the other popular Haskell build tool.
You can install it with your system package manager.
You will also need to install a version of GHC that can build current hledger;
usually any version newer than 8.10.7 will do.
Or, you can install both of these with [ghcup].

Then run:

```
cabal update
cabal install hledger-1.41 hledger-ui-1.41 hledger-web-1.41
```
<!--
New haskellers used to sometimes need step 2 `cabal install alex happy`.
Nowadays that needs `--overwrite-policy=always` to avoid failing.
Try without, let the caballers deal with it.
-->

This will build the hledger tools and install them in `~/.cabal/bin`.

### Build in a source checkout

If you'd like to build the [latest hledger source code](https://github.com/simonmichael/hledger/commits/master),
get it with git:

    git clone https://github.com/simonmichael/hledger
    cd hledger
    git checkout 1.41   # optional: switch to release tag

You can build and install this source with:

    stack update
    stack install

or:

    cabal update
    cabal install all:exes

or:

    cd docker
    ./build.sh   # or build-dev.sh to keep build artifacts

### Build on Android

Here's 
[how to build hledger on Android with Termux](https://libera.ems.host/_matrix/media/r0/download/libera.chat/51835530d2b9eed094096d8a2c79e03dda2c35fb),
if your phone has plenty of memory.

### Build tips

- Building the hledger tools and possibly all their dependencies could take anywhere from a minute to an hour.
- On machines with less than 4G of RAM, the build may use swap space and 
  take much longer (overnight), or die part-way through. 
  In such low memory situations, try adding `-j1` to the stack/cabal install command, 
  and retry a few times, or [ask](support.md) for more tips.
- You could build just the hledger CLI to use less time and space, 
  by omitting hledger-ui and hledger-web.
- It's ok to kill a build and rerun the command later; you won't lose progress.
- You can add `--dry-run` to stack/cabal/nix install commands
  to see how much building remains.
- If you have previously installed the hledger tools, 
  they will usually be overwritten by the new version.
  If you have them installed in multiple places in your PATH, 
  you may see a warning, reminding you to remove or rename the old executables.

Here are some known build issues and workarounds on various platforms (possibly obsolete):

- [mac m1: building with ghc 9+ requires extra include dir](https://gitlab.haskell.org/ghc/ghc/-/issues/20592)
- [windows: cross-environment non-ascii display issues](https://github.com/simonmichael/hledger/issues/961#issuecomment-471229644)
- [arch: haskell build advice from Arch wiki](https://wiki.archlinux.org/index.php/Haskell)
- [openbsd 6: exec: permission denied](https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html)
- [openbsd: stack install tips](https://github.com/commercialhaskell/stack/issues/3313#issuecomment-570353913)
- [nix: nix install on linux can fail with "cloning builder process: Operation not permitted"](https://github.com/simonmichael/hledger/issues/1030)
- [nix: on Linux, nix-installed hledger won't handle non-ascii data](https://github.com/simonmichael/hledger/issues/1033)

## Check your installation

After installing, run the hledger tools and verify that their versions are what you just installed
(and not older versions from a previous install). Eg:

    $ hledger --version; hledger-ui --version; hledger-web --version
    hledger 1.41-gc772f5de0-20241209, mac-aarch64
    hledger-ui 1.41-gc772f5de0-20241209, mac-aarch64
    hledger-web 1.41-gc772f5de0-20241209, mac-aarch64

You can run the built-in unit tests if you'd like:

    $ hledger test
    ...
    All 227 tests passed (0.04s)

or the more thorough functional tests, if you are set up for working with the hledger source code:

    $ just functest
    ...
     Total   1110 ...
    functest PASSED


### PATH

If the hledger tools won't run at the command line or you don't see
the expected --version output, check that the newly installed
executables are first in your shell's PATH.
After building/installing, you may have seen a message about where the
executables were installed.  Eg:

- If you installed with stack, it's `$HOME/.local/bin` (on Windows, `%APPDATA%\local\bin`)
- If you installed with cabal, it's `$HOME/.cabal/bin` (on Windows, `%APPDATA%\cabal\bin`)
- If you installed with nix, it could be `$HOME/.nix-profile/bin`

Make sure that this `bin` directory is included in your shell's `PATH` setting,
and preferably near the start of the list, 
to preempt any old hledger binaries you might have lying around.
How to configure this depends on your platform and shell.
Eg if you are using bash, this will show $PATH:

    echo $PATH

and this will add the stack and cabal install dirs to it permanently:

    echo "export PATH=~/.local/bin:~/.cabal/bin:$PATH" >> ~/.profile
    source ~/.profile

Here's [how to set environment variables on Windows](https://www.devdungeon.com/content/set-environment-variables-windows).


<a name="locale"></a> <!-- required permalink, used in error messages -->
<a name="lang"></a>

### Text encoding

On most unix systems, when you are processing non-ASCII text with hledger,
the `LANG` environment variable must be set to a suitable locale to ensure hledger can decode the text,
avoiding errors like "*invalid byte sequence*" or "*mkTextEncoding: invalid argument*".
This applies to the Haskell build tools like GHC, cabal and stack, as well.

We usually recommend the UTF-8 text encoding.
On unix-like systems, check that your `LANG` setting mentions UTF-8, and if not, change it. Eg:

```cli
$ echo $LANG
C
$ export LANG=C.UTF-8    # or en_US.UTF-8, fr_FR.utf8, etc.
$ echo $LANG
C.UTF-8
```

In some cases the locale may need to be installed with your system
package manager first. See
[hledger: Troubleshooting](hledger.md#troubleshooting) for more help.
<!-- XXX ^ improve -->

On Microsoft Windows, I read that this might help in powershell:
```
$env:LC_ALL = "C.UTF-8"
$env:LANG = "C.UTF-8"
```
or this in CMD:
```
set LC_ALL=C.UTF-8
set LANG=C.UTF-8
```
There are also lots of ways to get pre-built binaries for Windows, if you don't need to build your own: https://hledger.org/install.html

On Nix or GUIX, the procedures are [different](https://github.com/simonmichael/hledger/issues/1033#issuecomment-1062506027).

### Shell completions

If you use the bash shell, you can optionally set up context-sensitive autocompletions when you press TAB in a hledger command line
(see [demo](https://asciinema.org/a/227935)).
To contribute completions for another shell, see [hledger/shell-completion/README](https://github.com/simonmichael/hledger/tree/master/hledger/shell-completion).

First, test if completions are already working: at a bash shell prompt,

- `hledger<SPACE><TAB><TAB>` should list all hledger commands
- `hledger reg acct:<TAB><TAB>` should list your top-level account names.

If not, first ensure that [bash-completion](https://salsa.debian.org/debian/bash-completion) is installed and enabled:

**On a Mac, using homebrew:**
- `brew remove -f bash-completion`
- `brew install bash-completion@2`
- Add the suggested line to your ~/.bash_profile, if it's not already there
- `source ~/.bash_profile` (or open a new bash shell)

**On GNU/Linux:**
- `apt install bash-completion`
- `source ~/.bash_profile` (or open a new bash shell)

...

Then, after using your system package manager to install hledger (`brew install hledger`, `apt install hledger` or similar),
completions may be working.

If your system's hledger package does not yet include completions, or if they are not up to date, or if you have installed hledger by other means,
then install the [latest hledger completions] yourself, under your XDG_DATA_HOME directory. Eg:

[latest hledger completions]: https://raw.githubusercontent.com/simonmichael/hledger/1.41-branch/hledger/shell-completion/hledger-completion.bash

```
curl https://raw.githubusercontent.com/simonmichael/hledger/1.41-branch/hledger/shell-completion/hledger-completion.bash \
  -o ~/.local/share/bash-completion/completions/hledger --create-dirs
```

Here are all the things you can complete by pressing TAB once or twice:

- the "hledger", "hledger-ui" and "hledger-web" commands
- hledger's command argument
- general flags
- command-specific flags, after the command argument
- flag values, for flags that have standard values
- query prefixes
- account names from the journal, after an account name prefix
- appropriate data from the journal, after these query prefixes: `acct:`, `code:`, `cur:`, `desc:`, `note:`, `payee:`, `real:`, `status:`, `tag:`
- amount comparison operators, after `amt:`.

When a completion includes special characters, backslashes will be inserted automatically; this does not work right in all cases.

## Next steps

Nicely done! Now see [Get started](start.md),
or come to the [#hledger chat](support.md)
where we'll gladly share tips or receive your feedback.


[ghc]:             https://www.haskell.org/ghc
[bash]:            https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29
[make]:            https://www.gnu.org/software/make/
[ghcup]:           https://haskell.org/ghcup
[stack]:           https://docs.haskellstack.org/en/stable/
[cabal]:           https://cabal.readthedocs.io/en/stable/
[hledger-install]: https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh
[WSL]:             https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux
[nix]:             https://nixos.org
[git]:             https://en.wikipedia.org/wiki/Git
