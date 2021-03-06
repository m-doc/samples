#!/bin/sh

set -ex

INSTALLPATH="$(pwd)/verapdf"

wget http://downloads.verapdf.org/rel/verapdf-installer.zip
unzip -u verapdf-installer.zip
rm verapdf-installer.zip
cd verapdf-*

cat << EOF > auto_install.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
  <com.izforge.izpack.panels.htmlinfo.HTMLInfoPanel id="welcome"/>
  <com.izforge.izpack.panels.target.TargetPanel id="install_dir">
    <installpath>$INSTALLPATH</installpath>
  </com.izforge.izpack.panels.target.TargetPanel>
  <com.izforge.izpack.panels.packs.PacksPanel id="sdk_pack_select">
    <pack index="0" name="veraPDF GUI" selected="true"/>
    <pack index="1" name="veraPDF Mac and *nix Scripts" selected="true"/>
    <pack index="2" name="veraPDF Corpus and Validation model" selected="true"/>
    <pack index="3" name="veraPDF Documentation" selected="true"/>
  </com.izforge.izpack.panels.packs.PacksPanel>
  <com.izforge.izpack.panels.install.InstallPanel id="install"/>
  <com.izforge.izpack.panels.finish.FinishPanel id="finish"/>
</AutomatedInstallation>
EOF

java -jar verapdf-izpack-installer-*.jar auto_install.xml
