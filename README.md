# Obsidian-tags-hunter
 Using fzf to fast search and select tags and open them in Obsidian search pane

## Mechanism
1. Reading conf file for the vault 
2. Using grep and fzf to find all (Obsidian tag like)
3. Piping the result to fzf that can multi select from the list.
4. Open select/selected tags inside obsidian using Obsidian URI



## Installation:
1. Clone Repo
2. edit ots.conf by adding vault name, vault path and obsidian app path.


### PS
do not use (') or (") around vault name nor paths!
 




