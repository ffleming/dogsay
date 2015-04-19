# Dogsay
[![Gem Version](https://badge.fury.io/rb/dogsay.svg)](http://badge.fury.io/rb/dogsay)
[![Build Status](https://travis-ci.org/ffleming/dogsay.svg?branch=master)](https://travis-ci.org/ffleming/dogsay)
[![Code Climate](https://codeclimate.com/github/ffleming/dogsay/badges/gpa.svg)](https://codeclimate.com/github/ffleming/dogsay)
[![Test Coverage](https://codeclimate.com/github/ffleming/dogsay/badges/coverage.svg)](https://codeclimate.com/github/ffleming/dogsay)

It's like cowsay, but with a dog.

## Installation
```
% gem install dogsay
```

## Usage
```
% dogsay Woof
                          _            +--------------------------------------+
                        ,:'/   _..._   |                 Woof                 |
                       // ( `""-.._.'  +--------------------------------------+
                       \| /    6\___  /
                       |     6      4
                       |            /
                       \_       .--'
                       (_'---'`)
                       / `'---`()
                     ,'        |
     ,            .'`          |
     )\       _.-'             ;
    / |    .'`   _            /
  /` /   .'       '.        , |
 /  /   /           \   ;   | |
|  \  |            |  .|   | |
  \  `"|           /.-' |   | |
   '-..-\       _.;.._  |   |.;-.
         \    <`.._  )) |  .;-. ))
         (__.  `  ))-'  \_    ))'
             `'--"`       `"""`
```
or
```
% fortune | dogsay
                          _            +--------------------------------------+
                        ,:'/   _..._   |   Till then we shall be content to   |
                       // ( `""-.._.'  |        admit openly, what you        |
                       \| /    6\___  /|  (religionists) whisper under your   |
                       |     6      4  | breath or hide in technical jargon,  |
                       |            /  | that the ancient secret is a secret  |
                       \_       .--'   | still; that man knows nothing of the |
                       (_'---'`)       |   Infinite and Absolute; and that,   |
                       / `'---`()      |  knowing nothing, he had better not  |
                     ,'        |       |   be dogmatic about his ignorance.   |
     ,            .'`          |       | And, meanwhile, we will endeavour to |
     )\       _.-'             ;       |  be as charitable as possible, and   |
    / |    .'`   _            /        | whilst you trumpet forth officially  |
  /` /   .'       '.        , |        | your contempt for our skepticism, we |
 /  /   /           \   ;   | |        |  will at least try to believe that   |
|  \  |            |  .|   | |         |   you are imposed upon by your own   |
  \  `"|           /.-' |   | |        |    bluster. - Leslie Stephen, "An    |
   '-..-\       _.;.._  |   |.;-.      |   agnostic's Apology", Fortnightly   |
         \    <`.._  )) |  .;-. ))     |             Review, 1876             |
         (__.  `  ))-'  \_    ))'      +--------------------------------------+
             `'--"`       `"""`
```

If you're feeling saucy, you can try out `dinosay` as well.

## Configuration

Edit `.dogsay` in your home directory.  It is a Yaml file that looks something
like this:
```yaml
:pose: :small
:justify: :center
:strip: :true
:text_width: 35
```

The full options (though some, like `:raw`, are incompatible with others, like
`:justify`) are:
```yaml
:pose: <see dogs directory or use dogsay --list>
:justify: <:ljust|:center|:rjust>
:strip: <true|false>
:raw: <true|false>
:text_width: <integer>
```

Note that you can't set `:animal` in your dotfile, as if you want a dog you use
 `dogsay` and if you want a dinosaur you use `dinosay`.

## Contributing

1. Fork it ( https://github.com/ffleming/dogsay/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Acknowledgments

* `default.dog` by 'dgs' at [Ascii-art.de](http://www.ascii-art.de/ascii/def/dogs.txt)
* `small.dog` from [Ascii-art.de](http://www.ascii-art.de/ascii/def/dogs.txt)
* `sit.dog` from [AsciiWorld.com](http://www.asciiworld.com/-Dogs-.html)
* `running.dog` from [AsciiWorld.com](http://www.asciiworld.com/-Dogs-.html)
* `gsd.dog` by 'hrr' at [chris.com](http://www.chris.com/ascii/index.php?art=animals/dogs)
* `default.dino` by `CJ` at [retrojunkie.com](http://www.retrojunkie.com/asciiart/animals/dinos.htm)
* `small.dino` by `PapaJ` at [retrojunkie.com](http://www.retrojunkie.com/asciiart/animals/dinos.htm)
