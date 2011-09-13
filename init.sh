#!/bin/bash

#Get solarized colors
#!/bin/bash



#SOLARIZED Colors for mintty
if [[ $OS = Windows* ]]; then
    rm sol\.{dark,light}
    wget --no-check-certificate https://github.com/mavnn/solarized/raw/master/mintty-colors-solarized/sol.dark
    wget --no-check-certificate https://raw.github.com/mavnn/solarized/master/mintty-colors-solarized/sol.light
fi

#Copy the two files into a directory in your home (for example .solar) and add one of the following lines to your .bashrc file:
#source ~/.solar/sol.light
#or
#source ~/.solar/sol.dark
#Color schemes can be swapped interactively using the same commands.
