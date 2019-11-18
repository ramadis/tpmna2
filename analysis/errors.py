import glob
import matplotlib.pyplot as plt
import os

class Test:
  def __init__(self, hs, errs, name):
    self.hs = hs
    self.errs = errs
    self.name = name

def parseFile(filename):
  lines = [line.rstrip('\n') for line in open(filename)]
  hs = [float(i) for i in lines[0].split("\t")] 
  errs = [float(i) for i in lines[1].split("\t")] 
  name = os.path.basename(filename).split('.')[0]
  return Test(hs, errs, name)

def parseDirectory(directory):
  return [parseFile(f) for f in glob.glob(directory + '/*')]

def analyze(directory):
  tests = parseDirectory(directory)
  fig, ax = plt.subplots()

  for test in tests:
    ax.set_ylabel('Error Global')
    ax.set_xlabel('Paso (h)')
    ax.plot(test.hs, test.errs, 'o-', label=test.name, markersize=2)

  fig.tight_layout()
  ax.legend()
  # plt.yscale("log")
  # saveFig(fig, 'comparison_graph')
  plt.show()

def localAsimetrico():
  # h=0.01
  orders = [2,3,4,5,6]
  errs = [64.6796, 63.6937, 45.4015, 47.5083, 32.3724]
  fig, ax = plt.subplots()
  ax.set_ylabel('Error Local')
  ax.set_xlabel('Order (q)')
  ax.plot(orders, errs, 'o-', markersize=2)
  fig.tight_layout()
  ax.legend()
  plt.show()



# analyze('../results/data/error_global/afines/simetrico')
localAsimetrico()