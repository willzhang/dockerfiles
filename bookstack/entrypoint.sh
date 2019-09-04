#!/bin/bash
if [ ! -f /opt/bookstack/dbupdated ]
then
/opt/bookstack/BookStack install 2>&1 | tee /opt/bookstack/dbupdated
fi
/opt/bookstack/BookStack
