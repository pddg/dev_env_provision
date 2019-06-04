import os

import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_anyenv_installed(host):
    user_home = host.user.home
    installed_dir = user_home + "/.anyenv"
    bin_dir = installed_dir + "/bin/"
    anyenv_dir = host.file(installed_dir)
    anyenv_bin = host.file(bin_dir + "anyenv")
    anyenv_called = host.find_command(
        "anyenv", extrapaths=(bin_dir,)
    )

    assert anyenv_dir.exists
    assert anyenv_bin.exists
    assert bin_dir + "anyenv" == anyenv_called


@pytest.mark.parametrize("name", [
    ("pyenv",), ("nodenv",)
])
def test_envs_installed(host, name):
    user_home = host.user.home
    installed_dir = user_home + "/.anyenv/envs/" + name
    bin_dir = installed_dir + "/bin/"
    env_dir = host.file(installed_dir)
    env_bin = host.file(bin_dir + name)
    command_called = host.find_command(
        name, extrapaths=(bin_dir,)
    )

    assert env_dir.exists
    assert env_bin.exists
    assert bin_dir + name == command_called


def test_anyenv_configured(host):
    user_home = host.user.home
    config_dir = user_home + "/.config/anyenv/anyenv-install"

    assert config_dir.exists
    assert config_dir.is_dir
