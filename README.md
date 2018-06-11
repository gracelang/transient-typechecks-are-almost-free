# Alive Typing For Grace

A manuscript on how we provide support for Grace's gradual-structural type system without destroying performance.

## Details

This project using LaTeX to generate the paper. To compile the project, simply run `./compile.sh` from the root directory of this project.

The content of the paper is divided into an [outlines](https://github.com/richard-roberts/AGTFG/tree/master/outlines) (bullet points denoting the structure of the paper) and [prose](https://github.com/richard-roberts/AGTFG/tree/master/content) (the actual content of the paper).

The [configuration file](https://github.com/richard-roberts/AGTFG/blob/master/latex/config.tex) contains conditional expressions that can be used to toggle the outlines and content on and off (as well as further conditionals for toggling each section of the paper). This is useful to reduce compilation time when focused on structural (or just one section).

Finally, the [commands file](https://github.com/richard-roberts/AGTFG/blob/master/latex/commands.tex) contains commands that have been introduced for this paper, such as the commands for each author add color-coded notes. Feel free to add your own commands there.




