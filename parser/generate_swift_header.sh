#!/bin/sh

# Generate temporary swift module map
header_file=$1
module_name='TempJazzyModule'
module_file='module.modulemap'
echo "module $module_name { header \"$header_file\" }" > $module_file

# Locations of sourcekitd-test and sdk
sourcekitd_test='/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekitd-test'
sdk='/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk'

# Print generated Swift header (full)

# Doc Info Version
$sourcekitd_test -req=doc-info -module $module_name --  -I `pwd` -sdk $sdk

# Full Version
# $sourcekitd_test -req=interface-gen -module $module_name -- -I `pwd` -sdk $sdk

# Remove temporary module file
rm $module_file
