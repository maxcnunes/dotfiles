VIM Commands
============

## Insert Mode
- `di<character>`: delete inside (eg. `di"`)
- `dt<character>`: delete until (eg. `dt"`)
- `%s=<old>=<new>=g`: find and replace

## Visual Mode
- `/g/<search>/<command>`: operate over selection (eg. `/g/console/d`)




- `"*y`: copy to clipboard
- `"*p`: paste to clipboard

- `:so ~/.vim/vimrc`: reload vim configuration


- `v` `a` `t` - seleciona uma tag e todo seu conteudo
- - `v` `i` `t` - seleciona todo o conteudo de uma tag

## Spell

* `:syntax off` - if is editing a programming language document is required to disable the syntax highlight
* `:set spell` - enable spell check
* `z=` - list suggested words

## Find and replace multiple files

```
:Ag foo
:cdo s/foo/bar/g | update
```
