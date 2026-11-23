class TsAndCmd < Formula
  desc "Build, install, and launch an Android app from its project directory"
  homepage "https://github.com/tbtsfastad/shell"
  url "https://raw.githubusercontent.com/tbtsfastad/shell/6322b179b19c74f1ab7f62311a4c25ad6f4ba561/ts-and-cmd"
  version "0.1.0"
  sha256 "9bd52a3ffa6e07b4a86e589268bc422df1c3d9bd9dc638163c0c0e2573f66731"

  depends_on :macos
  depends_on "python@3.14"

  def install
    inreplace "ts-and-cmd", "#!/usr/bin/env python3", "#!#{Formula["python@3.14"].opt_bin}/python3.14"
    bin.install "ts-and-cmd"
    (bin/"ts-and-cmd").chmod(0755)
  end

  test do
    assert_equal "ts-and-cmd #{version}", shell_output("#{bin}/ts-and-cmd --version").strip
    assert_match "--debug", shell_output("#{bin}/ts-and-cmd run --help")
  end
end
