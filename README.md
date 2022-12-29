# UnitConverter
UnitConverter serves a quite simple purpose: transferring units of volume and weight (e.g. in recipes) from the US system to metric and back. 
These functions of conversion are produced by two commands named find(Imperial/Metric)Units, which are treating each instance of a unit separately according to conversion rules.

The supported units are:
US: pound, ounce, pint, quart, gallon, inch
Metric: liter, kilogram, gram, milligram, centimeter

To convert, call UnitConverter.find(Imperial/Metric)Units("and input your text here")

Dry fettuccine, 8 oz
Chopped bacon, 2 oz
Whole milk, 1 gallon
---
Dry fettuccine, 240 gr
Chopped bacon, 60 g
Whole milk, 4 l
