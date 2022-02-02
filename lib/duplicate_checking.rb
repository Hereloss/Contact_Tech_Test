# This class allows data sourcer to check for multiple of the same key in malformed data and raise an error
class DuplicateChecking < Hash
  attr_accessor :duplicate_check_off

  def []=(key, value)
    raise if !duplicate_check_off && key?(key)

    super
  end
end
