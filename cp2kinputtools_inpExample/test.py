import cp2k_input_tools.parser 
parser = cp2k_input_tools.parser.CP2KInputParserSimplified() 
fname = 'hit2.inp'   # use to see the 2nd error
fname = 'hit.inp'
with open(fname, 'r') as f:
    input_tree = parser.parse(f)
