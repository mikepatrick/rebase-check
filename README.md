### rebase-check

Perform a check to determine if a PR branch needs the target branch rebased onto it.

#### Implementation

Use two dot rev-list to detect commits that are in the base (target) branch but not the feature (PR) branch.
