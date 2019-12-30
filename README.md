# action-hello-world-docker
From [Github's Example Documentation](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-a-docker-container-action) 

# Hello world docker action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

### `staging-dir`

**Required** The directory where files can be shared.

## Outputs

### `message`

The hello world message passed back.

### `time`

The time we greeted you.

### `os`

The operating system that ran the action.

### `file`

The file that contains the message shared in the `staging dir`.

## Example usage

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'
  staging-dir: '${{ github.workspace }}'
run: cat ${{ steps.hello.outputs.file }} # prints `Hello AutoModality`
run: echo "The message is ${{ steps.hello.outputs.message }}" # prints `Hello AutoModality`