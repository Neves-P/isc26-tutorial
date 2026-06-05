# EESSI for Continuous Integration (CI)

!!! Note "Learning Objectives"

    * Integrate CI based on EESSI into our software project
    * Navigate the CI interface of GitHub
    * Consider the benefits of CI integration

## What is Continuous Integration (CI)?

**Continuous Integration (CI)** is a software development practice where developers frequently merge their code changes
into a shared repository. Each time code is added or updated, automated processes build the application and run tests
to verify that everything still works correctly. This verification workflow is exactly the process we went through in
the last episode:
* Prepare the environment
* Build the application
* Make sure it works
CI is about automating that workflow to ensure it is carried out whenever we make changes to our
application...and letting us know when things go wrong!

CI is useful because it helps teams detect problems early. Instead of discovering bugs or integration issues weeks
later, developers receive immediate feedback when a change breaks the build or causes tests to fail. This makes issues
easier and less expensive to fix.

Another benefit of CI is improved collaboration. Since code is integrated regularly, team members are less likely to
encounter large merge conflicts. Automated testing also increases confidence that new features do not unintentionally
break existing functionality.

We will cover the popular CI tool [GitHub Actions](https://github.com/features/actions), and also a little of 
[GitLab CI/CD](https://docs.gitlab.com/ci/), as EESSI has built support for these. These tools automate building,
testing, and validating code whenever changes are committed.

## How can EESSI help with CI?

EESSI gives you a portable environment, whatever we can do locally with EESSI we should be able to do in other
locations where EESSI is available. One way to think of this is that EESSI enables portable workflows, and CI is
not really anything more than a specific workflow.

However, workflows based on EESSI are only portable if EESSI is
available on the platform where the workflow is carried out. For this reason, EESSI has built some tooling for GitHub
and GitLab to make sure this is the case:

* The EESSI GitHub Action can be found on the [GitHub Marketplace](https://github.com/marketplace),
at [https://github.com/marketplace/actions/eessi](https://github.com/marketplace/actions/eessi).

* The EESSI GitLab CI/CD component can be found in the [GitLab CI/CD Catalog](https://gitlab.com/explore/catalog), at
[https://gitlab.com/explore/catalog/eessi/gitlab-eessi](https://gitlab.com/explore/catalog/eessi/gitlab-eessi).


## Using the EESSI GitHub Action

??? question "But I use GitLab not GitHub :disappointed:"

    The [EESSI GitLab Component](https://gitlab.com/explore/catalog/eessi/gitlab-eessi) also exists, and this allows
    you to follow a very similar approach to that described
    here for GitHub. At the end of the episode we will provide the equivalent file needed to enable GitLab CI.

    It is possible to use the [EESSI GitLab Component](https://gitlab.com/explore/catalog/eessi/gitlab-eessi) in a
    self-hosted GitLab instance, documentation on how to do this is available at
    <https://docs.gitlab.com/ci/components/#use-a-gitlabcom-component-on-gitlab-self-managed>. 

## Adding CI based on EESSI to our software project

### Where to find help?

### What happens when CI fails?

## Benefits of CI
