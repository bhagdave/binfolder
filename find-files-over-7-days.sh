#!/bin/bash
find $1 -type f -mtime +7 -exec ls -l {} \;
