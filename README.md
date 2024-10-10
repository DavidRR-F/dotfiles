# Minimal Cross-Platform Dotfiles

| Tool | Windows | Linux | 
|:-----|:--------|:------|
| terminal | wezterm | wezterm |
| shell | powershell | bash |
| editor | neovim | neovim | 
| window manager | glazewm | hyperland |

### Installation

#### **Clone the Repository**:

```bash
$ git clone https://github.com/DavidRR-F/dotfiles.git ~/.dotfiles
```

#### **SymLink Configuration**:

##### Download Dotter Binaries

```bash 
curl -L -o ~/.dotfiles/dotter https://github.com/SuperCuber/dotter/releases/download/<version>/<platform>
```

Create `.dotter/local.toml`

##### If Linux

```toml
includes = [".dotter/include/linux.toml"]
packages = ["shell", "terminal", "editor", "twm", "tui"]
```

##### If Windows

```toml
includes = [".dotter/include/windows.toml"]
packages = ["shell", "terminal", "editor", "twm", "tui"]
```

##### Run dotter

```bash
cd ~/.dotfiles
./dotter --force
```

### Vim Stuff I always forget

##### Insert Mode 

- `I` insert to front of line
- `a` append at cursor 
- `A` append the end of line
- `o` insert newline below
- `O` insert newline above

##### Visual Mode

###### Highlight between characters

- vi<character> (inside)
- va<character> (around)
- viw (word)
- * or # (highlighed to search)

###### You don't need multiple cursors

1. Change word at n positions.
```
/word
cgn 
new text
. (n times)
```

2. Change a visual block

```
/word 
<C-V> 
2j (2 being n down)
I (or A to append)
new text
```

3. Insert/Append to multiple lines 

```
<S-V>
:'<,'>normal A<text> (or :'<,'>normal I<text>)
```

##### File Parsing

1. Remove lines with just whitespace

```
:g/^\s*$/d
```

2. Remove all after prefix

```
:%s:<prefix>.*::g
```

- %: Refers to the entire file.
- s:: This starts the substitution command.
- //.*: This pattern matches // followed by any characters until the end of the line.
- ::g: This replaces the matched pattern with nothing (i.e., removes it) and g applies it globally in each line.

##### Search 

- `n` next occurrence 
- `N` prev occurence
