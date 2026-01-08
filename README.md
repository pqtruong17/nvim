## Installation
```sh
git clone -b linux https://github.com/pqtruong17/nvim ~/.config/nvim
```

## iostream is not found

# Check for the selected GCC installation
'''sh
clang++ -v
_Ubuntu clang version 18.1.3 (1ubuntu1)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/10
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/11
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/12
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/13
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/14
Selected GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/14
Candidate multilib: .;@m64
Selected multilib: .;@m64
Found CUDA installation: /usr/lib/cuda, version 12.0
'''

# Mine is libstdc++-14-dev as shown above

'''sh
sudo apt install libstdc++-14-dev
'''

## python3 failed with exit code 1 and signal 0
```sh
sudo apt install -y python3-venv
```

## Neovim Keybindings

### Telescope Keybindings
| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Telescope buffers |
| `<leader>fh` | Telescope help tags |
| `<leader><leader>` | Open recent files |

### Neo-tree Keybindings
| Keybinding | Action |
|------------|--------|
| `<C-n>` | Reveal filesystem in Neo-tree (left) |
| `<leader>bf` | Reveal buffers in Neo-tree (floating) |

### Clang-format Keybindings
| Keybinding | Action |
|------------|--------|
| `<leader>gf` | Format with null-ls (floating) |
