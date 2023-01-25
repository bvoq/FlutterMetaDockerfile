#!/bin/sh

# This script additionally to flutter/dart needs:
# brew install dashing jq yq
# [Optional] For image resizing:
# pip3 install Pillow

# Install/Update plugins
flutter pub get

# If your project uses code generation:
# flutter pub run build_runner build --delete-conflicting-outputs

# Format the code, should be done on saving by IDE.
flutter format .

# Run tests
flutter test

# Analyze the code for issues.
flutter analyze

# Generate a dart web documentation.
dart doc .


########################################################################################
# Generate a dash documentation from the web documentation in doc/<packagename>.docset #
########################################################################################

DASHINGFILE=doc/api/dashing.json
FLUTTERNAME="$(yq -r .name pubspec.yaml)"
FLUTTERNAME_QUOTED="\"$(yq -r .name pubspec.yaml)\""
echo '{
    "name": "ExampleFlutter",
    "package": "ExampleFlutter",
    "index": "index.html",
    "ignore": [
        "ABOUT"
    ],
    "icon32x32": "",
    "allowJS": false,
    "ExternalURL": "",
    "selectors": {
        "#exceptions span.name a": {
          "type": "Exception"
        },

        "h1 > span.kind-library": {
          "type": "Library"
        },

        "h1 > span.kind-class": {
          "type": "Class"
        },

        "h1 > span.kind-function": {
          "type": "Function"
        },

        "h1 > span.kind-typedef": {
          "type": "Type"
        },

        "h1 > span.kind-enum": {
          "type": "Enum"
        },

        "h1 > span.kind-top-level-constant": {
          "type": "Constant"
        },

        "h1 > span.kind-constant": {
          "type": "Constant"
        },

        "h1 > span.kind-method": {
          "type": "Method"
        },

        "h1 > span.kind-property": {
          "type": "Property"
        },

        "h1 > span.kind-top-level-property": {
          "type": "Property"
        },

        "h1 > span.kind-constructor": {
          "type": "Constructor"
        },

        ".callables .callable": {
          "requiretext": "operator ",
          "type": "Operator",
          "regexp": "operator ",
          "replacement": ""
        }
  },
  "ignore": [
    "ABOUT"
  ]
}' > "$DASHINGFILE"

contents=$(jq ".name = ${FLUTTERNAME_QUOTED}" $DASHINGFILE)
echo "${contents}" > "$DASHINGFILE"
contents=$(jq ".package = ${FLUTTERNAME_QUOTED}" $DASHINGFILE)
echo "${contents}" > "$DASHINGFILE"

# [OPTIONAL] Grab the largest app icon from the ios app and resize it to 30x30 to be used as an image of the documentation. 
LARGESTICON=$(du ios/Runner/Assets.xcassets/AppIcon.appiconset/* | sort -rn | awk '{print $2}' | head -n 1)
cat > resize.py <<- EOM
from PIL import Image
import sys

filename = sys.argv[1]
basewidth = 32
img = Image.open(filename)
wpercent = (basewidth/float(img.size[0]))
hsize = int((float(img.size[1])*float(wpercent)))
img = img.resize((basewidth,hsize), Image.Resampling.LANCZOS)
img.save(sys.argv[2]) 
EOM
DOCICONNAME_QUOTED="\"doclogo.png\""
python3 resize.py $LARGESTICON doc/api/doclogo.png
contents=$(jq ".icon32x32 = ${DOCICONNAME_QUOTED}" $DASHINGFILE)

# Build the documentation.
rm -r doc/*.docset
rm -r doc/api/*.docset
cd doc/api
dashing build dashing.json
mv *.docset ./../
cd ..

# [OPTIONAL] Set the docset language to dartlang.
cat > preprocessing.dart <<- EOM
import 'dart:io';

/// This changes the DocSetPlatformFamily key to be "dartlang" instead of the
/// name of the package (usually "flutter").
///
/// This is so that the IntelliJ plugin for Dash will be able to go directly to
/// the docs for a symbol from a keystroke. Without this, flutter isn't part
/// of the list of package names it searches. After this, it finds the flutter
/// docs because they're declared here to be part of the "dartlang" family of
/// docs.
///
/// Dashing doesn't have a way to configure this, so we modify the Info.plist
/// directly to make the change.
void main(List<String> args) {
  if(args.length <= 0) return;
  final File infoPlist = File(args[0]+'/Contents/Info.plist');
  String contents = infoPlist.readAsStringSync();

  // Since I didn't want to add the XML package as a dependency just for this,
  // I just used a regular expression to make this simple change.
  final RegExp findRe = RegExp(r'(\s*<key>DocSetPlatformFamily</key>\s*<string>)[^<]+(</string>)', multiLine: true);
  contents = contents.replaceAllMapped(findRe, (Match match) {
    return '\${match.group(1)}dartlang\${match.group(2)}';
  });
  infoPlist.writeAsStringSync(contents);
}
EOM

dart run preprocessing.dart "$FLUTTERNAME.docset"

cd ..

# [OPTIONAL] Clean
rm resize.py
rm doc/preprocessing.dart
rm doc/api/dashing.json
