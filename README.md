Ruby Scripts
============
These are various scripts I use for repetitive tasks.

List of Files, their usage  and what they do
--------------------------------------------

### android_check_languages.rb
Builds a matrix of all localized strings in all the android xml files that you pass to it and tells you where they are defined and where they are missing.
It omits strings that are defined in all files.
#### Usage
    ruby android_check_languages.rb values/strings.xml values-fr/strings.xml
#### Output
    "key";"defined in"; "missing in"
    "title";"values/strings.xml";"values-fr/strings.xml"
