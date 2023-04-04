<!--
SPDX-FileCopyrightText: 2023 Robin Vobruba <hoijui.quaero@gmail.com>
SPDX-License-Identifier: CC0-1.0
-->

# Private

Relevant scraped HTML sources,
extracted from different forges private/non-public WebUI frontends
for a repository URL.
See also the [public version](public.md) of this same data.

This data is the basis on which we orient the code.

## GitHub

```html
<span class="Label Label--secondary v-align-middle mr-1">Private</span>
```

## GitLab

```html
<span class="visibility-icon gl-text-secondary has-tooltip gl-ml-2" data-container="body" title="Private - Project access must be granted explicitly to each user. If this project is part of a group, access is granted to members of the group.">
```

## Gitea

```html
<svg viewBox="0 0 16 16" class="svg octicon-lock" width="32" height="32" aria-hidden="true"><path d="M4 4a4 4 0 0 1 8 0v2h.25c.966 0 1.75.784 1.75 1.75v5.5A1.75 1.75 0 0 1 12.25 15h-8.5A1.75 1.75 0 0 1 2 13.25v-5.5C2 6.784 2.784 6 3.75 6H4Zm8.25 3.5h-8.5a.25.25 0 0 0-.25.25v5.5c0 .138.112.25.25.25h8.5a.25.25 0 0 0 .25-.25v-5.5a.25.25 0 0 0-.25-.25ZM10.5 6V4a2.5 2.5 0 1 0-5 0v2Z"></path></svg>
```

## SourceHut

To identify a sourcehut repo page at all,
we may use this part (contained in all access levels):

```html
<meta content="git" name="vcs"/>
```

This is found for unlisted/unindexed repos
which require no authentication:

```html
<li class="nav-item nav-text vis-unlisted" title="This repository is only visible to those who know the URL.">
        
        Unlisted
        
      </li>
```

This is found for private repos:

```html
<li class="nav-item nav-text vis-private" title="This repository is only visible to those who were invited to view it.">
        
        Private
        
      </li>
```
