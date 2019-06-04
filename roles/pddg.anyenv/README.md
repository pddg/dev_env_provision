Anyenv
=========

Role for install anyenv and \*\*env tools.

Requirements
------------

Homebrew is needed if this use on macOS and `anyenv_prefer_brew: yes`.

Role Variables
--------------

See [defaults/main.yml](./defaults/main.yml)

Dependencies
------------

No dependencies

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - name: pddg.anyenv
      var:
        anyenv_plugins:
          - repo: https://github.com/znz/anyenv-update
            version: master
        anyenv_envs:
          - pyenv
          - goenv
```

License
-------

MIT

Author Information
------------------

[pddg](https://github.com/pddg/)
  - Web: [poyo.info](https://www.poyo.info/)

