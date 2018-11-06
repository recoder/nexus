# adapted from https://gist.github.com/zumbojo/1073996

class Bijective
  BASE62 = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).join

  BASE31 = ([*0..9, *'a'..'z'] - %w[a e i o u]).join
  BASE52 = ([*0..9, *'a'..'z', *'A'..'Z'] - %w[a e i o u A E I O U]).join

  BASE28 = ([*'0'..'9', *'a'..'z'] - %w[a e i o u 0 1 3]).join
  BASE49 = ([*'0'..'9', *'a'..'z', *'A'..'Z'] - %w[a e i o u A E I O U 0 1 3]).join

  def initialize(alphabet = BASE62, seed = 0)
    letters = alphabet.split(//)
    dup_check = letters.uniq.join

    if dup_check.length != alphabet.length
      raise(Error, 'alphabet string must contain only unique charaters')
    end

    letters.shuffle!(random: Random.new(seed)) unless seed == 0

    @alphabet = letters.join
    @base = @alphabet.length
  end

  def encode(value)
    return @alphabet[0, 1] if value == 0

    str = ''
    while value > 0
      str << @alphabet[value.modulo(@base)]
      value /= @base
    end
    str.reverse
  end

  def decode(str)
    value = 0
    str.each_char { |char| value = value * @base + @alphabet.index(char) }
    value
  end

  def space_base(len)
    @base**(len - 1)
  end

  def space_width(len)
    space_base(len + 1) - space_base(len) - 1
  end

  def encode_modulo(value, len)
    mvalue = value % space_width(len)
    encode(space_base(len) + mvalue)
  end
end
