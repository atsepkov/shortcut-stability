#!/usr/bin/env bash
# Copyright 2015 Alexander Tsepkov <atsepkov@gmail.com>

# assumes we already brew-installed linux tools:
#	brew install coreutils findutils gnu-sed gawk

# set aliases for given user to GNU tools instead of OSX equivalents
alias ls='command gls'
alias cp='command gcp'
alias sed='command gsed'
alias tac='command gtac'
alias date='command gdate'
