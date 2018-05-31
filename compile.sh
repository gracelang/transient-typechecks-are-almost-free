#!/bin/bash

cd latex && make > /dev/null 2>&1 && cp paper.pdf ../paper.pdf && make clean && cd ..

