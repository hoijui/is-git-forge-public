<!--
SPDX-FileCopyrightText: 2023 Robin Vobruba <hoijui.quaero@gmail.com>
SPDX-License-Identifier: CC0-1.0
-->

# is-git-forge-public

[![License: AGPL-3.0-or-later](
    https://img.shields.io/badge/License-AGPL%203.0+-blue.svg)](
    https://www.gnu.org/licenses/agpl-3.0.html)
[![REUSE status](
    https://api.reuse.software/badge/github.com/hoijui/is-git-forge-public)](
    https://api.reuse.software/info/github.com/hoijui/is-git-forge-public)

[![In cooperation with FabCity Hamburg](
    https://custom-icon-badges.demolab.com/badge/-FCHH-dddddd.svg?logo=fc_logo)](
    https://fabcity.hamburg)
[![In cooperation with Open Source Ecology Germany](
    https://custom-icon-badges.demolab.com/badge/-OSEG-555555.svg?logo=oseg_logo)](
    https://opensourceecology.de)

## What is this

Given the URL to a git repository on a known forge site -
or at least using a known forge software -
returns whether the project is public or not.
Non-public could be private, internal, unlisted, bad URL,
non repository URL, or possibly something else.

It does that by downloading the HTML of the Web-UI of the repository,
from which it then extracts the necessary info.
This info is then presenting it in a uniform way,
independent of the forge site, the software it is running,
and the actual findings of the evaluation.

Why this way, instead of using API(s)? \
This is much simpler, using a uniform technique for any URL given.
A simple script, easily extendable to other sites,
requiring no tokens or anything else for authentication.
The downside of course, is that it might be less robust over time,
and that it will likely not fail-fast.

We try to mitigate that downside,
by running unit tests once a week.

Supported sites/forge software:

* [GitHub](https://github.com)
* [GitLab](https://gitlab.com)
* [Gitea](https://gitea.io/)
* [SourceHut](https://sourcehut.org/)

## Usage

```shell-sh
$ is-git-forge-public --help

Usage:
  is-git-forge-public [OPTION...] <REPO-WEB-URL>
Options:
  -h, --help              Print this usage help and exits.
  -f, --fail              Return failure if download returned status 404.
                          While that might indicate a bad URL,
                          it is also the case when trying to access
                          a private repo without authentication.
  -c, --check [FORGE]     Instead of using the checks for all forges,
                          use only a specific one.
                          Supported: 'github', 'gitlab', 'gitea', 'sourcehut'
Examples:
  is-git-forge-public --help
  is-git-forge-public "https://github.com/user/repo"
  is-git-forge-public --check github "https://github.com/user/repo"
```

## Examples

Public repo:

```shell-sh
$ is-git-forge-public "https://github.com/hoijui/MeditationBench"
true
public
```

Private repo:

```shell-sh
$ is-git-forge-public "https://github.com/hoijui/tst-private"
WARN: Failed fetching the HTML content of URL:
WARN: 'https://github.com/hoijui/tst-private'
WARN: This could be due to:
WARN: - private repo URL
WARN: - not a repo URL
WARN: - no internet access
WARN: - authentication required
WARN: - mistyped repo URL
WARN: - ...
false
unknown
```

In this second example,
all the `WARN: ...` lines go to `stderr`.
This is where all logging goes
(in alignment with [CLI best-practice](https://clig.dev/#the-basics)),
so that on `stdout`, we only ever get these two lines of output:

| Line Number | Name | Machine-Readable | Type | Valid Values (regex) | Example |
| - | ----- | -- | --- | --- | --- |
| 1 | Is Public? | yes | boolean | `true|false` | `false` |
| 2 | State | no | string | `.*` | `unknown` |

In most cases, this script is probably going to be used by other software,
in which case, you are probably only interested in the first line of `stdout`,
which in BASH you might use like this:

```bash
repo_url="https://github.com/hoijui/MeditationBench"
#repo_url="https://github.com/hoijui/tst-private"

is_public="$(is-git-forge-public "$repo_url" 2> /dev/null | head -n 1)"

if $is-git-forge-public
then
    echo "Git repo '$repo_url' is public!"
else
    echo "Git repo '$repo_url' is *not* public!"
fi
```
