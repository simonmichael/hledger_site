# Download/Install

<style>
h2 {
    margin-top:2em;
}
table#downloads > tbody > tr { 
  border-bottom:thin solid #ddd; 
}
table#downloads > tbody > tr > td { 
  padding-top:0.5em;
  padding-bottom:0.5em;
}
table#downloads > tbody > tr > td:nth-child(2) { 
  padding-top:1.5em;
}
div.section > table td:first-child {
  padding-right:1em;
}
div.platform {
  margin-top:1em;
  font-size:big;
  font-weight:bold;
  white-space:nowrap;
}
div.distro {
  margin-right:1em;
}
div.command {
  font-weight:bold;
  white-space:nowrap;
  margin-bottom:1em;
}
div.builder {
  /*border-top:thin solid #ddd; */
  padding-top:0.5em;
  font-size:big;
  font-weight:bold;
  white-space:nowrap;
  margin-top:1em;
}
div.builder-text {
  margin-top:1em;
}
div.builder-command {
  margin:1em 0.5em 1em;
  font-weight:bold;
  white-space:nowrap;
}
div.notes {
  font-size:small;
  font-style:italic;
}
div.badges {
  font-size:small;
  font-style:italic;
}
.warnings > a:before {
    content: " ⚠ ";
    color:red;
}
</style>

The current hledger release is **1.17.1.1** ([release notes](release-notes)).\
[Binary packages](#binary-packages) install quickly.\
[Building from source](#building-from-source) takes longer but ensures you get the latest release.\
Please [report](index.html#help) any trouble.

## Binary packages

<table id="downloads">
  <tbody>
    <tr>
      <td colspan=2><div class="platform">Multiplatform</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://nixos.org/nix">Nix</a></div>
        <div class="notes">Linux, Mac</div>
        <div class="badges">
          <a href="https://hydra.nixos.org/search?query=hledger"><img alt="Nix" src="https://img.shields.io/badge/Nix_package-1.17.1.1-brightgreen.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">
            nix-env -f https://github.com/NixOS/nixpkgs/archive/2f9a9064.tar.gz -iA hledger hledger-web hledger-ui
        </div>
        <div class="notes">
            In the first days after release, this may do some building (not fully cached yet)
            or fail with "HTTP error 404" (not built for your platform yet); 
            try it with --dry-run to see.
            On Linux, note <span class="warnings"><a href="https://github.com/simonmichael/hledger/issues/1030">#1030</a>, 
            <a href="https://github.com/simonmichael/hledger/issues/1033">#1033</a>.
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://www.docker.com/products/docker-desktop">Docker</a></div>
        <div class="notes">Linux, Mac, Windows</div>
        <div class="badges">
          <a href="https://hub.docker.com/r/dastapov/hledger"><img alt="Docker" src="https://img.shields.io/badge/Docker_image-1.17-red.svg" /></a>
          <a href="https://hub.docker.com/search?q=hledger&amp;type=image&amp;sort=updated_at&amp;order=desc">more..</a>
        </div>
      </td>
      <td>
        <div class="command">docker pull dastapov/hledger</div>
      </td>
    <tr>
      <td>
        <div class="distro"><a href="https://brew.sh">Homebrew</a></div>
        <div class="notes">Linux, Mac, Windows</div>
        <div class="badges">
          <!--[![](https://repology.org/badge/version-for-repo/homebrew/hledger.svg)]-->
          <a href="https://formulae.brew.sh/formula/hledger"><img alt="Homebrew" src="https://img.shields.io/badge/Homebrew-1.16.2-red.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">brew install hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://www.winehq.org">Wine</a></div>
        <div class="notes">Linux, Mac, FreeBSD</div>
      </td>
      <td>
        <div class="notes">Install Wine and use the Windows binary below</div>
      </td>
    </tr>
    <tr>
      <td colspan=2><div class="platform">Windows</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro">CI builds</div>
        <div class="badges">
          <img alt="Windows release" src="https://img.shields.io/badge/Windows_zip-1.17.1-brightgreen.svg" />
          <img alt="Windows master" src="https://img.shields.io/badge/Windows_zip-nightly-brightgreen.svg" />
      </td>
      <td>
        <div class="command" style="margin-bottom:4px;"><a href="https://github.com/simonmichael/hledger/actions/runs/68340796">-> hledger.zip</a></div>
        <div class="notes"></div>
        <div class="command"><a href="https://github.com/simonmichael/hledger/actions?query=workflow%3A%22windows+CI%22+branch%3Amaster+is%3Asuccess+event%3Aschedule">windows CI -> hledger.zip</a></div>
        <div class="notes">
          <span class="warnings">
            <!-- <a href="https://github.com/simonmichael/hledger/issues/1039">#1039</a> -->
            <!-- [no hledger-ui](https://github.com/jtdaugherty/vty/pull/1#issuecomment-297143444), -->
            <!-- [doesn't work on old windows ?](https://github.com/simonmichael/hledger/issues/774), -->
            <!-- [many files in PATH causing hangs](https://github.com/simonmichael/hledger/issues/791), -->
            <!-- [appveyor builds failing](https://github.com/simonmichael/hledger/issues/832) -->
          </span>
        </div>
      </td>
    </tr>
    <tr>
      <td colspan=2><div class="platform">GNU/Linux</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro">Arch</div>
        <div class="badges">
          <a href="https://www.archlinux.org/packages/?sort=&amp;q=hledger"><img alt="Arch" src="https://repology.org/badge/version-for-repo/arch/hledger.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">pacman -S hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro">Gentoo</div>
        <div class="badges">
          <a href="https://gentoo.zugaina.org/Search?search=hledger"><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo_package-1.17-red.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">sudo layman -a haskell &amp;&amp; sudo emerge hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro">Void</div>
        <div class="badges">
          <!-- <a href="https://voidlinux.org/packages/?q=hledger"><img src="https://repology.org/badge/version-for-repo/void_x86_64/hledger.svg" alt="Void Linux x86_64" /></a> -->
          <a href="https://voidlinux.org/packages/?q=hledger"><img src="https://img.shields.io/badge/Void_package-1.15.2-red.svg" alt="Void Linux x86_64" /></a>
        </div>
      </td>
      <td>
        <div class="command">xbps-install -S hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro">Debian</div>
        <div class="badges">
          <a href="https://packages.debian.org/unstable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_unstable/hledger.svg" alt="Debian Unstable" /></a>
          <a href="https://packages.debian.org/stable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_stable/hledger.svg" alt="Debian Stable" /></a>
          <a href="https://packages.debian.org/oldstable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_oldstable/hledger.svg" alt="Debian Oldstable" /></a>
          <a href="https://packages.debian.org/search?searchon=names&amp;keywords=hledger">more..</a>
        </div>
      </td>
      <td>
        <div class="command">sudo apt install hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro">Fedora</div>
        <div class="badges">
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_Rawhide_package-1.14.2-red.svg" alt="Fedora Rawhide" /></a>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_33_package-1.14.2-red.svg" alt="Fedora 33" /></a>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_32_package-1.14.2-red.svg" alt="Fedora 32" /></a>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_31_package-1.12.1-red.svg" alt="Fedora 31" /></a>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_30_package-1.10-red.svg" alt="Fedora 30" /></a>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_29/hledger.svg" alt="Fedora 29" /></a>
          <a href="https://apps.fedoraproject.org/packages/s/hledger">more..</a>
        </div>
      </td>
      <td>
        <div class="command">sudo dnf install hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro">Ubuntu</div>
        <div class="badges">
          <a href="https://packages.ubuntu.com/focal/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_04/hledger.svg" alt="Ubuntu 20.04" /></a>
          <a href="https://packages.ubuntu.com/eoan/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_19_10/hledger.svg" alt="Ubuntu 19.10" /></a>
          <a href="https://packages.ubuntu.com/disco/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_19_04/hledger.svg" alt="Ubuntu 19.04" /></a>
          <a href="https://packages.ubuntu.com/bionic/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_18_04/hledger.svg" alt="Ubuntu 18.04" /></a>
          <a href="https://packages.ubuntu.com/xenial/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_16_04/hledger.svg" alt="Ubuntu 16.04" /></a>
          <a href="https://packages.ubuntu.com/search?suite=all&amp;searchon=names&amp;keywords=hledger">more..</a>
        </div>
      </td>
      <td>
        <div class="command">sudo apt install hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td colspan=2><div class="platform">BSD</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://github.com/jasperla/openbsd-wip#how-to-use-this-tree">OpenBSD WIP</a></div>
        <div class="badges">
          <a href="https://github.com/jasperla/openbsd-wip/tree/master/productivity/hledger"><img src="https://img.shields.io/badge/openbsd--wip_port-1.10-red.svg" alt="openbsd-wip port" /></a>
          <a href="https://github.com/jasperla/openbsd-wip/tree/master/productivity">more..</a>
        </div>
      </td>
      <td>
        <div class="command">make -C /usr/ports/openbsd-wip/productivity/hledger install</div>
        <div class="notes">
            See also <a href="https://github.com/commercialhaskell/stack/issues/3313#issuecomment-570353913">stack#3313</a>
        </div>
      </td>
    </tr>
    <tr>
      <td colspan=2><div class="platform">Cloud</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://sandstorm.io">Sandstorm</a></div>
        <div class="notes"></div>
        <div class="badges"><a href="https://apps.sandstorm.io/search?term=hledger"><img alt="Sandstorm" src="https://img.shields.io/badge/Sandstorm_app-1.9.2-red.svg" /></a></div>
      </td>
      <td>
        <div class="command"><a href="https://apps.sandstorm.io/app/8x12h6p0x0nrzk73hfq6zh2jxtgyzzcty7qsatkg7jfg2mzw5n90">HLedger Web sandstorm app</a></div>
        <div class="notes">
          <!-- <span class=warnings> -->
          <!--   [features needed](https://github.com/simonmichael/hledger/issues/425) -->
          <!-- </span> -->
        </div>
      </td>
    </tr>
  </tbody>
</table>

<a name="b"></a>

[ghc]:             https://www.haskell.org/ghc
[bash]:            https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29
[stack]:           https://haskell.fpcomplete.com/get-started
[cabal]:           https://www.haskell.org/cabal
[hledger-install]: https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh
[add-on commands]: hledger.html#add-on-commands

## Building from source

<div class="notes" style="position:relative; top:-1em;">Linux, Unix, Mac, Windows, WSL, ...</div>

You can build hledger wherever [GHC] is supported.
This takes a while, and up to ~1G of disk space, but it's normally reliable. 
It's ok to kill a build and retry it later, you won't lose progress.

### 1. Ensure C libraries are installed

If you're on one of the following platforms, please run the command to
ensure all required C libraries are installed:
<table>
  <tr>
    <td width="1%" style="white-space:nowrap;"><div class="distro">Debian, Ubuntu:</div></td>
    <td><div class="command" style="margin:0;"> sudo apt install libtinfo-dev </div></td>
  </tr>
  <tr>
    <td><div class="distro">Fedora, RHEL:</div></td>
    <td><div class="command"> sudo dnf install gmp-devel ncurses-devel </div></td>
  </tr>
</table>

Or, you can skip this step and just try building hledger. 
If it fails with a link error
(eg: `/bin/ld.gold: error: cannot find -ltinfo`),
please web-search the error message to find the right system package to install on your platform.
And [let us know](/index.html#help), so we can update this list.

### 2. Build and install hledger

<img style="position:relative; top:-1em; margin:0;" alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17.1-brightgreen.svg" />

Our [install script][hledger-install] is the easiest way to build hledger. 
It builds the current release plus some [add-on commands], and requires only [bash]:

<!--
<div class="builder">
  <a href="https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh">hledger-install.sh</a>
</div>
<div class="notes">Linux, Unix, Mac, WSL</div>
<div class="badges">
  <img alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17.1-brightgreen.svg" />
</div>
-->
<div class="builder-command">
  curl -sO https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh <br>
  less hledger-install.sh <em style="margin-left:1em; font-weight:normal;"># good practice: inspect downloaded scripts before running</em><br>
  bash hledger-install.sh
</div>
<div class="builder-text">
  It runs the haskell build tools stack or cabal for you, 
  installing stack in ~/.local/bin if needed,
  and installs the hledger tools in ~/.local/bin or ~/.cabal/bin.
</div>
<br>

2b. Or, if you prefer to run [stack] yourself:

<!--
<div class="builder">
  <a href="https://haskell.fpcomplete.com/get-started">stack</a>
</div>
<div class="notes">Linux, Unix, Mac, Windows</div>
<div class="badges">
  <img alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17.1-brightgreen.svg" />
</div>
-->
<div class="builder-command">
  stack update <br>
  stack install --resolver=lts hledger-lib-1.17.1 hledger-1.17.1.1 hledger-ui-1.17.1.1 hledger-web-1.17.1 --silent
</div>
<div class="builder-text">
This installs the main hledger tools in ~/.local/bin.
Use the latest stack (2.1.3) for best results.
You can usually upgrade stack quickly with <code>stack upgrade</code>.
Windows users: the 64-bit version of stack is preferable;
and you should omit hledger-ui from this command, unless using WSL.
</div>
<br>

2c. Or [cabal]:

<!--
<div class="builder">
  <a href="https://www.haskell.org/cabal">cabal</a>
</div>
<div class="notes">Linux, Unix, Mac, Windows</div>
<div class="badges">
  <img alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17.1-brightgreen.svg" />
</div>
-->
<div class="builder-command">
  cabal v2-update <br>
  cabal v2-install alex happy<br>
  cabal v2-install hledger-1.17.1.1 hledger-web-1.17.1 hledger-ui-1.17.1.1
</div>
<div class="builder-text">
This installs the main hledger tools in ~/.cabal/bin.
Windows users: omit hledger-ui from this command, unless using WSL.
</div>

<br>

### Tips for building from source

- With stack or cabal (or nix) you can add `--dry-run` to the install
  command to see how much building remains.

- You can reduce build time by omitting the hledger-web and hledger-ui
  packages from the commands above.

- Here are some known build issues and workarounds on certain platforms:

  <blockquote class="warnings">
    <a href="https://github.com/jtdaugherty/vty/pull/1#issuecomment-297143444">windows: hledger-ui is not available</a><br>
    <a href="https://github.com/well-typed/generics-sop/issues/93">windows: GHC 8.6.3 hangs while building</a><br>
    <a href="https://github.com/simonmichael/hledger/issues/961#issuecomment-471229644">windows: cross-environment non-ascii display issues</a><br>
    <!-- <a href="https://github.com/simonmichael/hledger/issues/1039">windows: hledger-web fails to start on Windows 7</a><br> -->
    <a href="https://wiki.archlinux.org/index.php/Haskell">arch: haskell build advice from Arch wiki</a><br>
    <!-- <a href="https://github.com/commercialhaskell/stack/issues/3984">arch: No information found for ghc-8.4.2</a><br> -->
    <!-- <a href="https://github.com/simonmichael/hledger/issues/709">freebsd 12: no cabal file found</a><br> -->
    <!-- <a href="https://github.com/commercialhaskell/stack/issues/2822#issuecomment-318892816">openbsd: how to install stack</a><br> -->
    <a href="https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html">openbsd 6: exec: permission denied</a><br>
    <a href="https://github.com/commercialhaskell/stack/issues/3313#issuecomment-570353913">openbsd: stack install tips</a><br>
    <a href="https://github.com/simonmichael/hledger/issues/1030">nix: nix install on linux can fail with “cloning builder process: Operation not permitted”</a><br>
    <a href="https://github.com/simonmichael/hledger/issues/1033">nix: on Linux, nix-installed hledger won’t handle non-ascii data</a><br>
  </blockquote>

<a name="c"></a>

### Building the development version

If you want the very [latest improvements](https://github.com/simonmichael/hledger/commits/master),
our master branch on github is suitable for daily use.
Get the source with [git](https://en.wikipedia.org/wiki/Git):
<div class="builder-command">
git clone https://github.com/simonmichael/hledger <br>
cd hledger
</div>

and install executables to ~/.local/bin with [stack]:
<div class="builder-command">
stack update<br>
stack install
</div>

or to ~/.cabal/bin with [cabal]:
<div class="builder-command">
cabal v2-update<br>
cabal v2-install alex happy<br>
cabal v2-install ./hledger-lib ./hledger ./hledger-ui ./hledger-web
</div>

hledger development builds show a ".99" suffix in their `--version` output, 
so eg "1.17.99" means the in-development version of 1.18.

### Building the development version with Docker

You can also build the development version in a Docker container which
will take care of pulling all the necessary tools and dependencies:

<div class="builder-command">
git clone https://github.com/simonmichael/hledger <br>
cd hledger/docker <br>
./build.sh
</div>

This will build the image tagged `hledger` with just the latest binaries inside.
If you want to keep all the build artifacts and use the resulting
image for hledger development, run `./build-dev.sh` instead.

## Check your PATH

After building/installing, you may see a message about where the executables were installed.
Eg:

- with stack: `$HOME/.local/bin` (on Windows, `%APPDATA%\local\bin`)
- with cabal: `$HOME/.cabal/bin` (on Windows, `%APPDATA%\cabal\bin`)
- with nix:   `$HOME/.nix-profile/bin`

Make sure that this install directory is included in your shell's `$PATH`
(preferably near the start, to preempt any old hledger binaries you might have lying around),
so that you can run the hledger tools easily.
How to configure this depends on your platform and shell.
If you are using bash, this will show it:

<div class="command">
  echo $PATH
</div>

and here's a way to add the stack and cabal install dirs permanently:

<div class="command">
  echo "export PATH=~/.local/bin:~/.cabal/bin:$PATH" >> ~/.bashrc <br>
  source ~/.bashrc
</div>

## Test your installation

After a successful installation, you should be able to run the hledger
tools (that you installed), and see the expected versions. Eg:

<div class="command">
$ hledger --version <br>
hledger 1.17.1.1 <br>
$ hledger-ui --version <br>
hledger-ui 1.17.1.1 <br>
$ hledger web --version <br>
hledger-web 1.17.1 <br>
</div>

And you could see the unit tests pass (just for fun):

<div class="command">
$ hledger test <br>
... <br>
All 198 tests passed (4.30s)
</div>

<br>

Nicely done! Now check the **[Quick Start](index.html#quick-start)**
for next steps, or come to the **[#hledger chat](index.html#help)**
where we'll gladly share tips or receive your feedback.

<br>
