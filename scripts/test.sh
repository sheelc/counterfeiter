#!/usr/bin/env bash

set -e

counterfeiter='/tmp/counterfeiter_test'

go build -o $counterfeiter

$counterfeiter fixtures Something
$counterfeiter fixtures HasVarArgs
$counterfeiter fixtures HasImports
$counterfeiter fixtures HasOtherTypes
$counterfeiter fixtures ReusesArgTypes
$counterfeiter fixtures EmbedsInterfaces
$counterfeiter fixtures/aliased_package InAliasedPackage

go build ./fixtures/...

go test -race -v .
