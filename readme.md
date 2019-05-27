# Mind

## Dev

### Pycharm
Configure structure, so that intellisense is working
* File -> Settings -> Project -> Project Structure
* Select mind and add as a source

Configure project interpreter so possible to run the UT
* File -> Settings -> Project -> Project Interpreter
* Add new

Configure requirements file, so automatically installed for testing
* File -> Settings -> Tools -> Python Integrated Tools -> Packaging
* mind/img/files/requirements.txt

### CLI
```bash
# Build the docker image
cd mind/img
./build.sh true true
cd ..

# Execute presubmit verification in docker
cd bin
./psv.sh

```