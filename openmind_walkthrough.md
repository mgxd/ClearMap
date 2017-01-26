As far as python packages go - I would suggest installing just what you need. Probably just:
conda install cython opencv h5py natsort scikit-learn numpy 
and 
pip install tifffile

Feel free to ask any questions!

# Running ClearMap on Openmind
---
#### Installing this repo
```
git clone git@github.com:mgxd/ClearMap.git
```
* if you haven't generated ssh keys for openmind, you can find out how to [here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/#platform-linux).

Ilastik and the supplemental mouse brain materials are too big to put on github - but you can copy them from my directory on openmind. Cd into /location/of/this/clearmap/repo and type `scp -r /om/user/mathiasg/mouse_brain_files .`. For Ilastik, I would first make a new directory 'ilastik' and then `scp /om/user/mathiasg/ilastik/ilastik-1.1.9-Linux.tar.gz  ./ilastik`

You will need to install Elastix for the realignment - the binary is included in the repo.
To install:
```
cd elastix/
tar -xjf elastix_linux64_v4.8.tar.bz2
```
Ilastik is optional, but you can install the same way, just use `tar -zxvf ilastik-1.1.9-Linux.tar.gz` instead.

Once these are installed, specify the variables `ElastixPath` and `IlastikPath` in `ClearMap/Settings.py`.

Now it's time to change the parameter file - found in `ClearMap/Scripts`: 
* either `parameter_file_Ilastik_template.py` or
* `parameter_file_template.py`

depending on if you want to use Ilastik or not. You will want to change the variables `BaseDirectory` and `resource_dir`.

---
#### Running on openmind
The file `run_clearmap.sh` allows you to run the `process_template.py` using openmind's vast computing resources. Before running - check that the path in the script is actually the script you want to run (That is, if using Ilastik, change the path to `process_Ilastik_template.py` instead).

To run, the script requires 6 cpus and 200GB of memory. We request these resources in the script - you shouldn't have to change these as it will run. To submit the job on SLURM, our resource manager, type `sbatch run_clearmap.sh`. If there are resources available, you should get a message that says the job has been submitted. To check if your job is running, you can type `squeue -u <yourusername>`. If you see a job with name 'clearmap' and under 'ST' it says 'R' - it's running! If nothing is there, then it either finished or something went wrong. Luckily, the script will produce 2 files:
- `output_clearmap.out` - this prints out the output of the script (basically what it is doing at every step)
- `error_clearmap.err` - this logs any error messages that come out (very useful for debugging when things don't go as planned).

### If you run into any problems - feel free to email mathiasg@mit.edu
