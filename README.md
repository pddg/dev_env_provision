# 環境構築用Playbook

[![Build Status](https://travis-ci.com/pddg/dev_env_provision.svg?branch=master)](https://travis-ci.com/pddg/dev_env_provision)

Ansibleをインストールする．

```bash
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
# または
$ brew install ansible
```

実行する

```bash
$ ansible-playbook exec.yml
# またはインタプリタを指定して実行
$ ansible-playbook exec.yml -e ansible_python_interpreter=/path/to/python
```

python2，python3どっちでも動く
