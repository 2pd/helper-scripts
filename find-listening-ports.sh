#!/usr/bin/env bash

lsof -nP +c 15 | grep LISTEN
