Ruby Scripts
============
These are various scripts I use for repetitive tasks.

List of Files, their usage  and what they do
--------------------------------------------

### android_check_languages.rb
Builds a matrix of all localized strings in all the android xml files that you pass to it and tells you where they are defined and where they are missing.
It omits strings that are defined in all files.
#### Usage
    ./ruby android_check_languages.rb values/strings.xml values-fr/strings.xml
#### Output
    "key";"defined in"; "missing in"
    "title";"values/strings.xml";"values-fr/strings.xml"

### android_copy_images.rb
Copies images from a source folder to a destination folder. It uses ldpi mdpi hdpi xhdpi xxhdpi folders for source and drawable-* at the target
#### Usage
    ./android_copy_images.rb ic_action_search /tmp/icons /path/to/project/res
#### Output
		copy /tmp/icons/ldpi/ic_action_search to /path/to/project/res/drawable-ldpi/
		copy /tmp/icons/mdpi/ic_action_search to /path/to/project/res/drawable-mdpi/
		copy /tmp/icons/hdpi/ic_action_search to /path/to/project/res/drawable-hdpi/
		copy /tmp/icons/xhdpi/ic_action_search to /path/to/project/res/drawable-xhdpi/
		copy /tmp/icons/xxhdpi/ic_action_search to /path/to/project/res/drawable-xxhdpi/
