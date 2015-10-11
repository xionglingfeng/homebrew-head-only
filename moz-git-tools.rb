class MozGitTools < Formula
  desc "Tools for working with Git at Mozilla"
  homepage "https://github.com/mozilla/moz-git-tools"
  head "https://github.com/mozilla/moz-git-tools.git"

  def install
    # Install all the executables, except git-root since that conflicts with git-extras
    bin_array = Dir.glob("git*").push("hg-patch-to-git-patch")
    bin_array.delete("git-root")
    bin_array.delete("git-bz-moz") # a directory, not an executable
    bin_array.each { |e| bin.install e }
  end

  def caveats
    <<-EOS.undent
    git-root was not installed because it conflicts with the version provided by git-extras.
    EOS
  end

  test do
    # create a Git repo and check its branchname
    system "git", "init"
    (testpath/"myfile").write("my file")
    system "git", "add", "myfile"
    system "git", "commit", "-m", "test"
    assert_match /master/, shell_output("#{bin}/git-branchname")
  end
end
