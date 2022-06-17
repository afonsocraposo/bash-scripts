#!/usr/bin/python

from subprocess import PIPE, Popen

from os import popen


def execute(command):
    p = Popen(command, shell=True, stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    stdout = stdout.decode("utf-8")
    stderr = stderr.decode("utf-8")
    if stderr != "":
        print(stderr)
    return stdout


print(execute("figlet 'Translate'"))
print("")

sentence = None
while True:
    try:
        sentence = input("> ")
    except KeyboardInterrupt:
        break

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
