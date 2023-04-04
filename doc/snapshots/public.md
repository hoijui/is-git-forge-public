<!--
SPDX-FileCopyrightText: 2023 Robin Vobruba <hoijui.quaero@gmail.com>
SPDX-License-Identifier: CC0-1.0
-->

# Public

Relevant scraped HTML sources,
extracted from different forges public WebUI frontends
for a repository URL.
See also the [private version](private.md) of this same data.

This data is the basis on which we orient the code.

## GitHub

```html
<span class="Label Label--secondary v-align-middle mr-1">Public</span>
```

## GitLab

```html
<span class="visibility-icon gl-text-secondary has-tooltip gl-ml-2" data-container="body" title="Public - The project can be accessed without any authentication.">
```

## Gitea

```html
<svg viewBox="0 0 16 16" class="svg octicon-repo" width="32" height="32" aria-hidden="true"><path d="M2 2.5A2.5 2.5 0 0 1 4.5 0h8.75a.75.75 0 0 1 .75.75v12.5a.75.75 0 0 1-.75.75h-2.5a.75.75 0 0 1 0-1.5h1.75v-2h-8a1 1 0 0 0-.714 1.7.75.75 0 1 1-1.072 1.05A2.495 2.495 0 0 1 2 11.5Zm10.5-1h-8a1 1 0 0 0-1 1v6.708A2.486 2.486 0 0 1 4.5 9h8ZM5 12.25a.25.25 0 0 1 .25-.25h3.5a.25.25 0 0 1 .25.25v3.25a.25.25 0 0 1-.4.2l-1.45-1.087a.249.249 0 0 0-.3 0L5.4 15.7a.25.25 0 0 1-.4-.2Z"></path></svg>
```

## SourceHut

For public repos, simply nothing is indicated.

To identify a sourcehut repo page at all,
we may use this part (contained in all access levels):

```html
<meta content="git" name="vcs"/>
```
