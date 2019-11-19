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
  plt.yscale("log")
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

def speedup():
  ts = [0.0359, 0.066, 0.1078, 0.1622, 0.231, 0.3214, 0.4299, 0.5561, 0.7]
  tp = [14.4295, 21.5213, 26.4939, 30.959, 38.3575, 45.5876, 57.9531, 59.5674, 72.9642]
  order = [2, 3, 4, 5, 6, 7, 8, 9, 10]
  speedup = [x / y for x, y in zip(ts, tp)]

  fig, ax = plt.subplots()
  ax.set_ylabel('Speedup')
  ax.set_xlabel('Order (q)')
  ax.plot(order, speedup, 'o-', markersize=2)
  fig.tight_layout()
  plt.show()

# analyze('../results/data/error_global/comunes')
speedup()
# localAsimetrico()