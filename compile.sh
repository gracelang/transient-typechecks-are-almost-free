#!/bin/bash

cd latex && make && cp paper.pdf ../paper.pdf && make clean && cd ..

