#!/bin/bash

echo "[*] Installing Git Cola"
git clone git://github.com/git-cola/git-cola.git ~/.git-cola
pip install pyqt5
sudo ln -s ~/.git-cola/bin/git-dag /usr/local/bin/git-dag
sudo ln -s ~/.git-cola/bin/git-cola /usr/local/bin/git-cola
