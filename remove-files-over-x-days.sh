#!/bin/bash
find $1 -type f -mtime +$2 -exec ls -l {} \;
