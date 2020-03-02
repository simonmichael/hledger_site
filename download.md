# Download/Install

<style>
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
  border-top:thin solid #ddd; 
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

Here are some ways to install hledger.
[Binary packages](#binary-packages) will install quickly,
or you can [run our install script, or build with stack/cabal](#building-from-source).
Please do [report](index.html#help-feedback) any trouble.
The current release is **1.17** (look for the green badges!)
Here are the [release notes](release-notes) describing the changes in each version.

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
          <a href="https://hydra.nixos.org/search?query=hledger"><img alt="Nix" src="https://img.shields.io/badge/Nix_package-1.16-red.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">
            nix-env -f https://github.com/NixOS/nixpkgs/archive/6da889.tar.gz -iA hledger hledger-web hledger-ui
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
          <a href="https://hub.docker.com/r/dastapov/hledger"><img alt="Docker" src="https://img.shields.io/badge/Docker_image-1.16.2-red.svg" /></a>
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
        <div class="distro">Appveyor builds</div>
        <div class="badges">
          <a href="https://ci.appveyor.com/project/simonmichael/hledger/builds/29292447/artifacts"><img alt="Windows release"" src="https://img.shields.io/badge/Windows_zip-1.16.1-red.svg" /></a>
          <a href="https://ci.appveyor.com/project/simonmichael/hledger/build/artifacts"><img alt="Windows master" src="https://img.shields.io/badge/Windows_zip-master-brightgreen.svg" /></a>
      </td>
      <td>
        <div class="command" style="margin-bottom:4px;"><a href="https://ci.appveyor.com/api/buildjobs/x91mc06wd37m0coa/artifacts/hledger.zip">hledger.zip (latest release)</a></div>
        <div class="notes"></div>
        <div class="command"><a href="https://ci.appveyor.com/api/projects/simonmichael/hledger/artifacts/hledger.zip?branch=master">hledger.zip (unreleased master)</a></div>
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
          <!-- <a href="https://www.archlinux.org/packages/?sort=&amp;q=hledger"><img alt="Arch" src="https://repology.org/badge/version-for-repo/arch/hledger.svg" /></a> -->
          <a href="https://www.archlinux.org/packages/?sort=&amp;q=hledger"><img alt="Arch" src="https://img.shields.io/badge/Arch_package-1.16-red.svg" /></a>
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
          <a href="https://gentoo.zugaina.org/Search?search=hledger"><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo_package-1.16.2-red.svg" /></a>
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
          <a href="https://packages.debian.org/testing/hledger"><img src="https://repology.org/badge/version-for-repo/debian_testing/hledger.svg" alt="Debian Testing" /></a>
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
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_Rawhide_package-1.12.1-red.svg" alt="Fedora Rawhide" /></a>
          <a href="https://apps.fedoraproject.org/packages/hledger/"><img src="https://img.shields.io/badge/Fedora_32_package-1.12.1-red.svg" alt="Fedora 32" /></a>
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
          <a href="https://packages.ubuntu.com/disco/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_19_04/hledger.svg" alt="Ubuntu 19.04" /></a>
          <a href="https://packages.ubuntu.com/cosmic/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_18_10/hledger.svg" alt="Ubuntu 18.10" /></a>
          <a href="https://packages.ubuntu.com/bionic/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_18_04/hledger.svg" alt="Ubuntu 18.04" /></a>
          <a href="https://packages.ubuntu.com/xenial/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_16_04/hledger.svg" alt="Ubuntu 16.04" /></a>
          <a href="https://packages.ubuntu.com/trusty/hledger"><img src="https://repology.org/badge/version-for-repo/ubuntu_14_04/hledger.svg" alt="Ubuntu 14.04" /></a>
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
        <div class="notes"></div>
      </td>
    </tr>
    <tr>
      <td colspan=2><div class="platform">Cloud</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://sandstorm.io">Sandstorm</a></div>
        <div class="notes"></div>
        <div class="badges"><a href="https://apps.sandstorm.io/search?term=hledger"><img alt="Sandstorm" src="https://img.shields.io/badge/Sandstorm_app-1.9.1-red.svg" /></a></div>
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

## Building from source

You can build hledger wherever the Glasgow Haskell Compiler is supported.
This can take a while, but it's normall a reliable process.
Use one of the tools below to build the current hledger release.
On Windows, hledger-ui is not available and should be omitted from the commands below (except in WSL).

<div class="builder">
  <a href="https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh">hledger-install.sh</a>
</div>
<div class="notes">Linux, Mac, WSL</div>
<div class="badges">
  <img alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17-brightgreen.svg" />
</div>
<div class="builder-text">
  The hledger-install script is a robust install method that requires only
  <a href=https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29">bash</a>. 
  It runs stack or cabal for you, installing stack if you have neither, 
  and installs all the main hledger tools and some <a href="hledger.html#add-on-commands">add‑on commands</a>,
  in ~/.local/bin or ~/.cabal/bin.
</div>
<div class="builder-command">
  curl -sO https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh <br>
  less hledger-install.sh <em style="margin-left:1em; font-weight:normal;"># good practice: inspect scripts before running</em><br>
  bash hledger-install.sh
</div>

<div class="builder">
  <a href="https://haskell.fpcomplete.com/get-started">stack</a>
</div>
<div class="notes">Linux, Mac, Windows</div>
<div class="badges">
  <img alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17-brightgreen.svg" />
</div>
<div class="builder-text">
The latest version of stack (2.1.3) is likely to work best, so we recommend it.
If you have an older stack installed, you can usually upgrade it quickly with <code>stack upgrade</code>.
Versions older than 1.9 will definitely not work.
On Windows, the 64-bit version of stack is recommended.
</div>
<div class="builder-command">
  stack update <br>
  stack install --resolver=lts hledger-lib-1.17 hledger-1.17 hledger-ui-1.17 hledger-web-1.17 --silent
</div>

<div class="builder">
  <a href="https://www.haskell.org/cabal">cabal</a>
</div>
<div class="notes">Linux, Mac, Windows</div>
<div class="badges">
  <img alt="installs" src="https://img.shields.io/badge/installs_hledger-1.17-brightgreen.svg" />
</div>
<div class="builder-text">
</div>
<div class="builder-command">
  cabal v2-update <br>
  cabal v2-install hledger-1.17 hledger-web-1.17 hledger-ui-1.17
</div>

### Build tips

- If you haven't built any Haskell code before, know that building
  hledger the first time could take 1-2G of disk, 1-2G of free memory,
  and perhaps up to an hour (though usually much less).
  Subsequent builds will be much faster.

- It's fine to kill a build and restart it later, you won't lose
  progress.

- With stack or cabal (or nix, etc.) you can add `--dry-run` to the
  install command to see how much building is still to do.

- You may be able to save some time/memory/disk space by omitting the
  [hledger-web](http://hackage.haskell.org/package/hledger-web) and
  [hledger-ui](http://hackage.haskell.org/package/hledger-ui) packages
  from the commands above.

- When certain required C libraries, like `terminfo`, are not
  installed, the build will fail at the end with a link error such as
  `/bin/ld.gold: error: cannot find -ltinfo`. To solve this, use your
  system's package manager to install the appropriate system package,
  and install hledger again. Here are some of those C packages by
  platform; you can also do a web search for the link error message.
  Please [report](/index.html#help-feedback) any omissions:

  <table>
    <tr>
      <td><div class="distro">Debian, Ubuntu:</div></td>
      <td><div class="command"> sudo apt install libtinfo-dev </div></td>
    </tr>
    <tr>
      <td><div class="distro">Fedora, RHEL:</div></td>
      <td><div class="command"> sudo dnf install gmp-devel ncurses-devel </div></td>
    </tr>
  </table>

- Here are some known build issues/workarounds on certain platforms:

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
    <a href="https://github.com/simonmichael/hledger/issues/1030">nix: nix install on linux can fail with “cloning builder process: Operation not permitted”</a><br>
    <a href="https://github.com/simonmichael/hledger/issues/1033">nix: on Linux, nix-installed hledger won’t handle non-ascii data</a><br>
  </blockquote>

<a name="c"></a>

### Building the development version

The master branch in hledger's github repo is suitable for daily use,
and includes the [latest improvements](https://github.com/simonmichael/hledger/commits/master).
You'll need [git](https://en.wikipedia.org/wiki/Git) and 
[stack](https://haskell.fpcomplete.com/get-started) or [cabal](https://www.haskell.org/cabal/).
This will build and install all of the main hledger tools using stack:

<div class="builder-command">
git clone https://github.com/simonmichael/hledger <br>
cd hledger <br>
stack install
</div>

cabal users may find the `cabal-install.sh` or `cabal.project` files useful.

Development builds of hledger show a `.99` suffix in their `--version`
output, meaning "dev". So 1.15.99 means "1.16-dev", the in-development
version of 1.16.

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
hledger 1.17 <br>
$ hledger-ui --version <br>
hledger-ui 1.17 <br>
$ hledger web --version <br>
hledger-web 1.17 <br>
</div>

And you could see the unit tests pass (just for fun):

<div class="command">
$ hledger test <br>
... <br>
All 198 tests passed (4.30s)
</div>

<br>

Nicely done! Next, see the Getting Started docs in the sidebar, such
as the **[Basics tutorial](basics-tutorial.html)**,
or come to the **[IRC channel/Matrix room](index.html#help-feedback)** 
where we'll help you out, or gladly hear your feedback.

<br>
