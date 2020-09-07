#!/bin/bash
shutdown 30
if zenity --question \
--title="Shutdown" \
--text "Shutting down in 30s..." \
--ok-label="Now" \
--cancel-label="Cancel"
then
	shutdown 0
else
	shutdown -c
fi
