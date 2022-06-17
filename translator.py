#!/usr/bin/python

from os import popen


def execute(command):
    return popen(command).read()


print(execute("figlet 'Translate'"))
print("")

while True:
    sentence = input("> ")
    language = execute(f'trans -identify "{sentence}" 2> /dev/null | head -n 1')
    if "English" in language:
        print(
            "\n"
            + execute(
                f'trans -s english -t pt-PT -show-original n "{sentence}" 2> /dev/null'
            )
            + "\n"
        )
    else:
        print(
            "\n"
            + execute(
                f'\ntrans -s pt-PT -t english -show-original n "{sentence}" 2> /dev/null'
            )
            + "\n"
        )
