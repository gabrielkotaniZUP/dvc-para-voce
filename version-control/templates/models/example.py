from dvc.api import DVCFileSystem
import pickle

# opening a local repository
fs = DVCFileSystem("/path/to/local/repository")
# opening a remote repository
url = "https://github.com/iterative/example-get-started.git"
fs = DVCFileSystem(url, rev="main")

with fs.open("model.pkl") as f:
    model = pickle.load(f)

# reading a file
contents = fs.cat_file("get-started/data.xml")

# downloading a file locally
fs.get_file("data/data.xml", "data.xml")