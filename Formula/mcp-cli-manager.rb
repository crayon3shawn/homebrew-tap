class McpCliManager < Formula
  desc "A CLI tool for managing MCP projects"
  homepage "https://github.com/crayon3shawn/mcp-cli-manager"
  url "https://registry.npmjs.org/mcp-cli-manager/-/mcp-cli-manager-1.1.1.tgz"
  sha256 "170bba88a27399cbec817d718fcd84783dbb96a62668a5021f900c395788e243"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "mcp-cli-manager", shell_output("#{bin}/mcp-cli-manager --version")
  end
end
