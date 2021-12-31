#!/usr/bin/env python3
import subprocess as sp
import os
import configparser

conf = configparser.ConfigParser()
conf.read('ots.conf')


fzf_config = ''' --bind "ctrl-x:clear-query" \
--bind "ctrl-s:clear-selection" \
--bind "ctrl-r:reload(grep -roPh --exclude-dir={.obsidian} --include \*.md '\B#[^# ][\w\/-]+' | sort -u)" '''

def main():
	def start():
		os.chdir(f'''{conf['default']['vault_path']}''')
		vmName = sp.getoutput(f'''grep -roPh --exclude-dir ={{.obsidian}} --include \*.md '\B#[^# ][\w\/-]+' | sort -u | fzf -m {fzf_config} --height 40% --reverse > /dev/tty 2>&1 >/tmp/tmpfile  && cat /tmp/tmpfile | cat   && rm /tmp/tmpfile  ''')
		return vmName.replace('\n', ' ')

	selection_joint = ''

	for i in start().split(' '):
		selection_joint += f'tag:{i[1:]} '

	os.system(
		f'''{conf['default']['obsidian_app_path']} "obsidian://search?vault={conf['default']['vault_name']}&query={selection_joint}" 2>/dev/null ''')

while True:
	choice =input('new search(Y/n): ')
	if choice =='Y'or choice =='y' or choice =='':
		main()
	else:
		break

