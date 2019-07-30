#!/usr/bin/env bash

lsof -i -n -P | grep TCP | grep $1
