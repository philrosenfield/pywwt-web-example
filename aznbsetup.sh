#!/bin/bash

# As mentioned in https://github.com/Microsoft/AzureNotebooks/issues/245,
# it looks like nbextensions is a symbolic link to a non-existing directory
# initially
rm -rf /home/nbuser/.local/share/jupyter/nbextensions
mkdir /home/nbuser/.local/share/jupyter/nbextensions

# Install pywwt! There are issues with Jupyter being run from Python 2
# and the kernel being Python 3, so just to be sure we install the
# required packages for both Python 2 and 3.

pip2 install pywwt --pre --upgrade-strategy only-if-needed --user

pip3 install pywwt --pre --upgrade-strategy only-if-needed --user

python3 /usr/local/bin/jupyter-nbextension install --py --user widgetsnbextension
python3 /usr/local/bin/jupyter-nbextension install --py --user ipyevents
python3 /usr/local/bin/jupyter-nbextension install --py --user pywwt

python3 /usr/local/bin/jupyter-nbextension enable --py --user widgetsnbextension
python3 /usr/local/bin/jupyter-nbextension enable --py --user ipyevents
python3 /usr/local/bin/jupyter-nbextension enable --py --user pywwt

