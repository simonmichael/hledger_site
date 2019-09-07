# Download

<style>
table#downloads > tbody > tr { 
  border-bottom:thin solid #ddd; 
}
table#downloads > tbody > tr > td { 
  padding-top:0.5em;
  padding-bottom:0.5em;
}
table#downloads td:first-child {
  padding-right:1em;
}
/*
table { 
  border:thin solid black; 
  max-width:50%;
}
td { 
  overflow-x:scroll;
}
*/
div.platform {
  margin-top:1em;
  font-size:big;
  font-weight:bold;
}
div.distro {
}
div.command {
  margin-top:1em;
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

Here are some ways to install hledger - choose one that suits you.
And please do [report](index.html#helpfeedback) any trouble.
The current hledger release is **1.15.2** ([release notes](release-notes)).

## Binary packages

<div>These prebuilt binaries will install quickly:</div><!-- reduce whitespace -->

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
          <a href="https://hydra.nixos.org/search?query=hledger"><img alt="Nix" src="https://img.shields.io/badge/Nix_package-1.15.2-brightgreen.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">nix-env -f https://github.com/NixOS/nixpkgs/archive/4179ba0.tar.gz -iA hledger hledger-web hledger-ui</div>
        <div class="notes">
            On Linux, note <span class="warnings"><a href="https://github.com/simonmichael/hledger/issues/1030">#1030</a>, 
            <a href="https://github.com/simonmichael/hledger/issues/1033">#1033</a>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://www.docker.com/products/docker-desktop">Docker</a></div>
        <div class="notes">Linux, Mac, Windows</div>
        <div class="badges">
          <a href="https://hub.docker.com/r/dastapov/hledger"><img alt="Docker" src="https://img.shields.io/badge/Docker_image-1.15.2-brightgreen.svg" /></a>
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
          <a href="https://formulae.brew.sh/formula/hledger"><img alt="Homebrew" src="https://img.shields.io/badge/Homebrew-1.15.1-red.svg" /></a>
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
        <div class="command"></div>
        <div class="notes">Install Wine and use the Windows binary</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="distro"><a href="https://sandstorm.io">Sandstorm</a></div>
        <div class="notes">Cloud-hosted</div>
        <div class="badges"><img alt="Sandstorm" src="https://img.shields.io/badge/Sandstorm_app-1.9.1-red.svg" /></div>
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
    <tr>
      <td colspan=2><div class="platform">Windows</div></td>
    </tr>
    <tr>
      <td>
        <div class="distro">Appveyor builds</div>
        <div class="badges">
          <a href="https://ci.appveyor.com/project/simonmichael/hledger/builds/22955930/artifacts"><img alt="Windows release"" src="https://img.shields.io/badge/Windows_zip-1.15.2-brightgreen.svg" /></a>
          <a href="https://ci.appveyor.com/project/simonmichael/hledger/build/artifacts"><img alt="Windows nightly" src="https://img.shields.io/badge/Windows_zip-nightly-brightgreen.svg" /></a>
      </td>
      <td>
        <div class="command"><a href="https://ci.appveyor.com/api/buildjobs/hm882buev9bjjd6i/artifacts/hledger.zip">hledger.zip (release)</a></div>
        <div class="notes"></div>
        <div class="command"><a href="https://ci.appveyor.com/api/projects/simonmichael/hledger/artifacts/hledger.zip?branch=master">hledger.zip (dev)</a></div>
        <div class="notes">
          may fix Windows 7
          <span class="warnings">
            <a href="https://github.com/simonmichael/hledger/issues/1039">#1039</a>
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
          <a href="https://gentoo.zugaina.org/Search?search=hledger"><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo_package-1.14.2-red.svg" /></a>
        </div>
      </td>
      <td>
        <div class="command">sudo layman -a haskell &amp;&amp; sudo emerge hledger hledger-ui hledger-web</div>
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
        <div class="distro">Void</div>
        <div class="badges">
          <a href="https://voidlinux.org/packages/?q=hledger"><img src="https://repology.org/badge/version-for-repo/void_x86_64/hledger.svg" alt="Void Linux x86_64" /></a>
        </div>
      </td>
      <td>
        <div class="command">xbps-install -S hledger hledger-ui hledger-web</div>
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
    <!-- <tr> -->
    <!--   <td colspan=2><div class="platform">Other</div></td> -->
    <!-- </tr> -->
  </tbody>
</table>

<!-- <br><br><small>*Or: (nix-channel --update may be needed. CI [build][nix unstable linux builds] [issues][nix unstable mac builds] may cause failure/large downloads; check those links/try with --dry-run first)*</small> <br><span style="font-size:small;">**`nix-env -i hledger-1.14.2 hledger-ui-1.14.2 hledger-web-1.14.1`**</span> -->

<a name="b"></a>

## Building from source

You can build hledger wherever the Glasgow Haskell Compiler is supported.
This can take a while, but it's normally a reliable process.
Use one of the methods below to build the current hledger release.
The hledger-install script requires only bash and installs the required tools.
Or, you can install stack or cabal yourself and deal with them directly.

|                                                                    |                                                                                                                                                                                                                                                                                                                                                                         |
|--------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                                    |                                                                                                                                                                                                                                                                                                                                                                         |
| [hledger-install.sh](https://github.com/simonmichael/hledger/blob/master/hledger-install/hledger-install.sh)<br><small>*Linux,&nbsp;Mac,&nbsp;WSL*</small> | <span style="font-size:medium;">**`curl -s https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh -O`**<br>**`less hledger-install.sh`**&nbsp;&nbsp;&nbsp;&nbsp;*# satisfy yourself that the script is safe*<br>**`bash hledger-install.sh`**&nbsp;&nbsp;&nbsp;&nbsp;*# runs stack or cabal, installing stack if needed*</span> |
| [stack](https://haskell.fpcomplete.com/get-started)<br><small>*Linux,&nbsp;Mac,&nbsp;Windows*</small>          | <span style="font-size:medium;">**`stack update && stack install --resolver=lts-14.3 hledger-lib-1.15.2 hledger-1.15.2 hledger-web-1.15 hledger-ui-1.15 --verbosity=error`**</span>                                                                                                                                                                                              |
| [cabal](https://www.haskell.org/cabal)<br><small>*Linux,&nbsp;Mac,&nbsp;Windows*</small>          | <span style="font-size:medium;">**`cabal v2-update && cabal v2-install hledger-1.15.2 hledger-web-1.15 hledger-ui-1.15`**</span>                                                                                                                                                                                                                                    |

On Windows, hledger-ui is not available and should be omitted from the commands above (except, it probably works in WSL).

#### Resource usage

Building Haskell programs typically involves downloading and compiling and
optimising a lot of Haskell libraries. 
If you are doing it for the first time, know that building hledger could take 
1-2G of disk, 1-2G of free memory, and up to an hour (though usually it's much less).
It's fine to kill a build and restart it later;
and your later builds will be much faster.

If needed, you can save time/memory/disk space by omitting the
[hledger-web](http://hackage.haskell.org/package/hledger-web) and
[hledger-ui](http://hackage.haskell.org/package/hledger-ui) packages
from the stack or cabal commands above.
To estimate the build time remaining, add `--dry-run`.

#### Using stack

The latest version of stack (2.1.3 as of 2019-07) will likely work best, so we recommend it.
If you have an older version, you can usually upgrade quickly with `stack upgrade`.
Versions older than 1.7.1 will definitely not work.
On Windows, the 64-bit version of stack is recommended.

<!--
Some other [add-on tools](/hledger.html#third-party-add-ons) like
[hledger-api](http://hackage.haskell.org/package/hledger-api),
[hledger-iadd](http://hackage.haskell.org/package/hledger-iadd),
and [hledger-interest](http://hackage.haskell.org/package/hledger-interest)
can be installed like so:

  **`stack install --resolver=lts-14.1 hledger-api hledger-interest hledger-iadd hledger-interest-1.5.3 hledger-iadd-1.3.9`**
-->

<!-- <a name="b3"></a> -->

<!-- #### cabal -->

#### C libraries may be required

A few C libraries, like terminfo, are required but not installed by the commands above.
When such C libs are missing, the build will fail at the end with a link error 
such as "/bin/ld.gold: error: cannot find -ltinfo".
To solve this, just install the appropriate system package(s) and run the build command again. 

These package names vary by platform. If you don't see your platform below,
do a web search for the link error message (and send updates for this list):

|                 |                                                   |
|-----------------|---------------------------------------------------|
| Debian, Ubuntu: | **`sudo apt install -y libtinfo-dev`**            |
| Fedora, RHEL:   | **`sudo dnf install -y gmp-devel ncurses-devel`** |

<a name="build-issues"></a><a name="windows-build-issues"></a>

#### Platform-specific build issues

Here are some known build issues and workarounds on certain platforms:

<!--
<div class="warnings" style="font-size:medium;">

[nix: nix install on linux can fail with "cloning builder process: Operation not permitted"](https://github.com/simonmichael/hledger/issues/1030)\
[nix: on Linux, nix-installed hledger won't handle non-ascii data](https://github.com/simonmichael/hledger/issues/1033)\
[windows: hledger-web fails to start on Windows 7](https://github.com/simonmichael/hledger/issues/1039)\
[windows: hledger-ui is not available](https://github.com/jtdaugherty/vty/pull/1#issuecomment-297143444)\
[windows: build hangs using GHC 8.6.3](https://github.com/well-typed/generics-sop/issues/93)\
[windows: cross-environment non-ascii display issues](https://github.com/simonmichael/hledger/issues/961#issuecomment-471229644)\
[arch: haskell build advice from Arch wiki](https://wiki.archlinux.org/index.php/Haskell)\
[arch: No information found for ghc-8.4.2](https://github.com/commercialhaskell/stack/issues/3984)\
[freebsd 12: no cabal file found](https://github.com/simonmichael/hledger/issues/709)\
[openbsd 6: exec permission denied](https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html)\
[openbsd: how to get stack](https://github.com/commercialhaskell/stack/issues/2822#issuecomment-318892816)\

</div>
-->
<!-- [arch: some past problems](https://github.com/simonmichael/hledger/issues/668) -->

<p><span class="warnings" style="font-size:medium;"> <a href="https://github.com/simonmichael/hledger/issues/1030">nix: nix install on linux can fail with “cloning builder process: Operation not permitted”</a><br />
<a href="https://github.com/simonmichael/hledger/issues/1033">nix: on Linux, nix-installed hledger won’t handle non-ascii data</a><br />
<a href="https://github.com/simonmichael/hledger/issues/1039">windows: hledger-web fails to start on Windows 7</a><br />
<a href="https://github.com/jtdaugherty/vty/pull/1#issuecomment-297143444">windows: hledger-ui is not available</a><br />
<a href="https://github.com/well-typed/generics-sop/issues/93">windows: build hangs using GHC 8.6.3</a><br />
<a href="https://github.com/simonmichael/hledger/issues/961#issuecomment-471229644">windows: cross-environment non-ascii display issues</a><br />
<a href="https://wiki.archlinux.org/index.php/Haskell">arch: haskell build advice from Arch wiki</a><br />
<a href="https://github.com/commercialhaskell/stack/issues/3984">arch: No information found for ghc-8.4.2</a><br />
<!-- [arch: some past problems](https://github.com/simonmichael/hledger/issues/668) --> <a href="https://github.com/simonmichael/hledger/issues/709">freebsd 12: no cabal file found</a><br />
<a href="https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html">openbsd 6: exec permission denied</a><br />
<a href="https://github.com/commercialhaskell/stack/issues/2822#issuecomment-318892816">openbsd: how to get stack</a><br />
</span></p>

#### Setting $PATH may be required

After building you may see a message about where the executables were installed.
After installation, make sure this install directory is configured in your shell's \$PATH
(preferably near the start of it, in case you have older hledger binaries lying around).
The install directory is:

|                    | on non-Windows systems | on Windows 
|--------------------|------------------------|------------------------------------------
| If stack was used  | `$HOME/.local/bin`     | `%APPDATA%\local\bin` (eg&nbsp;`C:\Users\Joe\AppData\Roaming\local\bin`)
| If cabal was used  | `$HOME/.cabal/bin`     | `%APPDATA%\cabal\bin`

How to configure \$PATH is platform- and shell-specific.
If you are using bash, this should take care of it:

  **`echo "export PATH=~/.local/bin:~/.cabal/bin:$PATH" >> ~/.bashrc && source ~/.bashrc`**

#### Test the installation

After a successful build and install, you should be able to run the
hledger tools (whichever ones you installed) and see the expected versions:

  `$`**`hledger --version`**\
  `hledger 1.15.2`\
  `$`**`hledger-ui --version`**\
  `hledger-ui 1.15`\
  `$`**`hledger web --version`**\
  `hledger-web 1.15`\
  `$`**`hledger iadd --version`**\
  `This is hledger-iadd version 1.3.9`

And you can check that the unit tests pass (just for fun):

  `$`**`hledger test`**\
  `...`\
  `✅  198 tests passed, no failures! 👍 🎉`

<a name="c"></a>

### Building the development version

The master branch in hledger's git repo is stable enough for daily use,
and includes the [latest improvements](https://github.com/simonmichael/hledger/commits/master).
You'll need [git](https://en.wikipedia.org/wiki/Git) and 
[`stack`](http://haskell-lang.org/get-started) or [cabal](https://www.haskell.org/cabal/).
This will build and install all of the main hledger tools using stack:

  **`git clone https://github.com/simonmichael/hledger`**\
  **`cd hledger`**\
  **`stack install`**

cabal users may find the `cabal-install.sh` or `cabal.project` files useful.

The --version output of development builds has a .99 suffix meaning "dev".
So 1.15.99 means "1.16-dev", the in-development version of 1.16.

### Building the development version with docker

You can also build development version in the docker container, which will take care of pulling
all the necessary tools and dependencies:

  **`git clone https://github.com/simonmichael/hledger`**\
  **`cd hledger/docker`**\
  **`./build.sh`**

This will build image tagged `hledger` with just the latest binaries inside.

If you want to keep all the build artifacts and use the resulting image for hledger development, use
`build-dev.sh` instead.
