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
/* table.downloads > tbody > tr > td { 
  padding-top:0.5em;
  padding-bottom:0.5em;
} */
table.downloads > tbody > tr > td:nth-child(1) { 
  min-width:10em;
}
table.downloads > tbody > tr > td:nth-child(2) { 
  width:99%;
}
div.section > table td:nth-child(1) {
  padding-right:1em;
}
div.command {
  font-weight:bold;
  white-space:nowrap;
  /* margin-bottom:1em; */
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
div.badges > a > img {
  width: 10em;
}
.warnings > a:before {
    content: " ⚠ ";
    color:red;
}
</style>

The current hledger release is **1.28**. ([Release notes](release-notes))

Here are lots of ways to install hledger:
- [Binary packages](#binary-packages) install quickly but are not always up to date (look for green badges below).
- [Building the current release](#build-the-current-release) (or [development version](#build-the-development-version))
  from source code takes longer and has some [build requirements](#build-requirements).

After downloading binaries or building from source, 
please check that the [run requirements](#run-requirements) (PATH and locale) are satisfied.

And finally please [share any feedback](support.html) so we can make this process smoother!

<br clear=all>

## Binary packages

### Mac

<table class="mac downloads">

  <tr> <!-- CI BINARIES -->
    <td>
      <div class="badges">
        <a><img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-1.28-brightgreen.svg" /></a><br>
      </div>
      <!-- <div class="notes">Linux, Mac, Windows</div> -->
    </td>
    <td>
      <div class="command">
        <a href="https://github.com/simonmichael/hledger/releases/tag/1.28#mac-x64">hledger-mac-x64.zip</a>
      </div>
      <div class="notes"></div>
    </td>
  </tr>

  <tr> <!-- HOMEBREW -->
    <td>
      <div class="badges">
        <a href="https://formulae.brew.sh/formula/hledger"><img alt="Homebrew" src="https://repology.org/badge/version-for-repo/homebrew/hledger.svg" /></a>
      </div>
      <!-- <div class="notes">Linux, Mac, WSL</div> -->
    </td>
    <td>
      <div class="command">brew install hledger</div>
    </td>
  </tr>

</table>

### Windows

<table class="windows downloads">

  <tr> <!-- CI BINARIES -->
    <td>
      <div class="badges">
        <a><img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-1.28-brightgreen.svg" /></a><br>
      </div>
      <!-- <div class="notes">Linux, Mac, Windows</div> -->
    </td>
    <td>
      <div class="command">
        <a href="https://github.com/simonmichael/hledger/releases/tag/1.28#windows-x64">hledger-windows-x64.zip</a>
        <!-- <span style="font-weight:normal; font-style:italic; font-size:small;">
          (Also runs on other platforms with <a href="https://www.winehq.org">Wine</a>)
        </span> -->
      </div>
      <div class="notes"></div>
    </td>
  </tr>

  <tr valign="top"> <!-- SCOOP -->
    <td>
      <div class="badges">
        <a href="https://github.com/ScoopInstaller/Main/blob/master/bucket/hledger.json">
          <img alt="Scoop package" src="https://repology.org/badge/version-for-repo/scoop/hledger.svg" />
        </a>
      </div>
    </td>
    <td style="padding-top:10px;">
      <div class="command" style="margin-bottom:4px;">
        scoop install hledger
      </div>
      <div class="notes">
      <!--   <span class="warnings"> -->
      <!--   </span> -->
      </div>
    </td>
  </tr>

  <tr valign="top"> <!-- CHOCOLATEY -->
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
  
</table>

### GNU/Linux

<table class="linux downloads">

  <tr> <!-- CI BINARIES -->
    <td>
      <div class="badges">
        <a><img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-1.28-brightgreen.svg" /></a><br>
      </div>
      <!-- <div class="notes">Linux, Mac, Windows</div> -->
    </td>
    <td>
      <div class="command">
        <a href="https://github.com/simonmichael/hledger/releases/tag/1.28#linux-x64">hledger-linux-x64.zip</a>
      </div>
      <div class="notes"></div>
    </td>
  </tr>

  <tr> <!-- GENTOO -->
    <td>
      <div class="badges">
        <a href="https://gentoo.zugaina.org/Search?search=hledger"><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo_package-1.26.1-red.svg" /></a>
      </div>
    </td>
    <td>
      <div class="command">sudo layman -a haskell &amp;&amp; sudo emerge hledger hledger-ui hledger-web</div>
    </td>
  </tr>

  <tr> <!-- ARCH -->
    <td>
      <div class="badges">
        <a href="https://archlinux.org/packages/community/x86_64/hledger/"><img alt="Arch" src="https://repology.org/badge/version-for-repo/arch/hledger.svg" /></a>
      </div>
    </td>
    <td>
      <div class="command">pacman -Sy hledger hledger-ui hledger-web</div>
    </td>
  </tr>

  <tr> <!-- ALPINE -->
    <td>
      <div class="badges">
        <a href="https://pkgs.alpinelinux.org/packages?name=hledger*&branch=edge"><img alt="Alpine edge" src="https://repology.org/badge/version-for-repo/alpine_edge/hledger.svg" /></a>
      </div>
    </td>
    <td>
      <div class="command">
          doas apk add hledger hledger-ui hledger-web
      </div>
      <div class="notes">
          <a href="https://wiki.alpinelinux.org/wiki/Repositories#Enabling_the_community_repository">enabling the community repository</a>
      </div>
    </td>
  </tr>

  <tr> <!-- VOID -->
    <td>
      <div class="badges">
        <a href="https://voidlinux.org/packages/?q=hledger"><img src="https://repology.org/badge/version-for-repo/void_x86_64/hledger.svg" alt="Void Linux x86_64" /></a>
      </div>
    </td>
    <td>
      <div class="command">xbps-install -S hledger hledger-ui hledger-web</div>
    </td>
  </tr>

  <tr> <!-- FEDORA -->
    <td>
      <div class="badges">
        <a ><img src="https://img.shields.io/badge/Fedora_38_package-1.21-red.svg" /></a><br>
        <a ><img src="https://img.shields.io/badge/Fedora_37_package-1.21-red.svg" /></a><br>
        <a ><img src="https://repology.org/badge/version-for-repo/fedora_36/hledger.svg" /></a><br>
        <a ><img src="https://repology.org/badge/version-for-repo/fedora_35/hledger.svg" /></a><br>
        <a ><img src="https://repology.org/badge/version-for-repo/fedora_34/hledger.svg" /></a><br>
        <a href="https://src.fedoraproject.org/rpms/hledger">more..</a>
      </div>
    </td>
    <td>
      <div class="command">sudo dnf install hledger</div>
    </td>
  </tr>

  <tr> <!-- DEBIAN -->
    <td>
      <div class="badges">
        <a href="https://packages.debian.org/unstable/hledger"><img src="https://repology.org/badge/version-for-repo/debian_unstable/hledger.svg" alt="Debian unstable" /></a><br>
        <a href="https://packages.debian.org/stable/hledger"><img src="https://img.shields.io/badge/Debian_stable_package-1.18.1-red.svg" alt="Debian stable" /></a><br>
        <a href="https://packages.debian.org/oldstable/hledger"><img src="https://img.shields.io/badge/Debian_oldstable_package-1.10-red.svg" alt="Debian oldstable" /></a><br>
        <a href="https://packages.debian.org/oldstable/hledger"><img src="https://img.shields.io/badge/Debian_oldoldstable_package-1.0.1-red.svg" alt="Debian oldoldstable" /></a><br>
        <a href="https://packages.debian.org/search?searchon=names&amp;keywords=hledger">more..</a>
      </div>
    </td>
    <td>
      <div class="command">sudo apt install hledger hledger-ui hledger-web</div>
    </td>
  </tr>

  <tr> <!-- UBUNTU -->
    <td>
      <div class="badges">
        <a href="https://packages.ubuntu.com/jammy/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_22_04/hledger.svg" /></a><br>
        <!-- <a href="https://packages.ubuntu.com/impish/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_21_10/hledger.svg" /></a><br> -->
        <!-- <a href="https://packages.ubuntu.com/hirsute/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_21_04/hledger.svg" /></a><br> -->
        <!-- <a href="https://packages.ubuntu.com/groovy/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_10/hledger.svg" /></a><br> badge broken -->
        <a href="https://packages.ubuntu.com/focal/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_20_04/hledger.svg" /></a><br>
        <a href="https://packages.ubuntu.com/bionic/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_18_04/hledger.svg" /></a><br>
        <a href="https://packages.ubuntu.com/xenial/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_16_04/hledger.svg" /></a><br>
        <a href="https://packages.ubuntu.com/search?suite=all&amp;searchon=names&amp;keywords=hledger">more..</a>
      </div>
    </td>
    <td>
      <div class="command">sudo apt install hledger hledger-ui hledger-web</div>
    </td>
  </tr>

</table>

### Raspberry Pi

<table class="pi downloads">

  <tr valign="top"> <!-- CI BINARIES -->
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

  <tr valign="top"> <!-- THIRD PARTY -->
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

</table>

### BSD

<table class="bsd downloads">

  <tr> <!-- OPENBSD -->
    <td>
      <div class="badges">
        <a href="https://openports.se/productivity/hledger"><img src="https://repology.org/badge/version-for-repo/openbsd/hledger.svg" alt="openbsd ports" /></a><br>
      </div>
    </td>
    <td>
      <div class="command">pkg_add hledger</div>
    </td>
  </tr>

  <tr> <!-- NETBSD -->
    <td>
      <div class="badges">
        <a href="https://cdn.netbsd.org/pub/pkgsrc/current/pkgsrc/finance/hledger/index.html"><img src="https://img.shields.io/badge/NetBSD-1.24.1-red.svg" alt="netbsd package" /></a><br>
      </div>
    </td>
    <td>
      <div class="command">pkg_add hledger</div>
      <div class="notes">
      </div>
    </td>
  </tr>

  <tr> <!-- FREEBSD -->
    <td>
      <div class="badges">
        <a href="https://www.freshports.org/search.php?query=hledger"><img src="https://repology.org/badge/version-for-repo/freebsd/hledger.svg" alt="freebsd ports" /></a><br>
      </div>
    </td>
    <td>
      <div class="command">pkg install hs-hledger hs-hledger-ui hs-hledger-web</div>
      <div class="notes">
      </div>
    </td>
  </tr>

</table>

### Other

<table class="multiplatform downloads">

  <tr> <!-- DOCKER -->
    <td>
      <div class="badges">
        <a href="https://hub.docker.com/r/dastapov/hledger"><img alt="Docker" src="https://img.shields.io/badge/Docker_image-1.28-brightgreen.svg" /></a><br>
        <a href="https://hub.docker.com/search?q=hledger&amp;type=image&amp;sort=updated_at&amp;order=desc">more..</a>
      </div>
      <!-- <div class="notes">Linux, Mac, Windows</div> -->
    </td>
    <td>
      <div class="command">docker pull dastapov/hledger</div>
    </td>
  </tr>

  <tr> <!-- NIX -->
    <td>
      <div class="badges">
        <a href="https://github.com/search?l=&o=desc&q=%22automatic+Haskell+package+set+update%22+repo%3ANixOS%2Fnixpkgs+filename%3Ahaskell-packages.nix&s=committer-date&type=Commits"><img alt="Nix" src="https://img.shields.io/badge/Nix_package-1.26-red.svg" /></a>
      </div>
      <!-- <div class="notes">Linux, Mac</div> -->
    </td>
    <td>
      <div class="command">
          nix-env -f https://github.com/NixOS/nixpkgs/archive/86378514.tar.gz -iA hledger_1_26 hledger-ui_1_26 hledger-web_1_26
      </div>
      <div class="notes">
          Install command untested, success/failure reports welcome.<br>
          Nix binaries may not yet be fully cached for your platform, try with --dry-run to estimate how much building will be required.<br>
          On Linux, note <span class="warnings"><a href="https://github.com/simonmichael/hledger/issues/1030">#1030</a>, 
          <a href="https://github.com/simonmichael/hledger/issues/1033">#1033</a>.
      </div>
    </td>
  </tr>

  <tr> <!-- SANDSTORM -->
    <td>
      <div class="badges">
          <a href="https://apps.sandstorm.io/search?term=hledger"><img alt="Sandstorm" src="https://img.shields.io/badge/Sandstorm_app-1.9.2-red.svg" /></a>
      </div>
    </td>
    <td>
      <div class="command"><a href="https://apps.sandstorm.io/app/8x12h6p0x0nrzk73hfq6zh2jxtgyzzcty7qsatkg7jfg2mzw5n90">HLedger Web app</a></div>
      <div class="notes">
        <!-- <span class=warnings> -->
        <!--   [features needed](https://github.com/simonmichael/hledger/issues/425) -->
        <!-- </span> -->
      </div>
    </td>
  </tr>

</table>

### Preview releases

<table class="pi downloads">

  <tr> <!-- PREVIEWS -->
    <td>
      <div class="badges">
        <img alt="hledger CI binaries" src="https://img.shields.io/badge/hledger_CI_binaries-Preview-green.svg" />
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

</table>


## Build the current release

<img alt="Release source" src="https://img.shields.io/badge/Release_source-1.28-brightgreen.svg" />

1. Check [build requirements](#build-requirements)
2. Use one of the [build methods](#build-methods)

### Build requirements

#### Hardware

- A machine where the Haskell build tools are available.
- 4G of RAM is [recommended](#more-build-tips).
- 2G of free disk space will be needed if this is your first Haskell build.

#### GHC, stack, cabal

These are the Haskell build tools.
If you choose the "Build with hledger-install" method below, they will be installed automatically.
If you choose the "Build with stack" method, you will need to have [stack] installed.
If you choose the "Build with cabal" method, you will need to have [cabal] and [GHC] installed.

You can probably install these tools with your local packaging system.
They need not be the latest versions (but later versions are better):
- GHC should be >=8.8.
  On Arch GNU/Linux, the packaged GHC is non-standard and may be troublesome.
- cabal (ie cabal-install) should be >=3.2.
- stack should be >=2.7. 
  You can often upgrade an existing stack installation quickly with `stack upgrade`.
  On Windows, prefer the 64-bit version of stack.

Or, you can install them with [ghcup](https://haskell.org/ghcup).

If you don't have any preference, I recommend this setup, 
which is the most reliable and platform-independent as of 2022:

1. Install ghcup
2. Install a recent version of ghc and stack
    <div class="builder-command">
      ghcup install ghc <br>
      ghcup install stack
    </div>
3. Configure stack to use ghcup's GHCs, saving disk space:
    ```yaml
    # add to ~/.stack/config.yaml:
    system-ghc: true
    install-ghc: false
    ```

#### C libraries

On unix systems, you may need to install additional C libraries 
to avoid errors like "*cannot find -ltinfo*" when building hledger.
Install them with a command like the below:

<table>
  <tr>
    <td width="1%" style="white-space:nowrap;"><div class="distro">Debian, Ubuntu & co.:</div></td>
    <td><div class="command" style="margin:0;"> sudo apt install libgmp-dev libtinfo-dev zlib1g-dev</div></td>
  </tr>

  <tr>
    <td><div class="distro">Fedora, RHEL:</div></td>
    <td><div class="command"> sudo dnf install gmp-devel ncurses-devel zlib-devel </div></td>
  </tr>
</table>

(Please [send updates](#footer) for this list.)

#### UTF-8 locale

On unix systems, when building hledger the `LANG` environment variable
must be set to a UTF-8-aware locale. See [Check your locale](#check-your-locale).

#### Known build issues

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

#### More build tips

- Building the hledger tools and possibly all their dependencies could take anywhere from a minute to an hour.

- On machines with less than 4G of RAM, the build may use swap space and 
  take much longer (overnight), or die part-way through. 
  In such low memory situations, try adding `-j1` to the stack/cabal install command, 
  and retry a few times, or [ask](support.html) for more tips.

- You could build just hledger CLI to use less time and space, 
  by omitting hledger-ui and hledger-web from the commands below.

- It's ok to kill a build and rerun the command later; you won't lose progress.

- You can add `--dry-run` to the stack/cabal/nix install commands
  to see how much building remains.

- If you have previously installed the hledger tools, 
  they will usually be overwritten by the new version.
  If you have them installed in multiple places in your PATH, 
  you may see a warning, reminding you to remove or rename the old executables.

### Build methods

Use any of the following methods:

#### Build with hledger-install

The [hledger-install.sh][hledger-install] script builds the current release of the hledger tools, 
plus some [add-on tools], in a relatively reliable way,
requiring [bash] but not any Haskell build tools.
It uses stack or cabal if you have them (installing stack in ~/.local/bin otherwise), 
and installs the hledger tools in ~/.local/bin or ~/.cabal/bin respectively.
This can be a good choice if you are new to Haskell.

<div class="builder-command">
  curl -O https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh <br>
  less hledger-install.sh <em style="margin-left:1em; font-weight:normal;"># <- good security practice: inspect downloaded scripts before running</em><br>
  bash hledger-install.sh
</div>

#### Build with stack

If you have stack installed, you can run it to install the main hledger tools in ~/.local/bin:

<div class="builder-command">
  stack update <br>
  stack install --resolver=lts-19 hledger-lib-1.28 hledger-1.28 hledger-ui-1.28 hledger-web-1.28 --silent
</div>

On Windows, omit hledger-ui from this command (unless you are in [WSL]).

#### Build with cabal

If you have GHC and cabal, you can run cabal to install the main hledger tools in ~/.cabal/bin:

<div class="builder-command">
  cabal update <br>
  cabal install alex happy<br>
  cabal install hledger-1.28 hledger-ui-1.28 hledger-web-1.28
</div>

On Windows, omit hledger-ui from this command (unless you are in [WSL]).

#### Build with nix

If you have [nix], you can use nix-env to build hledger from source 
(but we try to provide a [nix command](#other) that installs already-cached binaries, see above).

#### Build on Android

Here's <a href="https://libera.ems.host/_matrix/media/r0/download/libera.chat/51835530d2b9eed094096d8a2c79e03dda2c35fb">how to build hledger on Android with Termux</a> 
(if your phone has plenty of memory).


## Build the development version

<img alt="Latest source" src="https://img.shields.io/badge/Latest_source-master-green.svg" />

If you want the very [latest improvements](https://github.com/simonmichael/hledger/commits/master),
our master branch on github is suitable for daily use.

1. Check [build requirements](#build-requirements) above

2. Get the source with [git](https://en.wikipedia.org/wiki/Git) and enter the source directory:
    <div class="builder-command">
    git clone https://github.com/simonmichael/hledger <br>
    cd hledger
    </div>

3. Build and install executables (to ~/.local/bin) with [stack]:

    <div class="builder-command">
    stack update<br>
    stack install
    </div>

    or (to ~/.cabal/bin) with [cabal]:

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

## Run requirements

After installing whether from binaries or from source, 

by downloading binaries or by building from source, 
please check that the [run requirements](#run-requirements) (PATH and locale) are satisfied.

 by any of the methods above, run the hledger tools
and verify that their versions are what you just installed
(and not older versions from a previous install). Eg:

<div class="command">
$ hledger --version <br>
hledger 1.28-g6e130a4b6-20221201, mac-aarch64
<br>
<br>
$ hledger-ui --version <br>
hledger-ui 1.28-g6e130a4b6-20221201, mac-aarch64
<br>
<br>
$ hledger web --version <br>
hledger-web 1.28-g6e130a4b6-20221201, mac-aarch64
<br>
</div>

If you like, you can also run the unit tests:

<div class="command">
$ hledger test <br>
... <br>
All 217 tests passed (0.10s)
</div>

or the more extensive functional tests, if you are in hledger's source directory:

<div class="command">
$ make functest <br>
... <br>
 Total   934 ...<br>
functest PASSED
</div>

If things are not yet working, then:

### Check your PATH

After building/installing, you may see a message about where the executables were installed.
Eg:

- with stack: `$HOME/.local/bin` (on Windows, `%APPDATA%\local\bin`)
- with cabal: `$HOME/.cabal/bin` (on Windows, `%APPDATA%\cabal\bin`)
- with nix:   `$HOME/.nix-profile/bin`

Make sure that this install directory is included in your shell's `$PATH`
(preferably near the start, to preempt any old hledger binaries you might have lying around).
How to configure this depends on your platform and shell.
Eg if you are using bash, this will show $PATH:

<div class="command">
  echo $PATH
</div>

and this will add the stack and cabal install dirs to it permanently:

<div class="command">
  echo "export PATH=~/.local/bin:~/.cabal/bin:$PATH" >> ~/.bashrc <br>
  source ~/.bashrc
</div>

Here's [how to set environment variables on Windows](https://www.devdungeon.com/content/set-environment-variables-windows).

<a name="locale"></a> <!-- required permalink, used in error messages -->

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

If you see similar problems on Microsoft Windows, 
perhaps [this doc](https://techtrix.co/how-do-i-change-the-default-encoding-in-windows-10/#How_do_I_change_my_Windows_locale)
can help with configuring it.

With Nix or GUIX, the procedures are [different](https://github.com/simonmichael/hledger/issues/1033#issuecomment-1062506027).

## Next steps

Nicely done! Now see **[Getting started](start.html)**,
or come to the **[#hledger chat](support.html)**
where we'll gladly share tips or receive your feedback.

<br>


[ghc]:             https://www.haskell.org/ghc
[bash]:            https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29
[make]:            https://www.gnu.org/software/make/
[stack]:           https://www.fpcomplete.com/haskell/get-started
[cabal]:           https://www.haskell.org/cabal
[hledger-install]: https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh
[add-on tools]:    hledger.html#addons
[WSL]:             https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux
[nix]:             https://nixos.org
