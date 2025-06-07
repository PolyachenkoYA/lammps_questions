import cclib

log = cclib.io.ccopen('single_E.log').parse()

print(log.metadata['functional'])
