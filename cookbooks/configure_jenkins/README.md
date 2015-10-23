configure_jenkins Cookbook
==========================
This cookbook assumes jenkins is installed under /var/lib/jenkins as home directory.
This cookbook install below listed plugins and configures them
a. git
b. scm
c. maven

This cookbook is also responsible for creating a job which listens to local git repo

Job name: roadrunner
This job listens for commits to the local git repo.
Upon commits to repo, job will automatically trigger a build and packages in to jar
Job also lists the contents of the repo


Usage
-----
#### configure_jenkins::default


e.g.
Just include `configure_jenkins` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[configure_jenkins]"
  ]
}
```
