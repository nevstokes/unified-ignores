# Unified ignores

I'm fed up of having several ignore files littering my repositories.

This zsh plugin will automatically generate individual ignore files on directory change.

## Installation
Install using [Antibody](https://getantibody.github.io/usage/), [Antigen](http://antigen.sharats.me/) or manually adding to your zsh plugin directory.

## Usage
See the example `.ignore.yaml` file in this repository and create one for your own project.

Ensure that your unified ignore file contains an entry under the `git` key for the generated individual ignore files:

    git:
      - .*ignore

Note that this is a simple implementation and that advanced yaml features like aliases will not work.

## Customising
If you would like to use a different filename for unified ignores, define the `UNIFIED_IGNORE_FILENAME` variable in your `.zshrc`.
