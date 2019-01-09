#!/usr/bin/env bash

#------------------------------------------------------------------------------
# Bash script to execute the Solidity tests.
#
# The documentation for solidity is hosted at:
#
#     https://solidity.readthedocs.org
#
# ------------------------------------------------------------------------------
# This file is part of solidity.
#
# solidity is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# solidity is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with solidity.  If not, see <http://www.gnu.org/licenses/>
#
# (c) 2016 solidity contributors.
#------------------------------------------------------------------------------

set -e

REPO_ROOT="$(dirname "$0")"/..

echo "Running commandline tests..."
"$REPO_ROOT/test/cmdlineTests.sh"

# This conditional is only needed because we don't have a working Homebrew
# install for `vap` at the time of writing, so we unzip the ZIP file locally
# instead.  This will go away soon.
if [[ "$OSTYPE" == "darwin"* ]]; then
    VAP_PATH="$REPO_ROOT/vap"
elif [ -z $CI ]; then
    VAP_PATH="vap"
else
    mkdir -p /tmp/test
    # Update hash below if binary is changed.
    wget -q -O /tmp/test/vap https://github.com/vaporyco/cpp-vapory/releases/download/solidityTester/vap_byzantium2
    test "$(shasum /tmp/test/vap)" = "4dc3f208475f622be7c8e53bee720e14cd254c6f  /tmp/test/vap"
    sync
    chmod +x /tmp/test/vap
    sync # Otherwise we might get a "text file busy" error
    VAP_PATH="/tmp/test/vap"
fi

# This trailing ampersand directs the shell to run the command in the background,
# that is, it is forked and run in a separate sub-shell, as a job,
# asynchronously. The shell will immediately return the return status of 0 for
# true and continue as normal, either processing further commands in a script
# or returning the cursor focus back to the user in a Linux terminal.
$VAP_PATH --test -d /tmp/test &
VAP_PID=$!

# Wait until the IPC endpoint is available.  That won't be available instantly.
# The node needs to get a little way into its startup sequence before the IPC
# is available and is ready for the unit-tests to start talking to it.
while [ ! -S /tmp/test/gvap.ipc ]; do sleep 2; done
echo "--> IPC available."
sleep 2
# And then run the Solidity unit-tests (once without optimization, once with),
# pointing to that IPC endpoint.
echo "--> Running tests without optimizer..."
  "$REPO_ROOT"/build/test/soltest --show-progress -- --ipcpath /tmp/test/gvap.ipc && \
  echo "--> Running tests WITH optimizer..." && \
  "$REPO_ROOT"/build/test/soltest --show-progress -- --optimize --ipcpath /tmp/test/gvap.ipc
ERROR_CODE=$?
pkill "$VAP_PID" || true
sleep 4
pgrep "$VAP_PID" && pkill -9 "$VAP_PID" || true
exit $ERROR_CODE
