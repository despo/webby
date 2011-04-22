# encoding: utf-8
class String

  def self.small_words
    @small_words ||= %w(a an and as at but by en for if in of on or the to v[.]? via vs[.]?)
  end

  def /( path )
    ::File.join(self, path)
  end

  def titlecase
    swrgxp = self.class.small_words.join('|')

    parts = self.split( %r/( [:.;?!][ ] | (?:[ ]|^)["“] )/x )
    parts.each do |part|
      part.gsub!(%r/\b[[:alpha:]][[:lower:].'’]*\b/) do |s|
        s =~ %r/\w+\.\w+/ ? s : s.capitalize
      end

      # Lowercase the small words
      part.gsub!(%r/\b(#{swrgxp})\b/i) {|w| w.downcase}

      # If the first word is a small word, then capitalize it
      part.gsub!(%r/\A([[:punct:]]*)(#{swrgxp})\b/) {$1 + $2.capitalize}

      # If the last word is a small word, then capitalize it
      part.gsub!(%r/\b(#{swrgxp})([^\w\s]*)\z/) {$1.capitalize + $2}
    end

    str = parts.join

    # Special cases:
    str.gsub!(/ V(s?)\. /, ' v\1. ')               # "v." and "vs."
    str.gsub!(/(['’])S\b/, '\1s')                  # 'S (otherwise you get "the SEC'S decision")
    str.gsub!(/\b(AT&T|Q&A)\b/i) { |w| w.upcase }  # "AT&T" and "Q&A", which get tripped up.

    str
  end

  # Borrowed from the excellent StringEx library: git://github.com/rsl/stringex.git

  # Create a URI-friendly representation of the string.
  def to_url
    remove_formatting.downcase.replace_whitespace("-").collapse("-")
  end
  
  # Performs multiple text manipulations. Essentially a shortcut for typing them all. View source
  # below to see which methods are run.
  def remove_formatting
    strip_html_tags.convert_accented_entities.convert_misc_entities.convert_misc_characters.collapse
  end

  # Removes HTML tags from text. This code is simplified from Tobias Luettke's regular expression
  # in Typo[http://typosphere.org].
  def strip_html_tags(leave_whitespace = false)
    name = /[\w:_-]+/
    value = /([A-Za-z0-9]+|('[^']*?'|"[^"]*?"))/
    attr = /(#{name}(\s*=\s*#{value})?)/
    rx = /<[!\/?\[]?(#{name}|--)(\s+(#{attr}(\s+#{attr})*))?\s*([!\/?\]]+|--)?>/
    (leave_whitespace) ?  gsub(rx, "").strip : gsub(rx, "").gsub(/\s+/, " ").strip
  end

  # Converts HTML entities into the respective non-accented letters. Examples:
  # 
  #   "&aacute;".convert_accented_entities # => "a"
  #   "&ccedil;".convert_accented_entities # => "c"
  #   "&egrave;".convert_accented_entities # => "e"
  #   "&icirc;".convert_accented_entities # => "i"
  #   "&oslash;".convert_accented_entities # => "o"
  #   "&uuml;".convert_accented_entities # => "u"
  # 
  # Note: This does not do any conversion of Unicode/Ascii accented-characters. For that
  # functionality please use <tt>to_ascii</tt>.
  def convert_accented_entities
    gsub(/&([A-Za-z])(grave|acute|circ|tilde|uml|ring|cedil|slash);/, '\1')
  end

  # Converts HTML entities (taken from common Textile/RedCloth formattings) into plain text formats.
  # 
  # Note: This isn't an attempt at complete conversion of HTML entities, just those most likely
  # to be generated by Textile.
  def convert_misc_entities
    dummy = dup
    {
      "#822[01]" => "\"",
      "#821[67]" => "'",
      "#8230" => "...",
      "#8211" => "-",
      "#8212" => "--",
      "#215" => "x",
      "gt" => ">",
      "lt" => "<",
      "(#8482|trade)" => "(tm)",
      "(#174|reg)" => "(r)",
      "(#169|copy)" => "(c)",
      "(#38|amp)" => "and",
      "nbsp" => " ",
      "(#162|cent)" => " cent",
      "(#163|pound)" => " pound",
      "(#188|frac14)" => "one fourth",
      "(#189|frac12)" => "half",
      "(#190|frac34)" => "three fourths",
      "(#176|deg)" => " degrees"
    }.each do |textiled, normal|
      dummy.gsub!(/&#{textiled};/, normal)
    end
    dummy.gsub(/&[^;]+;/, "")
  end

  # Converts various common plaintext characters to a more URI-friendly representation.
  # Examples:
  #   
  #   "foo & bar".convert_misc_characters # => "foo and bar"
  #   "Chanel #9".convert_misc_characters # => "Chanel number nine"
  #   "user@host".convert_misc_characters # => "user at host"
  #   "google.com".convert_misc_characters # => "google dot com"
  #   "$10".convert_misc_characters # => "10 dollars"
  #   "*69".convert_misc_characters # => "star 69"
  #   "100%".convert_misc_characters # => "100 percent"
  #   "windows/mac/linux".convert_misc_characters # => "windows slash mac slash linux"
  #   
  # Note: Because this method will convert any & symbols to the string "and",
  # you should run any methods which convert HTML entities (convert_html_entities and convert_misc_entities)
  # before running this method.
  def convert_misc_characters
    dummy = dup.gsub(/\.{3,}/, " dot dot dot ") # Catch ellipses before single dot rule!
    {
      /\s*&\s*/ => "and",
      /\s*#/ => "number",
      /\s*@\s*/ => "at",
      /(\S|^)\.(\S)/ => '\1 dot \2',
      /(\s|^)\$(\d*)(\s|$)/ => '\2 dollars',
      /\s*\*\s*/ => "star",
      /\s*%\s*/ => "percent",
      /\s*(\\|\/)\s*/ => "slash",
    }.each do |found, replaced|
      replaced = " #{replaced} " unless replaced =~ /\\1/
      dummy.gsub!(found, replaced)
    end
    dummy = dummy.gsub(/(^|\w)'(\w|$)/, '\1\2').gsub(/[\.,:;()\[\]\/\?!\^'"_]/, " ")
  end

  # Replace runs of whitespace in string. Defaults to a single space but any replacement
  # string may be specified as an argument. Examples:
  # 
  #   "Foo       bar".replace_whitespace # => "Foo bar"
  #   "Foo       bar".replace_whitespace("-") # => "Foo-bar"
  def replace_whitespace(replace = " ")
    gsub(/\s+/, replace)
  end

  # Removes specified character from the beginning and/or end of the string and then performs
  # <tt>String#squeeze(character)</tt>, condensing runs of the character within the string.
  # 
  # Note: This method has been superceded by ActiveSupport's squish method.
  def collapse(character = " ")
    sub(/^#{character}*/, "").sub(/#{character}*$/, "").squeeze(character)
  end
  
end  # class String

# EOF
