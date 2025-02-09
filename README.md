### Dotter Installation

#### **Clone the Repository**:

```bash
$ git clone https://github.com/DavidRR-F/dotfiles.git ~/.dotfiles
```

#### **SymLink Configuration**:

##### Download Dotter Binaries

```bash 
curl -L -o ~/.dotfiles/dotter https://github.com/SuperCuber/dotter/releases/download/<version>/<platform>

or

scoop install main/dotter
```

Create `.dotter/local.toml`

`Optional exclude packages you dont want to use`

##### Run dotter

```bash
cd ~/.dotfiles
./dotter --force

# if using package managed version

dotter --force
```

### Vim Stuff I always forget

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

3. CTag Regex

- :tag main jumps directly to the tag “main”
- :tag /^get jumps to the tag that starts with “get”
- :tag /Final$ jumps to the tag that ends with “Final”
- :tag /norm lists all the tags that contain “norm”, including “id_norm”
- :tag /Final$\C lists all the tags that end with “Final” (Doesn’t match “Cipher_final” or “SHA_FINAL”)

