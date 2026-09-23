# count all the stuff in cxar
# important: run from the directory that the script is in
import os
from os.path import join,getsize
def pretty_num(v):
    if v > 1000: return f"{pretty_num(v//1000)},{v%1000}"
    return v%1000
def pretty_bytes(v):
    if v > 1000000: return f"{v//100000/10} MB"
    if v > 1000: return f"{v//100/10} KB"
    return f"{v} B"
num_files = 0
num_bytes = 0
for root,dirs,files in os.walk("."):
    num_files += len(files)
    num_bytes += sum([getsize(join(root, file)) for file in files])
print(f"number of files including unrelated junk: {pretty_num(num_files)} and the number of bytes in them: {pretty_bytes(num_bytes)}")
num_files_total = 0
num_files = 0
num_bytes = 0
for root,dirs,files in os.walk(join(".","WorldNodes","Nodes")):
    num_files_total += len(files)
    num_files += len(files)
    num_bytes += sum([getsize(join(root, file)) for file in files])
print(f"number of block types: {pretty_num(num_files)}")
print(f"number of bytes of worldgen code: {pretty_bytes(num_bytes)}")
num_files = 0
num_bytes = 0
for root,dirs,files in os.walk(join(".","WorldNodes","Helpers")):
    num_files_total += len(files)
    num_files += len(files)
    num_bytes += sum([getsize(join(root, file)) for file in files])
print(f"number of helper scripts: {pretty_num(num_files)}")
print(f"number of bytes of worldgen helper code: {pretty_bytes(num_bytes)}")