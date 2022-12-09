set -g VIRTUALFISH_VERSION 2.5.5
set -g VIRTUALFISH_PYTHON_EXEC /home/turbo/.local/pipx/venvs/virtualfish/bin/python
source /home/turbo/.local/pipx/venvs/virtualfish/lib/python3.10/site-packages/virtualfish/virtual.fish
source /home/turbo/.local/pipx/venvs/virtualfish/lib/python3.10/site-packages/virtualfish/compat_aliases.fish
source /home/turbo/.local/pipx/venvs/virtualfish/lib/python3.10/site-packages/virtualfish/auto_activation.fish
emit virtualfish_did_setup_plugins