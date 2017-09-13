# group_images_into_date_folders.rb

This is a small tool I used on Windows to organize images into folders. It figures out the date the pictures were taken on (from filename or exif data) and then puts all the images from the same day in a folder named for that date.

Helps to group up files for organizing and backing up. Later, you can add the event name to the folder date too, to make pictures easier to find.

## Caveat

- Only tested with Ruby 2.4.1
- Only tested on Windows, since that's where all my pictures are stored

## Notes

- Date format is `YYYY.MM.DD`
  - This allows the folders to sort in a natural order

## Running

From the Powershell, navigate to the folder with the code.

```
ruby .\group_images_into_date_folders.rb "Q:\Dropbox\Pictures\2014\unsorted"
```

Or type the full path and run it anywhere.

```
ruby Q:\Dropbox\code\kyletolle\group_images_into_date_folders.rb\group_images_into_date_folders.rb "Q:\Dropbox\Pictures\2014\unsorted"
```

