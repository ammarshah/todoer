module EmailRegex
  # Email address compliant with RFC 2822 format
  # Matches a normal email address. Does not check the top-level domain.
  # Copied from: https://stackoverflow.com/a/16168103/4640611
  # Demo link: https://regex101.com/r/PTPAJy/1
  EMAIL_REGEX = /\A[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\z/
end
