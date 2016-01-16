#!/usr/bin/env python
# Copyright (c) 2014, Stanford University
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import sys
import tempfile
import cProfile

def runCmd(jsonInFile):
    outFullPath = tempfile.TemporaryFile
    jsonConverter = JSONToRelation(InURI(jsonInFile),
                                   OutputFile(outFullPath,
                                              OutputDisposition.OutputFormat.SQL_INSERT_STATEMENTS,
                                              options='wb'),  # overwrite any sql file that's there
				              mainTableName='EdxTrackEvent'
                                   )
    jsonConverter.setParser(EdXTrackLogJSONParser(jsonConverter, 
						  'EdxTrackEvent', 
						  replaceTables=args.dropTables, 
						  dbName='Edx'
						  ))
    jsonConverter.convert()


if __name__ == '__main__':
    
    if len(sys.argv) < 2:
      print("Usage: speedTest.py <jsonInputFile>")
      sys.exit()

cProfile.run('runCmd, sys.argv[1]')
