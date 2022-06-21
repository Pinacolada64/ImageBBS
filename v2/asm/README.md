# README

Some handy regexes to format source code in Kate:

`(:)(\S) -> \n\t\2` Search for : not followed by whitespace, replace with newline and tab

## Label files

Vice can also load label files created by the Acme assembler. Their syntax is e.g.
`labelname = $1234 ; Maybe a comment`. A dot will be added automatically
to label names assigned in this way to fit to the Vice label syntax.

To change Windows' CR/LF line endings to Linux's LF line endings: `wine c64list.exe <file.asm> -sym | dos2unix`

## Docker-based build

The `./v2/asm` directory can be built inside a Docker container to ease environment setup.

Prerequisites:
* Ensure you have Docker installed on your system.
* Ensure your user account is part of the `docker` group. Sample command: `sudo usermod -G docker -a $(whoami)`

Execute `./build.sh` to execute the build. Once the build completes, note the `*.bin` files in the current directory.
