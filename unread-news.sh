#!/bin/env bash
unread= newsboat -x print-unread | awk '{print $1}'