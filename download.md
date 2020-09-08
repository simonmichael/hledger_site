# Download/Install

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

The current hledger release is **1.19.1** ([release notes](release-notes)). Below are lots of ways to install:\
\- [Binary packages](#binary-packages) install quickly\
\- [Building from source](#building-from-source) takes longer but ensures you get the latest release.\
You may need some [C libraries](#c-libraries) or a [UTF-8 locale](#utf-8-locale).\
Afterward, [check your PATH](#check-your-path) and [test your installation](#test-your-installation),
and please [report](index.html#help) any trouble.

## Binary packages

### Multiplatform

<table class="multiplatform downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
          <a href="https://hub.docker.com/r/dastapov/hledger"><img alt="Docker" src="https://img.shields.io/badge/Docker_image-1.19.1-brightgreen.svg" /></a><br>
          <a href="https://hub.docker.com/search?q=hledger&amp;type=image&amp;sort=updated_at&amp;order=desc">more..</a>
        </div>
        <div class="distro"><a href="https://www.docker.com/products/docker-desktop">Docker</a></div>
        <div class="notes">Linux, Mac, Windows</div>
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
        <div class="distro"><a href="https://brew.sh">Homebrew</a></div>
        <div class="notes">Linux, Mac, WSL</div>
      </td>
      <td>
        <div class="command">brew install hledger</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://github.com/search?l=&o=desc&q=%22automatic+Haskell+package+set+update%22+repo%3ANixOS%2Fnixpkgs+filename%3Ahaskell-packages.nix&s=committer-date&type=Commits"><img alt="Nix" src="https://img.shields.io/badge/Nix_package-1.18.1-red.svg" /></a>
        </div>
        <divC class="distro"><a href="https://nixos.org/nix">Nix</a></div>
        <div class="notes">Linux, Mac</div>
      </td>
      <td>
        <div class="command">
            nix-env -f https://github.com/NixOS/nixpkgs/archive/b8b74435.tar.gz -iA hledger hledger-web hledger-ui
        </div>
        <div class="notes">
            Binaries may not yet be fully cached for your platform, try with --dry-run to estimate how much building will be required.
            On Linux, note <span class="warnings"><a href="https://github.com/simonmichael/hledger/issues/1030">#1030</a>, 
            <a href="https://github.com/simonmichael/hledger/issues/1033">#1033</a>.
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://www.winehq.org">Wine</a></div>
        <div class="notes">Linux, Mac, *BSD, ...</div>
      </td>
      <td>
        <div class="notes">Install Wine and use the Windows binary below</div>
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

### Windows

<table class="windows downloads">
  <tbody>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="CI binaries" src="https://img.shields.io/badge/CI_binaries-1.19.1-brightgreen.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;"><a href="https://github.com/simonmichael/hledger/releases/tag/1.19.1">hledger-windows.zip</a></div>
        <div class="notes">
        <!--   <span class="warnings"> -->
        <!--     <\!-- <a href="https://github.com/simonmichael/hledger/issues/1039">#1039</a> -\-> -->
        <!--     <\!-- [no hledger-ui](https://github.com/jtdaugherty/vty/pull/1#issuecomment-297143444), -\-> -->
        <!--     <\!-- [doesn't work on old windows ?](https://github.com/simonmichael/hledger/issues/774), -\-> -->
        <!--     <\!-- [many files in PATH causing hangs](https://github.com/simonmichael/hledger/issues/791), -\-> -->
        <!--     <\!-- [appveyor builds failing](https://github.com/simonmichael/hledger/issues/832) -\-> -->
        <!--   </span> -->
        </div>
      </td>
    </tr>
  </tbody>
</table>

### Mac

<table class="mac downloads">
  <tbody>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="CI binaries" src="https://img.shields.io/badge/CI_binaries-1.19.1-brightgreen.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;"><a href="https://github.com/simonmichael/hledger/releases/tag/1.19.1">hledger-macos.zip</a></div>
        <div class="notes"></div>
      </td>
    </tr>
  </tbody>
</table>

### GNU/Linux

<table class="linux downloads">
  <tbody>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="CI binaries" src="https://img.shields.io/badge/CI_binaries-1.19.1-brightgreen.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;"><a href="https://github.com/simonmichael/hledger/releases/tag/1.19.1">hledger-ubuntu.zip</a></div>
        <div class="notes"></div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://www.archlinux.org/packages/?sort=&amp;q=hledger"><img alt="Arch" src="https://repology.org/badge/version-for-repo/arch/hledger.svg" /></a>
        </div>
        <div class="distro">Arch</div>
      </td>
      <td>
        <div class="command">pacman -S hledger hledger-ui hledger-web</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="badges">
          <a href="https://gentoo.zugaina.org/Search?search=hledger"><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo_package-1.18.1-red.svg" /></a>
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
          <a href="https://packages.debian.org/unstable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_unstable/hledger.svg" alt="Debian Unstable" /></a><br>
          <a href="https://packages.debian.org/stable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_stable/hledger.svg" alt="Debian Stable" /></a><br>
          <a href="https://packages.debian.org/oldstable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_oldstable/hledger.svg" alt="Debian Oldstable" /></a><br>
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
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_rawhide/hledger.svg" alt="Fedora Rawhide" /></a><br>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_33_package-1.14.2-red.svg" alt="Fedora 33" /></a><br>
          <!-- <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_33/hledger.svg" alt="Fedora 33" /></a><br> -->
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_32/hledger.svg" alt="Fedora 32" /></a><br>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_31/hledger.svg" alt="Fedora 31" /></a><br>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_30/hledger.svg" alt="Fedora 30" /></a><br>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://repology.org/badge/version-for-repo/fedora_29/hledger.svg" alt="Fedora 29" /></a><br>
          <a href="https://apps.fedoraproject.org/packages/s/hledger">more..</a>
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
          <a href="https://packages.ubuntu.com/groovy/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_10/hledger.svg" alt="Ubuntu 20.10" /></a><br>
          <a href="https://packages.ubuntu.com/focal/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_04/hledger.svg" alt="Ubuntu 20.04" /></a><br>
          <a href="https://packages.ubuntu.com/eoan/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_19_10/hledger.svg" alt="Ubuntu 19.10" /></a><br>
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


<!-- ### NetBSD -->

<!-- <table class="netbsd bsd downloads"> -->
<!--   <tbody> -->
<!--     <tr> -->
<!--       <td> -->
<!--         <div class="badges"> -->
<!--           <a href=""><img src="https://img.shields.io/badge/netbsd-1.17.1.1-red.svg" alt="netbsd package" /></a><br> -->
<!--           <a href="">more..</a> -->
<!--         </div> -->
<!--         <div class="distro"><a href="https://www.netbsd.org/">NetBSD</a></div> -->
<!--       </td> -->
<!--       <td> -->
<!--         <div class="command">pkg_add hledger</div> -->
<!--         <div class="notes"> -->
<!--         </div> -->
<!--       </td> -->
<!--     </tr> -->
<!--   </tbody> -->
<!-- </table> -->


### FreeBSD

<table class="freebsd bsd downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
          <a href="https://www.freshports.org/search.php?query=hledger"><img src="https://img.shields.io/badge/freebsd--ports-1.18.1-red.svg" alt="freebsd ports" /></a><br>
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

### OpenBSD

<table class="openbsd bsd downloads">
  <tbody>
    <tr>
      <td>
        <div class="badges">
          <a href="https://github.com/jasperla/openbsd-wip/tree/master/productivity/hledger"><img src="https://img.shields.io/badge/openbsd--wip_port-1.10-red.svg" alt="openbsd-wip port" /></a><br>
          <a href="https://github.com/jasperla/openbsd-wip/tree/master/productivity">more..</a>
        </div>
        <div class="distro"></div>
      </td>
      <td>
        <div class="command">make -C /usr/ports/openbsd-wip/productivity/hledger install</div>
        <div class="notes">            
            <a href="https://github.com/jasperla/openbsd-wip#how-to-use-this-tree">How to use OpenBSD WIP</a>,
            <a href="https://github.com/commercialhaskell/stack/issues/3313#issuecomment-570353913">stack#3313</a>
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
          <img alt="Contributed binaries" src="https://img.shields.io/badge/Contributed_binaries-1.18.1-red.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;"><a href="https://github.com/simonmichael/hledger/releases/tag/1.18.1">hledger-aarch64-manjaro.gz</a></div>
        <div class="notes"></div>
      </td>
    </tr>
    <tr valign="top">
      <td>
        <div class="badges">
          <img alt="Contributed binaries" src="https://img.shields.io/badge/Contributed_binaries-1.18-red.svg" />
        </div>
      </td>
      <td style="padding-top:10px;">
        <div class="command" style="margin-bottom:4px;"><a href="https://github.com/simonmichael/hledger/releases/tag/1.18">hledger-armhf32-debian.gz</a></div>
        <div class="notes"></div>
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

<a name="b"></a>

## C libraries

On some platforms, certain C library packages must be installed, or
you'll see an error (eg: "*cannot find -ltinfo*") when you try to run
prebuilt hledger binaries or build hledger from source. So if you're
on one of the following platforms, please run the command shown (and
please [send improvements for this list](#comment)):

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

## UTF-8 locale

On unix systems, when building or running hledger (and GHC haskell
programs in general), the `LANG` environment variable must be set to a
UTF-8-aware locale, or you'll see errors (eg: "*invalid byte
sequence*") when processing non-ascii text. Check that LANG's value
mentions UTF-8, and if not, change it:

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

## Building from source

The [hledger-install script][hledger-install] requires only [bash] and
builds the current release of the hledger tools and some [add-ons], in
a reliable way:

<div class="builder-command">
  curl -sO https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh <br>
  less hledger-install.sh <em style="margin-left:1em; font-weight:normal;"># <- good practice: inspect downloaded scripts before running</em><br>
  bash hledger-install.sh
</div>

This uses the stack or cabal build tools
(installing stack in ~/.local/bin if needed),
and installs the hledger tools in ~/.local/bin or ~/.cabal/bin.

Or, if you prefer to run [stack] yourself:

<div class="builder-command">
  stack update <br>
  stack install --resolver=lts hledger-lib-1.19.1 hledger-1.19.1 hledger-ui-1.19.1 hledger-web-1.19.1 --silent
</div>

This installs the main hledger tools in ~/.local/bin.
Your <code>stack --version</code> should be not too ancient; use a recent release (2.3.1+) for best results.
You can usually upgrade stack quickly with <code>stack upgrade</code>.
Windows users: the 64-bit version of stack is preferable;
and you should omit hledger-ui from this command, unless you are in [WSL].

Or, if you prefer to run [cabal] yourself:

<div class="builder-command">
  cabal update <br>
  cabal install alex happy<br>
  cabal install hledger-1.19.1 hledger-ui-1.19.1 hledger-web-1.19.1
</div>

This installs the main hledger tools in ~/.cabal/bin.
Your <code>cabal --version</code> should be not too ancient; use a recent release (eg 3.2+) for best results.
Windows users: omit hledger-ui from this command, unless you are in [WSL].

Or, [nix] users can use nix-env to build hledger from source (but we
try to [provide](#multiplatform) a nix command that installs
already-cached binaries.)


### Build tips

- You can build hledger wherever [GHC] is supported. It could take up
  to half an hour (or more), ~1G of disk space and ~4G of RAM. It's
  normally a reliable process you don't have to babysit.

- Building in less RAM may fail with an error, or may use swap space
  and take a very long time (overnight). If a low-RAM build dies, try
  adding `-j1` to the stack/cabal install command, and retry a few
  times, or ask for [help].

- It's ok to kill a build and retry it later, you won't lose progress.

- You can add `--dry-run` to the stack/cabal/nix install command to
  see how much building remains.

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

Here's [how to set environment variables on Windows](https://www.devdungeon.com/content/set-environment-variables-windows).

## Test your installation

After a successful installation, you should be able to run the hledger
tools and see the expected versions (the ones you just installed, and
not any older versions that may exist somewhere else in your PATH).
Eg:

<div class="command">
$ hledger --version <br>
hledger 1.19.1 <br>
$ hledger-ui --version <br>
hledger-ui 1.19.1 <br>
$ hledger web --version <br>
hledger-web 1.19.1 <br>
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


[ghc]:             https://www.haskell.org/ghc
[bash]:            https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29
[stack]:           https://www.fpcomplete.com/haskell/get-started
[cabal]:           https://www.haskell.org/cabal
[hledger-install]: https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh
[add-ons]:         hledger.html#add-on-commands
[WSL]:             https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux
[nix]:             https://nixos.org
[help]:            index.html#help
