#!/bin/bash

# Copyright 2017,2018 Laurence Alexander Hurst

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# See the file LICENCE in the original source code repository for the
# full licence.

OUTFILE="$( mktemp )"

$@ >>$OUTFILE 2>&1
exit_stat="$?"

if [ "$exit_stat" -ne 0 ]
then
	echo "cron_wrapper: Command exited with non-zero exit status.  Dumping output." >&2
	echo "----------------------------------------" >&2
	cat $OUTFILE
fi

rm -f "$OUTFILE"
