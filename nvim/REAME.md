`:noa w`: Save file without any auto command (useful for large files)

https://github.com/neovim/neovim/wiki/FAQ#backtrace-macos--osx
https://github.com/nvim-lua/plenary.nvim#plenaryprofile
How to dbg neovim: https://www.reddit.com/r/neovim/comments/lnd22u/comment/gnzz5ok/?utm_source=share&utm_medium=web2x&context=3

## Debugging

1. `<leader>db` to add a breakpoint.
2. If you have a `.vscode/launch.json` for your project, run `:DapLoadLaunchJSON` to load it.
3. `F5` to start the program.
4. `F10` step over
5. `F11` step into
6. `F12` step out
