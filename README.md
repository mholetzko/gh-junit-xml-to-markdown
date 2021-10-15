# Github action to convert a junit xml and uploads it the current action and wiki

## Inputs

## `path-to-junit-xml`

**Required** The path to the xml report to convert

## `upload-to-wiki`

**Optional** Shall we upload the converted markdown to the wiki

## Outputs

The action will print the markdown converted result to the current run
And optional - upload to wiki

## Example usage

uses: actions/gh-junit-to-markdown@v1
with:
path-to-junit-xml: '/reports/xml/reports.xml'
upload-to-wiki: true
