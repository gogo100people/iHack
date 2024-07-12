inpage=0
backurl=""
clear
echo "********"
echo "* Menu *"
echo "********"
echo "1 › Web"

echo -n "› "
read choice

web() {
  read -p "https://www." page

  webmenu() {
    clear
    echo "\033[38;5;214mCTRL+<SLASH> › Search/URL"
    echo "CTRL+<PLUS> › New Tab UNUSABLE"
    echo "CTRL+<MINUS> › Close Tab UNUSABLE"
    echo "CTRL+<ARROW> › Switch Tab UNUSABLE"
    echo "CTRL+R › Reload\033[0m"

    if [[ -e "pagedata/$page" ]]; then
      cat pagedata/$page
    else
      curl -sS https://www.$page | pandoc -f html -t plain >> pagedata/$page # Run if the page is not already in the pagedata folder.
      cat pagedata/$page
    fi
    read -p "" blnk
    # Run the menu again
    webmenu
  }

  webmenu
}

# Check if the user entered a valid choice
case $choice in
  1) web;;
  *) echo "Invalid choice";;
esac
# Go back to the main menu
echo -n "Press enter to go back to the main menu"
read
clear
exec ./ihack.sh
