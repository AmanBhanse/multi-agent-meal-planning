### Create env

- mac:

  - `python3 -m venv env`
  - source env/bin/activate

- windows:
  - `python -m venv <env-name>`
  - `<env-name>/script/activate`

### Select python interpreter in vscode:

- open command palette :
  - windows : `crt + shift + P`
  - mac : `cmd + shift + P`
- Select python interpreter from your created env using menu

### Clean the ipynb file utility

- For mac
  - `chmod +x clean_notebook.sh`
  - `./clean_notebook.sh main.ipynb`
- For windows
  - `bash clean_notebook.sh main.ipynb`
