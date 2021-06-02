rvm default

#
# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
#

function __check_nvm --on-variable PWD --description 'Do nvm stuff'
  if test -f .nvmrc
    set node_version (nvm version)
    set nvmrc_node_version (nvm version (cat .nvmrc))

    if [ $nvmrc_node_version = "N/A" ]
      nvm install
    else if [ $nvmrc_node_version != $node_version ]
      nvm use
    end
  end
end

__check_nvm
