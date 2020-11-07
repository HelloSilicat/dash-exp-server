import os
import numpy as np


def cal_avg_br(root):
    ret = 0.0
    l = 0
    for filename in os.listdir(root):
        if "m4s" in filename:
            l += 1
            ret += os.path.getsize(root+filename) / 1000
    return ret * 8 / (l * 1.06) 


def get_seg_id(name):
    return name.split(".")[0].split("-")[-1]


def get_dels(root):
    size = {}
    s = []
    for filename in os.listdir(root):
        if "m4s" in filename:
            size[filename] = os.path.getsize(root+filename) / 1000
            s.append(size[filename])

    lower = np.percentile(s, 3)
    upper = np.percentile(s, 93)

    dels = []
    for k in size:
        if size[k] < lower or size[k] > upper:
            dels.append(get_seg_id(k))
    
    return dels


def rm_files(root, dels):
    if not os.path.exists("temp"):
        os.system("mkdir temp/")
    for filename in dels:
        realname = "{}_seg-{}.m4s".format(root[0], filename)
        os.system("mv {}{} temp/{}".format(root, realname, realname))


def reset_index(root):
    cur = 1
    ids = []
    for filename in os.listdir(root):
        if "m4s" not in filename:
            continue
        ids.append(int(get_seg_id(filename)))

    for i in sorted(ids):
        before = "{}_seg-{}.m4s".format(root[0], i)
        after =  "{}_seg-{}.m4s".format(root[0], cur)
        # print(before, after)
        if before != after:
            os.system("mv {}{} {}{}".format(root, before, root, after))
        cur += 1


def append_prefix(root):
    for filename in os.listdir(root):
        if "m4s" not in filename:
            continue
        i = get_seg_id(filename)
        before = "seg-{}.m4s".format(i)
        after =  "{}_seg-{}.m4s".format(root[0], i)
        os.system("mv {}{} {}{}".format(root, before, root, after))
    


mode = "reset"

if mode == "append":
    append_prefix("1/")
    append_prefix("2/")
    append_prefix("3/")
    append_prefix("4/")
    append_prefix("5/")
elif mode == "del":
    dels = get_dels("1/")
    print(len(dels) * 1.0 / len(os.listdir("1")))

    rm_files("1/", dels)
    rm_files("2/", dels)
    rm_files("3/", dels)
    rm_files("4/", dels)
    rm_files("5/", dels)
elif mode == "cal":
    print(cal_avg_br("1/"))
    print(cal_avg_br("2/"))
    print(cal_avg_br("3/"))
    print(cal_avg_br("4/"))
    print(cal_avg_br("5/"))
elif mode == "reset":
    reset_index("1/")
    reset_index("2/")
    reset_index("3/")
    reset_index("4/")
    reset_index("5/")
    
    
    
  


