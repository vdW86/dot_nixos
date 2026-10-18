#!/bin/bash

TEMPLATE="$HOME/.config/abiword/templates/normal.awt"

# Backup maken
cp "$TEMPLATE" "$TEMPLATE.bak.$(date +%Y%m%d-%H%M%S)"

cat > "$TEMPLATE" <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE abiword PUBLIC "-//ABISOURCE//DTD AWML 1.0 Strict//EN" "http://www.abisource.com/awml.dtd">
<abiword xmlns="http://www.abisource.com/awml.dtd" xmlns:awml="http://www.abisource.com/awml.dtd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svg="http://www.w3.org/2000/svg" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:dc="http://purl.org/dc/elements/1.1/" version="0.99.2" fileformat="1.0" template="true" styles="unlocked" props="lang:nl-NL; dom-dir:ltr">

<styles>
<s type="P" name="Normal" basedon="" followedby="Current Settings" props="font-family:Calibri; margin-top:0pt; font-variant:normal; margin-left:0pt; text-indent:0in; widows:2; font-style:normal; font-weight:normal; text-decoration:none; color:000000; line-height:1.15; text-align:left; margin-bottom:0pt; text-position:normal; margin-right:0pt; bgcolor:transparent; font-size:11pt; font-stretch:normal"/>
</styles>

<pagesize pagetype="A4" orientation="portrait" width="21.000000" height="29.700000" units="cm" page-scale="1.000000"/>

<section props="page-margin-footer:1.27cm; page-margin-header:1.27cm; page-margin-left:2.54cm; page-margin-right:2.54cm; page-margin-top:2.54cm; page-margin-bottom:2.54cm">
<p style="Normal"/>
</section>

</abiword>
EOF

echo "AbiWord template aangepast naar Word-stijl."
echo "Lettertype : Calibri 11"
echo "Regelafstand: 1.15"
echo "Papier     : A4"
echo "Marges     : 2.54 cm"
echo "Taal       : nl-NL"
