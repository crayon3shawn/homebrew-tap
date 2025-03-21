class McpCliManager < Formula
  desc "A CLI tool for managing MCP projects"
  homepage "https://github.com/crayon3shawn/mcp-cli-manager"
  url "https://registry.npmjs.org/@chengche/mcp-cli-manager/-/mcp-cli-manager-1.0.7.tgz"
  sha256 "c8d3eae160a892e32837db3dcae515e843e5383fef52b8141940c8bcf8b6d59f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "mcp-cli-manager", shell_output("#{bin}/mcp --version")
  end
end
