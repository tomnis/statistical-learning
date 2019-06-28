#!/bin/bash
docker run -it -v $(pwd)/data:/data -v $(pwd)/src:/src  r-base
