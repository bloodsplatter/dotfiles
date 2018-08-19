#!/bin/env bash
# currently this does not work if newsboat is open
unread= newsboat -x print-unread | awk '{print $1}'
echo "$unread"