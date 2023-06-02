# shortcut
cli CDPATH manipulation tool 

## Usage 

```
./shortcut.sh add ~/dog dog  #adds folder dog with the custom name dog 
./shortcut.sh . #adds current directory. Will use basename
./shortcut.sh remove all #removes all shortcuts
./shortcut.sh remove __dog #removes particular shortcut

cd __<TAB> #autocomplete shortcuts
```

Notes: 
`__` is the default `SHORTCUT_PREFIX`