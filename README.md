# action-hello-world-docker
From [Github's Example Documentation](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-a-docker-container-action) 

# Hello world docker action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

### `os`

The operating system that ran the action.

## Example usage

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'