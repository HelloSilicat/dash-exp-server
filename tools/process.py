import os

root = "1/"

for filename in os.listdir(root):
    if "m4s" in filename:
        a = filename.split(".")[0]
        # a = root + a[:-2]+".m4s"
        a = root + root[0] + "_" + a + ".m4s"
        filename = root + filename
        print (filename, a)
        os.system("mv {} {}".format(filename, a))
