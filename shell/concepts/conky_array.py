import sys, os

#  data="faecher/"
dir_path = os.path.dirname(os.path.realpath(__file__))
#  directory=os.path.join(dir_path, data)

tdir=sys.argv
print(tdir)

construct=["pointer to curr conk, #pos", "curr file", "# dirs", "# files", "files", "#files 2..", "files in 2"]

tdir= os.path.join(dir_path, tdir)
tdirs=next(os.walk(tdir))[1]

def gentail(dir):
    fdir=next(os.listdir(dir))
    i=0
    sub_arr=["# files"]
    for fn in fdir:
        i=+1
        sub_arr.append(fn)
    return sub_arr[0]=i

construct[3]=tdirs

for x in tdirs:
    xr=gentail(x)
    construct.append(xr)

print(construct)
