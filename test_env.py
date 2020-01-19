# 使用方法
# $ py.test -v --tb=short test_env.py
#
# 参考
# $ pycodestyle test_env.py
#
import os
import pytest


# シンボリックリンクの確認
@pytest.mark.parametrize("name", [
    ("config"),
    ("bash_aliases"),
    ("gitconfig"),
    ("gitexclude"),
    ("tigrc"),
    ("tmux.conf"),
    ("vim"),
])
def test_synlink(host, name):
    home = os.environ["HOME"]
    assert host.file(f"{home}/.{name}").is_symlink
    assert host.file(f"{home}/.{name}").linked_to == f"{home}/.dotfiles/_{name}"
