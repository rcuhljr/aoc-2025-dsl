# AoC 2025 - A Domain Specific Language

## Usage
Write a problem statement in a `.a25` file, then pass it to the solver to process.

```
  ruby .\solve.rb day1.a25
```

### General Language Constructs
Unless otherwise specified, all keywords must be at the start of line and match exactly.

* `DEBUG ON`/`DEBUG OFF` - Enable/Disable engine debugging at the current script point
* `PRINT "A message with $INTERPOLATION"` - Display a given message, specified variables can be inserted as desired
* `#Comments` - Any line starting with a # is ignored

### Day 1 DSL Specification

* `RESET_DIAL` - turn dial to 50, reset password counting
* `SPIN >>` - Begin a block of spin instructions on the following line
* `L#`/`R#` - Rotate the dial left or right a given number (#) of clicks
* `<< SPUN` - Stop reading spin instructions
* `$PASSWORD` - Variable of the current password value