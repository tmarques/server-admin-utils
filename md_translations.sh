#!/bin/bash

rake md:errormsg
rake md:routes['pt-PT']
rake md:translate['pt-PT']
rake md:routes['pt-BR']
rake md:translate['pt-BR']
rake md:routes['es']
rake md:translate['es']
touch tmp/restart.txt
