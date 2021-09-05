#!/bin/sh

while curl https://covid19.min-saude.pt/pedido-de-agendamento/ -s | grep "Tem 23 ou mais anos" -q 
do
    sleep 30
done

echo "VACINAS!" | msmtp --account=afonsocraposo gonced8@gmail.com

dunstify "VACINA" "20 ANOS OU MAIS" -u critical 

for it in {1..1000}; do tput bel; sleep 0.5; done

exit 0
