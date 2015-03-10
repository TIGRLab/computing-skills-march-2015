| Task     | Command | 
|----------|---------|
| Show your current path | `pwd` | 
| List the contents of a folder | `ls`, eg. `ls` or `ls /home` |
| Change directory | `cd directory`, e.g. `cd /home/` | 
| Move/rename a file | `mv from to`, e.g. `mv data/genome.dat genomes/S001_genome.dat` | 
| Remove a file | `rm file` or `rm -rf dir/`; use `-i` for confirmation | 
| Make an empty file | `touch`, e.g. `touch commands.sh` |  
| Edit a file | `nano file`, e.g. `nano commands.sh` |  
| Show contents of a file | `cat file` or `less file`, e.g. `cat commands.sh` | 
| History of commands | `history`, or the arrow keys | 
| Command help | `man command`, or `command --help`, or `command -h` | 
| Connect to remote computer | `ssh username@hostname`, e.g. `ssh jp@scc.camh.net` | 
| Number of lines in a file | `wc -l file` | 
| Sort lines in a file | `sort file`, or numerically `sort -n file` | 
| Find lines in a file | `grep pattern file`, e.g. `grep M demographics.csv` | 
| Connect commands together | `command1 PIPE command2`, e.g. `grep M file PIPE sort` |
| Save output to a file | `command > file`, e.g. `sort file > sorted-file.txt` | 
| Loop through a list | `for var in list; do stuff; done` e.g. `for i in 1 2 3; do echo ${i}; done | 
| Find the last part of a path | `basename path`, e.g. `basename data/S013` | 
