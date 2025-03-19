class McpCliManager < Formula
  desc "MCP CLI Manager - 一個用於管理多個服務器的命令行工具"
  homepage "https://github.com/crayon3shawn/mcp-cli-manager"
  url "https://github.com/crayon3shawn/mcp-cli-manager/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8e82f1cbe742040e3f49ba97e03dc70dd7d834bb830721ae656ff479d53af7f9"
  license "MIT"

  depends_on "node" => :build
  depends_on "npm" => :build

  def install
    system "npm", "install", "--production"
    system "npm", "run", "build" if File.exist? "package.json"
    
    # 安裝可執行文件
    bin.install "bin/mcp"
    
    # 安裝庫文件
    libexec.install Dir["lib/*"]
    
    # 安裝配置文件範例
    prefix.install "config.yaml.example"
    prefix.install "servers.yaml.example"
    prefix.install ".env.example"
    
    # 創建日誌目錄
    (var/"log/mcp-cli-manager").mkpath
  end

  def caveats
    <<~EOS
      配置文件範例已安裝在:
        #{prefix}/config.yaml.example
        #{prefix}/servers.yaml.example
        #{prefix}/.env.example
      
      請複製這些文件到您的配置目錄並根據需要修改。

      日誌文件將保存在:
        #{var}/log/mcp-cli-manager/
    EOS
  end

  test do
    system "#{bin}/mcp", "--version"
  end
end 