class McpCliManager < Formula
  desc "MCP CLI Manager - 用於管理 Model Context Protocol 服務的命令行工具"
  homepage "https://github.com/crayon3shawn/mcp-cli-manager"
  url "https://github.com/crayon3shawn/mcp-cli-manager/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "59f871fcfa44655278f82db913c06f49381bcb600941a267ea99f0bf109a1576"
  license "MIT"

  depends_on "zsh"
  depends_on "screen"

  def install
    bin.install "bin/mcp-cli-manager"
    libexec.install "lib"
    etc.install "config.yaml.example" => "mcp-cli-manager.yaml"
  end

  def caveats
    <<~EOS
      請確保創建配置文件：
      mkdir -p ~/.cursor
      cp #{etc}/mcp-cli-manager.yaml ~/.cursor/mcp-cli-manager.json

      配置文件示例：
      {
        "mcpServers": {
          "github": {
            "command": "/opt/homebrew/bin/mcp-server-github",
            "args": [],
            "env": {
              "GITHUB_PERSONAL_ACCESS_TOKEN": "your-token-here"
            }
          }
        }
      }
    EOS
  end
end
