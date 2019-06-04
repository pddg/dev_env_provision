pddg.pyenv
=========

Role for installing python by pyenv and create virtualenv.

Requirements
------------

This role do not require `sudo`, but the dependencies of building python is still needed.
Please see [tests/test.yml](./tests/test.yml).

Role Variables
--------------

See [defaults/main.yml](./defaults/main.yml)

Dependencies
------------

- [pddg.anyenv](https://github.com/pddg/ansible-role-anyenv)

Example Playbook
----------------

```yaml
- hosts: all
  vars:
    anyenv_envs:
      - pyenv
  roles:
    - name: pddg.pyenv
      vars:
        pyenv_install_versions:
          - 3.7.2
        pyenv_virtualenvs:
          - name: test_env
            version: 3.7.2
            modules:
              - requests
```

License
-------

MIT

Author Information
------------------

[pddg](https://github.com/pddg/)
  - Web: [poyo.info](https://www.poyo.info/)

