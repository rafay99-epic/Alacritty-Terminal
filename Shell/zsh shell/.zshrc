# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
function display_Message() 
{
    figlet -c -w 200 -k "Scarlet  Speedester"
    echo '---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
    echo " "
    neofetch
}
display_Message
#figlet Welcome Speedester 
#neofetch
