# Simon's Gui Dotfiles

These are my personal dotfiles for gui apps, however other people are welcome to use them as they see fit.
The dotfiles are organized in such a way to be able to use gnu stow to install them, this means that each application has its own directory, and the root of each application directory should be treated as your home directory (~/).

## Install

I use GNU stow to install my dotfiles, it will create the required symlinks for you. GNU Stow should be available in most repositories.

Clone the repository wherever you want (I like to keep it in `~/.dotfiles`).

```bash
git clone https://github.com/simonhughcom/dotfiles.git && cd dotfiles && stow -t ~/ */
```


