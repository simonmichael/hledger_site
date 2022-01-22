# Install

<div class=pagetoc>
<!-- toc -->
</div>

<style>
h2 {
    margin-top:2em;
}
h3 {
    margin-top:1em;
    margin-bottom:0;
}
table.downloads { 
  width:100%;
}
table.downloads > tbody > tr { 
  border-top:thin solid #ddd; 
  border-bottom:thin solid #ddd; 
  vertical-align: top;
}
table.downloads > tbody > tr > td { 
  padding-top:0.5em;
  padding-bottom:0.5em;
}
table.downloads > tbody > tr > td:nth-child(1) { 
  min-width:10em;
}
table.downloads > tbody > tr > td:nth-child(2) { 
  width:99%;
}
div.section > table td:nth-child(1) {
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
.linux .distro {
  display:none;
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

The current hledger release is **1.24.1**. ([Release notes](release-notes))

Here are lots of ways to install hledger - choose one that suits your needs.
Binary packages install quickly but are not always up to date (look for green badges).
Building from source is slower and requires at least 4G of ram.

After installing, please [check](#pre-flight-checks) your PATH, locale, and installation,
and [share any feedback](support.html) so we can make this process smoother!

## Binary packages

### Multiple platforms

<table class="multiplatform downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
          <a href="https://hub.docker.com/r/dastapov/hledger"><img alt="Docker" src="https://img.shields.io/badge/Docker_image-1.24.1-brightgreen.svg" /></a><br>
          <a href="https://hub.docker.com/search?q=hledger&amp;type=image&amp;sort=updated_at&amp;order=desc">more..</a>
        </div>
        <!-- <div class="distro"><a href="https://www.docker.com/products/docker-desktop">Docker</a></div> -->
        <!-- <div class="notes">Linux, Mac, Windows</div> -->
      </td>
      <td>
        <div class="command">docker pull dastapov/hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://formulae.brew.sh/formula/hledger"><img alt="Homebrew" src="https://repology.org/badge/version-for-repo/homebrew/hledger.svg" /></a>
        </div>
        <!-- <div class="distro"><a href="https://brew.sh">Homebrew</a></div> -->
        <!-- <div class="notes">Linux, Mac, WSL</div> -->
      </td>
      <td>
        <div class="command">brew install hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://github.com/search?l=&o=desc&q=%22automatic+Haskell+package+set+update%22+repo%3ANixOS%2Fnixpkgs+filename%3Ahaskell-packages.nix&s=committer-date&type=Commits"><img alt="Nix" src="https://img.shields.io/badge/Nix_package-1.24.1-brightgreen.svg" /></a>
        </div>
        <!-- <div class="distro"><a href="https://nixos.org/nix">Nix</a></div> -->
        <!-- <div class="notes">Linux, Mac</div> -->
      </td>
      <td>
        <div class="command">
            nix-env -f https://github.com/NixOS/nixpkgs/archive/e1225076.tar.gz -iA hledger_1_24_1 hledger-ui_1_24_1 hledger-web_1_24_1
        </div>
        <div class="notes">
            Nix binaries may not yet be fully cached for your platform, try with --dry-run to estimate how much building will be required.
            On Linux, note <span class="warnings"><a href="https://github.com/simonmichael/hledger/issues/1030">#1030</a>, 
            <a href="https://github.com/simonmichael/hledger/issues/1033">#1033</a>.
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href=""><img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-1.24.1-brightgreen.svg" /></a><br>
        </div>
        <!-- <div class="notes">Linux, Mac, Windows</div> -->
      </td>
      <td>
        <div class="command">
          <a href="https://github.com/simonmichael/hledger/releases/tag/hledger-1.24.1">hledger-linux-x64.zip</a><br>
          <a href="https://github.com/simonmichael/hledger/releases/tag/hledger-1.24.1">hledger-macos.zip</a><br>
          <a href="https://github.com/simonmichael/hledger/releases/tag/hledger-1.24.1">hledger-windows.zip</a>
          <span style="font-weight:normal; font-style:italic; font-size:small;">
            (This one can run on other platforms with <a href="https://www.winehq.org">Wine</a>.)
          </span><br>
        </div>
        <div class="notes"></div>
      </td>
    </tr>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-Preview-yellow.svg" />
        </div>
        <!-- <div class="notes">Linux, Mac, Windows</div> -->
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;">
          <a href="https://github.com/simonmichael/hledger/releases">https://github.com/simonmichael/hledger/releases</a><br>
        </div>
        <div class="notes">
          Previews of the next major release, for testers & early adopters.
        </div>
      </td>
    </tr>
  </tbody>
</table>

<!-- 
https://unix.stackexchange.com/questions/388986/what-is-the-difference-between-freebsd-ports-and-pkgsrc
https://wiki.freebsd.org/PackageSystemsComparison
https://www.pkgsrc.org
http://cdn.netbsd.org/pub/pkgsrc/current/pkgsrc/finance/README.html
http://cdn.netbsd.org/pub/pkgsrc/current/pkgsrc/finance/hledger/README.html
http://cdn.netbsd.org/pub/pkgsrc/current/pkgsrc/finance/hledger/
Once pkgsrc 2020Q2 ships (in 202005W1):
Build hledger from source on netbsd:
cd /usr/pkgsrc/net/hledger && make install
Install pkgsrc & build hledger from source on non-netbsd:
cd pkgsrc && ./bootstrap/bootstrap --prefix=$HOME/pkg --unprivileged --make-jobs 8 && cd finance/hledger && env PATH=$PATH:$HOME/pkg bmake install
-->

<!--
Latest developer CI binaries:
go to https://ci.hledger.org, click on one of the recent runs for your
platform (linux/mac/windows), download the artifact at the bottom of
the page. The instructions for running binaries, at
https://github.com/simonmichael/hledger/releases, also apply here.
-->

### Windows

<table class="windows downloads">
  <tbody>
    <tr valign="top">
      <td>
        <div class="badges">
          <a href="https://community.chocolatey.org/packages/hledger">
            <img alt="Chocolatey package" src="https://repology.org/badge/version-for-repo/chocolatey/hledger.svg" />
          </a>
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;">
          choco install hledger -y
        </div>
        <div class="notes">
        <!--   <span class="warnings"> -->
        <!--   </span> -->
        </div>
      </td>
    </tr>
  </tbody>
</table>

<!-- ### Mac

<table class="mac downloads">
  <tbody>
  </tbody>
</table>
 -->
### GNU/Linux

<table class="linux downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
          <a href="https://gentoo.zugaina.org/Search?search=hledger"><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo_package-1.24.1-brightgreen.svg" /></a>
        </div>
    <div class="distro">Gentoo</div>
      </td>
      <td>
        <div class="command">sudo layman -a haskell &amp;&amp; sudo emerge hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://archlinux.org/packages/community/x86_64/hledger/"><img alt="Arch" src="https://repology.org/badge/version-for-repo/arch/hledger.svg" /></a>
        </div>
        <div class="distro">Arch</div>
      </td>
      <td>
        <div class="command">pacman -Sy hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://voidlinux.org/packages/?q=hledger"><img src="https://repology.org/badge/version-for-repo/void_x86_64/hledger.svg" alt="Void Linux x86_64" /></a>
        </div>
        <div class="distro">Void</div>
      </td>
      <td>
        <div class="command">xbps-install -S hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a ><img src="https://img.shields.io/badge/Fedora_36_package-1.21-red.svg" alt="Fedora 36" /></a><br>
          <a ><img src="https://img.shields.io/badge/Fedora_35_package-1.21-red.svg" alt="Fedora 35" /></a><br>
          <a ><img src="https://repology.org/badge/version-for-repo/fedora_34/hledger.svg" alt="Fedora 34" /></a><br>
          <a ><img src="https://repology.org/badge/version-for-repo/fedora_33/hledger.svg" alt="Fedora 33" /></a><br>
          <a href="https://src.fedoraproject.org/rpms/hledger">more..</a>
        </div>
        <div class="distro">Fedora</div>
      </td>
      <td>
        <div class="command">sudo dnf install hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://packages.debian.org/unstable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_unstable/hledger.svg" alt="Debian unstable" /></a><br>
          <a href="https://packages.debian.org/stable/hledger"><img src="https://img.shields.io/badge/Debian_stable_package-1.18.1-red.svg" alt="Debian stable" /></a><br>
          <a href="https://packages.debian.org/oldstable/hledger"><img src="https://img.shields.io/badge/Debian_oldstable_package-1.10-red.svg" alt="Debian oldstable" /></a><br>
          <a href="https://packages.debian.org/oldstable/hledger"><img src="https://img.shields.io/badge/Debian_oldoldstable_package-1.0.1-red.svg" alt="Debian oldoldstable" /></a><br>
          <a href="https://packages.debian.org/search?searchon=names&amp;keywords=hledger">more..</a>
        </div>
        <div class="distro">Debian</div>
      </td>
      <td>
        <div class="command">sudo apt install hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://packages.ubuntu.com/hirsute/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_21_04/hledger.svg" alt="Ubuntu 21.04" /></a><br>
          <!-- <a href="https://packages.ubuntu.com/groovy/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_10/hledger.svg" alt="Ubuntu 20.10" /></a><br> -->
          <a href="https://packages.ubuntu.com/focal/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_04/hledger.svg" alt="Ubuntu 20.04" /></a><br>
          <a href="https://packages.ubuntu.com/bionic/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_18_04/hledger.svg" alt="Ubuntu 18.04" /></a><br>
          <a href="https://packages.ubuntu.com/xenial/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_16_04/hledger.svg" alt="Ubuntu 16.04" /></a><br>
          <a href="https://packages.ubuntu.com/search?suite=all&amp;searchon=names&amp;keywords=hledger">more..</a>
        </div>
        <div class="distro">Ubuntu</div>
      </td>
      <td>
        <div class="command">sudo apt install hledger hledger-ui hledger-web</div>
      </td>
    </tr>
  </tbody>
</table>

### BSD

<table class="bsd downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
          <a href="https://openports.se/productivity/hledger"><img src="https://repology.org/badge/version-for-repo/openbsd/hledger.svg" alt="openbsd ports" /></a><br>
        </div>
        <div class="distro"></div>
      </td>
      <td>
        <div class="command">pkg_add hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://cdn.netbsd.org/pub/pkgsrc/current/pkgsrc/finance/hledger/index.html"><img src="https://img.shields.io/badge/NetBSD-1.21-red.svg" alt="netbsd package" /></a><br>
        </div>
      </td>
      <td>
        <div class="command">pkg_add hledger</div>
        <div class="notes">
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://www.freshports.org/search.php?query=hledger"><img src="https://repology.org/badge/version-for-repo/freebsd/hledger.svg" alt="freebsd ports" /></a><br>
        </div>
        <div class="distro"></div>
      </td>
      <td>
        <div class="command">pkg install hs-hledger hs-hledger-ui hs-hledger-web</div>
        <div class="notes">
        </div>
      </td>
    </tr>
  </tbody>
</table>


### Raspberry Pi

<table class="pi downloads">
  <tbody>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-1.22.2-red.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;">
          <a href="https://github.com/simonmichael/hledger/releases/tag/1.22.1">hledger-linux-arm32v7.zip</a><br>
        </div>
        <div class="notes"></div>
      </td>
    </tr>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="Contributed binaries" src="https://img.shields.io/badge/Contributed_binaries-1.18.1-red.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;">
          <a href="https://github.com/simonmichael/hledger/releases/tag/1.18.1">hledger-aarch64-manjaro.gz</a><br>
          <a href="https://github.com/simonmichael/hledger/releases/tag/1.18">hledger-armhf32-debian.gz</a>
        </div>
        <div class="notes">
          Note: unaudited third party binaries
        </div>
      </td>
    </tr>
  </tbody>
</table>

### Cloud

<table class="cloud downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
            <a href="https://apps.sandstorm.io/search?term=hledger"><img alt="Sandstorm" src="https://img.shields.io/badge/Sandstorm_app-1.9.2-red.svg" /></a>
        </div>
        <div class="distro"><a href="https://sandstorm.io">Sandstorm</a></div>
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

## Building the current release
<!-- <img alt="Release source" src="https://img.shields.io/badge/Release_source-1.24.1-brightgreen.svg" /> -->

You can build hledger from its source code on any machine with [GHC] and sufficient RAM
(4G recommended) and disk space (up to 2G for a first build).
Including all dependencies, this could take anywhere from a minute to an hour.

### With hledger-install

This is a good choice if you are new to Haskell and its build tools.
On any machine with [bash] (and possibly make, gcc...):
download and run the [hledger-install.sh][hledger-install] script
to build the current release of the hledger tools, plus some [add-ons], in a relatively reliable way.
It will use either stack or cabal if you have them,
or will install stack in ~/.local/bin if needed,
and it installs the hledger tools in ~/.local/bin or ~/.cabal/bin respectively.

<div class="builder-command">
  curl -sO https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh <br>
  less hledger-install.sh <em style="margin-left:1em; font-weight:normal;"># <- good practice: inspect downloaded scripts before running</em><br>
  bash hledger-install.sh
</div>

### With stack

If you have [stack], you can run it yourself
to install the main hledger tools in ~/.local/bin:

<div class="builder-command">
  stack update <br>
  stack install --resolver=lts-18 hledger-lib-1.24.1 hledger-1.24.1 hledger-ui-1.24.1 hledger-web-1.24.1 --silent
</div>

Your `stack --version` should be modern (at least 2.7) for best results.
(You can usually upgrade stack quickly with `stack upgrade`.)
On Windows, prefer the 64-bit version of stack, 
and omit hledger-ui from this command (unless you are in [WSL]).

### With cabal

If you have [GHC] and [cabal], you can run cabal yourself
to install the main hledger tools in ~/.cabal/bin:

<div class="builder-command">
  cabal update <br>
  cabal install alex happy<br>
  cabal install hledger-1.24.1 hledger-ui-1.24.1 hledger-web-1.24.1
</div>

Your `cabal --version` should be modern (at least 3.2) for best results.
On Windows, omit hledger-ui from this command (unless you are in [WSL]).

### With nix

If you have [nix], you can use nix-env to build hledger from source 
(but we try to provide a [nix command](#multiple-platforms) that installs
already-cached binaries, see above).

### C libraries required

On some unix systems, certain required C libraries may not be installed. 
So if you see errors like "*cannot find -ltinfo*" when building hledger, 
install them with a command like the below and try again:

<table>
  <tr>
    <td width="1%" style="white-space:nowrap;"><div class="distro">Debian, Ubuntu:</div></td>
    <td><div class="command" style="margin:0;"> sudo apt install libtinfo-dev libtinfo5 </div></td>
  </tr>
  <tr>
    <td><div class="distro">Fedora, RHEL:</div></td>
    <td><div class="command"> sudo dnf install gmp-devel ncurses-devel </div></td>
  </tr>
</table>

(Please [send updates](#footer) for this list.)

### UTF-8 locale required

On unix systems, when building hledger the `LANG` environment variable
must be set to a UTF-8-aware locale. See [Check your locale](#check-your-locale).

### Other build tips

- You can use less resources by omitting hledger-ui and hledger-web
  from the commands above.

- On machines with less than 4G of RAM, the build may use swap space and 
  take a very long time (overnight), or it may die. 
  Try adding `-j1` to the stack/cabal install command, and retry a few times, 
  or ask for [help](support.html).

- It's ok to kill a build and rerun the command later; you won't lose progress.

- You can add `--dry-run` to the stack/cabal/nix install commands
  to see how much building remains.

- If you have previously installed the hledger tools, 
  they will usually be overwritten by the new version.
  If you have them installed in multiple places in your PATH, 
  you may see a warning, reminding you to remove or rename the old executables.

- Here are some known platform-specific build issues and workarounds:

  <blockquote class="warnings">
    <a href="https://gitlab.haskell.org/ghc/ghc/-/issues/20592">mac m1: building with ghc 9+ requires extra include dir</a><br>
    <a href="https://github.com/jtdaugherty/vty/pull/1#issuecomment-297143444">windows: hledger-ui is not available</a><br>
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

## Building the development version
<!-- <img alt="Latest source" src="https://img.shields.io/badge/Latest_source-master-brightgreen.svg" /> -->

If you want the very [latest improvements](https://github.com/simonmichael/hledger/commits/master),
our master branch on github is suitable for daily use.
Get the source with [git](https://en.wikipedia.org/wiki/Git):
<div class="builder-command">
git clone https://github.com/simonmichael/hledger <br>
cd hledger
</div>

and build and install executables to ~/.local/bin with [stack]:
<div class="builder-command">
stack update<br>
stack install
</div>

or to ~/.cabal/bin with [cabal]:
<div class="builder-command">
cabal update<br>
cabal install alex happy<br>
cabal install all:exes
</div>

or you can build in a Docker container which includes the necessary tools and dependencies:
<div class="builder-command">
git clone https://github.com/simonmichael/hledger <br>
cd hledger/docker <br>
./build.sh
</div>

(This will build the image tagged `hledger` with just the latest binaries inside.
If you want to keep all the build artifacts and use the resulting
image for hledger development, run `./build-dev.sh` instead.)

## Pre-flight checks

### Check your PATH

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

and here's a way to add the stack and cabal install dirs permanently
, if you are a bash user:

<div class="command">
  echo "export PATH=~/.local/bin:~/.cabal/bin:$PATH" >> ~/.bashrc <br>
  source ~/.bashrc
</div>

Here's [how to set environment variables on Windows](https://www.devdungeon.com/content/set-environment-variables-windows).

### Check your locale

On unix systems, when running hledger 
(and other GHC-compiled programs, like GHC, cabal & stack), 
the `LANG` environment variable must be set to a UTF-8-aware locale
to avoid errors like "*invalid byte sequence*" or "*mkTextEncoding: invalid argument*"
when processing non-ascii text. 

Check that LANG's value mentions UTF-8, and if not, change it:

```shell
$ echo $LANG
C
$ export LANG=C.UTF-8    # or en_US.UTF-8, fr_FR.utf8, etc.
$ echo $LANG
C.UTF-8
```

In some cases the locale may need to be installed with your system
package manager first. See
[hledger: Troubleshooting](hledger.html#troubleshooting) for more help.
<!-- XXX ^ improve -->

### Check your installation

After a successful installation, you should be able to run the hledger
tools and see the expected versions (the ones you just installed, and
not any older versions that may exist somewhere else in your PATH).
Eg:

<div class="command">
$ hledger --version <br>
hledger 1.24.1-g7799d526b-20211210, mac-x86_64
<br>
$ hledger-ui --version <br>
hledger-ui 1.24.1-g7799d526b-20211210, mac-x86_64
<br>
$ hledger web --version <br>
hledger-web 1.24.1-g7799d526b-20211210, mac-x86_64
<br>
</div>

And you could see the unit tests pass (just for fun):

<div class="command">
$ hledger test <br>
... <br>
All 221 tests passed (0.05s)
</div>

Or if you have checked out the hledger source, also the functional tests:

<div class="command">
$ make functest <br>
... <br>
 Total   813 ...<br>
functest PASSED
</div>

<br>

Nicely done! Now check the **[Quick Start](index.html#quick-start)**
for next steps, or come to the **[#hledger chat](support.html)**
where we'll gladly share tips or receive your feedback.

<br>


[ghc]:             https://www.haskell.org/ghc
[bash]:            https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29
[make]:            https://www.gnu.org/software/make/
[stack]:           https://www.fpcomplete.com/haskell/get-started
[cabal]:           https://www.haskell.org/cabal
[hledger-install]: https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh
[add-ons]:         hledger.html#add-on-commands
[WSL]:             https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux
[nix]:             https://nixos.org
