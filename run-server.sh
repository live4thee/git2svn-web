#!/bin/sh

mkdir -p public/downloads/
mkdir -p public/uploads/

ruby server.rb -p 8080 -o 0.0.0.0
