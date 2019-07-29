# group_images_into_date_folders.rb

This is a small tool I used on Windows to organize images into folders. It
figures out the date the pictures were taken on (from filename or exif data)
and then puts all the images from the same day in a folder named for that date.

Helps to group up files for organizing and backing up. Later, you can add the
event name to the folder date too, to make pictures easier to find.

## Prerequisites

```
gem install exifr
```

## Running

### On Windows

From the Powershell, navigate to the folder with this code.

Then run the script by passing in the folder where the pictures are located.
```
ruby .\group_images_into_date_folders.rb "Q:\Dropbox\Pictures\2014\unsorted"
```

Or type the full path to the code and run it anywhere.

```
ruby Q:\Dropbox\code\kyletolle\group_images_into_date_folders.rb\group_images_into_date_folders.rb "Q:\Dropbox\Pictures\2014\unsorted"
```

### On macOS

From the terminal, navigate to the folder with this code.

Then run the script by passing in the folder where the pictures are located.
```
ruby ./group_images_into_date_folders.rb ~/Dropbox/Camera\ Uploads
```

Or type the full path to the code and run it anywhere.

```
ruby ~/code/kyletolle/group_images_into_date_folders/group_images_into_date_folders.rb ~/Dropbox/Camera\ Uploads
```

## Notes

- Should be able to run on either Windows or maOS
- Tested with Ruby 2.4.1 on Windows and 2.6.2 on macOS
- Date format is `YYYY.MM.DD`
  - This allows the folders to sort in a natural order

