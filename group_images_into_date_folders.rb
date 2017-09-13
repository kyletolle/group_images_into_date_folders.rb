require 'fileutils'
require 'exifr/jpeg'

# In the 2014 unsorted picture dataset, there are 1,504 files. 6.30 GB
# (6,765,896,142 bytes).

image_folder = ARGV[0]
puts "Processing images from: #{image_folder}"

# Collect the dates and their related images.
dates_and_images = {}
Dir.entries(image_folder).each do |filename|
  next if ['.', '..'].include?(filename)

  full_path = File.join(image_folder, filename)

  next if Dir.exist?(full_path) # Skip directories

  date_regex = /^(\d\d\d\d)-(\d\d)-(\d\d)/

  if filename =~ date_regex
    # Get the image date from the filename
  elsif filename.match?(/\.jpg/i) && (image_exif = EXIFR::JPEG.new(full_path)).exif?
    date_taken = image_exif.date_time_original.to_s
    if date_taken.length > 0
      # Get the image date from the exif data
      date_taken =~ date_regex
    else
      # Get modified date from the filesystem
      date_modified = File.mtime(full_path).to_s
      date_modified =~ date_regex
    end
  else
    # Get modified date from the filesystem
    date_modified = File.mtime(full_path).to_s
    date_modified =~ date_regex
  end

  regex_match = Regexp.last_match
  year, month, day = regex_match.captures

  formatted_date = "#{year}.#{month}.#{day}"
  dates_and_images[formatted_date] ||= []
  dates_and_images[formatted_date] << filename
end

# Create folders for the dates and move the images there.
dates_and_images.each do |date_name, images|
  date_image_folder = File.join(image_folder, date_name)
  # puts "Want to create #{date_image_folder}"
  FileUtils.mkdir(date_image_folder) unless Dir.exist?(date_image_folder)

  images.each do |image_name|
    old_image_path = File.join(image_folder, image_name)
    new_image_path = File.join(date_image_folder, image_name)
    # puts "Want to move #{old_image_path} to #{new_image_path}"
    begin
      FileUtils.mv(old_image_path, new_image_path)
    rescue Errno::EACCES
      puts "Could not move #{old_image_path}"
    end
  end
end

