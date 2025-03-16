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

##### Run dotter

```bash
cd ~/.dotfiles
./dotter -f -y -l .dotter/<os>.toml

# if using package managed version

cd ~/.dotfiles
dotter -f -y -l .dotter/<os>.toml
```

### Vim Stuff

#### Selecting

##### Motions
i -> between
a -> around
w -> word
W -> non whitespace

v<motion><open/close-charater>: visual select everything between open and close characters
y<motion><open/close-charater>: yank everything between open and close characters
d<motion><open/close-charater>: cut everything between open and close characters
c<motion><open/close-charater>: cut everything between open and close characters

gUw capitalize a word
guw lowercase a word
gUU calitalize line
guu lowercase line
~ in normal to capital or lowercase a letter

##### vim surround

cs<open/close-charater-source><open/close-charater-target>: change surrounding
ys<motion><open/close-charater-target>: add surrounding
ds<open/close-charater>: change surrounding

#### Navigation

f <character>: jump to next instance of character
F <character>: jump to prev instance of character
t <character>: jump to space before next instance of character
T <character>: jump to space after next instance of character

*Note*: , to jump back an instance ; to jump forward and instance

#### Formating

> .: indent . to continue
= or == in visual: auto indent lines
% in normal to jump between open and close charaters

#### Macros

q <character> to record macro
q to stop record
@ <character> to use macro
<number> @ <character> to use macro n times

Substitute string visual mode

```
'<,'>s/<source>/<replace>/g
```

Remove lines with just whitespace

```
:g/^\s*$/d
```

Remove all after prefix

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

