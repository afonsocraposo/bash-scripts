#!/bin/sh

MBSYNC=$(pgrep mbsync)
NOTMUCH=$(pgrep notmuch)

if [ -n "$MBSYNC" -o -n "$NOTMUCH" ]; then
   echo "Already running one instance of mail-sync. Exiting..."
         exit 0
fi

echo "Syncing email"
mbsync -a

echo "Tagging notmuch new"
notmuch new

PERSONAL="afonsocraposo|afonsale|afonsoacr|tecnico|afonso-scientisst"
SCIENTISST="admin|developer|info|social"

echo "Tagging notmuch personal"
notmuch tag +personal folder:\""/(${PERSONAL})/"\"
echo "Tagging notmuch scientisst"
notmuch tag +scientisst folder:\""/(${SCIENTISST}-scientisst)/"\"

echo "Archiving messages sent from:afonso@craposo.com to:afonsocraposo@gmail.com"
notmuch search --format=text0 --output=files path:/afonsocraposo/INBOX/ from:afonso@craposo.com to:afonsocraposo@gmail.com | xargs -0 -I {} --no-run-if-empty mv -v {} ~/Mail/afonsocraposo/Archive/cur

echo "Tagging notmuch archived as read"
notmuch tag -unread tag:unread and folder:/Archive/

echo "Checking for new messages"
NEW_EMAILS=$(notmuch count tag:new and tag:unread and folder:/INBOX/ and tag:personal)
UNREAD_EMAILS=$(notmuch count tag:unread and folder:/INBOX/ and tag:personal)
ACCOUNTS=$(notmuch show --body=false tag:new and tag:unread and folder:/INBOX/ and tag:personal | sed -n "s/^.*\/Mail\/\([A-z\-]*\)\/.*$/\1/p" | sort | uniq | tr '\n' ' ')

if [ "$NEW_EMAILS" -ne "0" ]; then
    echo "Triggering notification"
    notify-send -t 3000 -i '/usr/share/icons/Papirus-Dark/128x128/apps/email.svg' "${NEW_EMAILS} new | ${UNREAD_EMAILS} unread" "${ACCOUNTS}"
fi
