{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Neovim and plugin build/runtime dependencies
    neovim
    git
    curl
    ripgrep
    fd
    fzf
    gnumake
    gcc
    tree-sitter

    # LSP servers
    clang-tools                 # clangd
    typescript-language-server  # ts_ls
    vue-language-server         # vue_ls (verify availability in your nixpkgs)
    phpactor                    # phpactor language server
    lua-language-server
    nixd
    bash-language-server
    sqls
    jdt-language-server
    rust-analyzer
    gopls

    # Formatters / toolchains
    stylua
    nixfmt
    prettierd
    shfmt
    clang-tools                 # clang-format
    go
    rustfmt

    # Useful development tools
    lazygit
    nodejs
    php
    jdk
    cargo
  ];
}
