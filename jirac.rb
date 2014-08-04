require "formula"

class Jirac < Formula
  homepage "https://github.com/jirac/jirac"
  head "https://github.com/jirac/jirac.git"

  depends_on "xmlstarlet"
  depends_on "git"

  def install
    # replace jirac_dir with static value, if not every script would be available in path
    # as it needs to copy every file in /bin.
    # The script expect to find every of its 'module' in the same path as jirac.
    inreplace "jirac", '$(dirname "$0")', prefix
    prefix.install Dir['*']
    # Make only jirac available
    bin.install_symlink prefix/"jirac"
  end
  
end
