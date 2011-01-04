#!/usr/bin/env python2
# MicroProgrammino per decidere le squadre della partita di 
# Munckin del 22/12/2010
# Written by Enrico Carlesso in ~ 120 secondi

from random import randint 

class Person:
  def __init__(self, name):
    self.name = name

  def __repr__(self):
    return self.name

class Squadra:
  def __init__(self, i, p1, p2):
    self.index = i
    self.p1 = p1
    self.p2 = p2

  def __repr__(self):
    return "Squadra %d => %s %s" % (self.index, self.p1, self.p2)

p = ["Gheda", "Cesco", "Vecc", "Gabry", "Gian", "Acio", "Tubo", "Io"]

pp = [Person(i) for i in p]

s1 = Squadra(1, pp.pop(randint(0, len(pp) - 1)), pp.pop(randint(0, len(pp) - 1)))
s2 = Squadra(2, pp.pop(randint(0, len(pp) - 1)), pp.pop(randint(0, len(pp) - 1)))
s3 = Squadra(3, pp.pop(randint(0, len(pp) - 1)), pp.pop(randint(0, len(pp) - 1)))
s4 = Squadra(4, pp.pop(randint(0, len(pp) - 1)), pp.pop(randint(0, len(pp) - 1)))

for i in [s1, s2, s3, s3]:
  print i

