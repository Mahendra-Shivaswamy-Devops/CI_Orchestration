install_jenkins Cookbook
========================

This cookbook install jenkins on debian and rhel based platfroms.
This cookbbok runs jenkins on 8080 port.

Jenkins by default doesnot have login credentials, so anyone with IP and port combination can access jenkins.

Usage
-----
#### install_jenkins::default
e.g.
Just include `install_jenkins` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[install_jenkins]"
  ]
}
```


